
const program = require('commander');
const chalk = require('chalk');
var inquirer = require('inquirer');
var fs = require("fs")
var exec = require('child_process').exec;
function execute(cmd) {

    exec(cmd, function (error, _stdout, _stderr) {
        if (error) {
            console.error(error);
        }
        else {
            console.log("success");
        }
    });

}

const ROOT_PATH = './';
const POST_PATH = ROOT_PATH + 'source/' + '_posts/';

program.version('0.0.1');

function dateFormat(fmt, date) {
    let ret;
    const opt = {
        "Y+": date.getFullYear().toString(),        // 年
        "m+": (date.getMonth() + 1).toString(),     // 月
        "d+": date.getDate().toString(),            // 日
        "H+": date.getHours().toString(),           // 时
        "M+": date.getMinutes().toString(),         // 分
        "S+": date.getSeconds().toString()          // 秒
        // 有其他格式化字符需求可以继续添加，必须转化成字符串
    };
    for (let k in opt) {
        ret = new RegExp("(" + k + ")").exec(fmt);
        if (ret) {
            fmt = fmt.replace(ret[1], (ret[1].length == 1) ? (opt[k]) : (opt[k].padStart(ret[1].length, "0")))
        };
    };
    return fmt;
}

function getBlankTemplate(blogName) {
    let date = new Date()
    let createTime = dateFormat("YYYY-mm-dd HH:MM", date);
    let content = "---\n";
    content += "title: " + blogName + "\n";
    content += "date: " + createTime + "\n";
    content += "tags: " + 'other' + "\n";
    content += "categories: " + 'other' + "\n";
    content += "---\n";
    content += "\n\n\n<!--more-->\n\n\n";
    return content;
}


inquirer
    .prompt([
        {
            name: 'switchGroup',
            type: 'string',
            message: 'please input group(default:other)',
            default: 'other',
        }, {
            name: 'postName',
            type: 'string',
            message: 'please input PostName',
            default: 'other',
        }
    ]
    )
    .then(answers => {
        let groupName = answers.switchGroup;
        let postName = answers.postName;

        console.log(chalk.blue(groupName));
        console.log(chalk.blue(groupName));

        var content = getBlankTemplate(postName);
        var haveDir = false
        try {
            var stat = fs.statSync(POST_PATH + groupName);
            haveDir = stat.isDirectory();
        } catch (error) {
            console.log(chalk.redBright("组目录不存在，准备创建"));
        }

        if (!haveDir) {
            fs.mkdirSync(POST_PATH + groupName);
            console.log(chalk.green("组目录创建成功"));
        }

        fs.appendFileSync(POST_PATH + groupName + '/' + postName + '.md',content);
        
        console.log("写入成功");

        console.log("code " + POST_PATH + groupName + '/' + postName + '.md');

        execute("code " + POST_PATH + groupName + '/' + postName + '.md');

        console.log(chalk.greenBright(content));

    });


