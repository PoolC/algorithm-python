algorithm-python
========

알고리즘 채점기 python 입니다.

# Algospot Template script 
* https://github.com/PoolC/algorithm-python
* Linux Python 에 종속적인 스크립트로 작성 되었다. 다른 언어로 문제풀이를 하기 위해서는 스크립트 수정이 필요하다. 

# 사용 예시
사용자 입력은 bold 처리 하였다. 

## Git clone 받기

git clone을 받자. git 사용법을 모른다면 어딘가를 참고. 

### $ git clone https://github.com/PoolC/algorithm-python
```bash
 Cloning into 'algorithm-python'...
 remote: Counting objects: 14, done.
 remote: Compressing objects: 100% (12/12), done.
 remote: Total 14 (delta 1), reused 14 (delta 1)
 Unpacking objects: 100% (14/14), done.
```

### $ cd algorithm-python/
### ./algorithm-python$ ls
```bash
total 24
 drwxr-xr-x 4 user user 4096 Jul  2 02:01 ./
 drwxrwxr-x 3 user user 4096 Jul  2 02:01 ../
 drwxrwxr-x 8 user user 4096 Jul  2 02:01 .git/
 -rw-rw-r-- 1 user user  717 Jul  2 02:01 README.md
 drwxrwxr-x 2 user user 4096 Jul  2 02:01 _script/
 -rwxrwxr-x 1 user user 1128 Jul  2 02:01 template.sh*
```

## 문제 다운받기 

template.sh 를 실행해서 문제를 다운 받는다. 문제의 이름을 대문자로 써 주자. 

### ./algorithm-python$ ./template.sh 
```bash
 Usage: template.sh PROBLEM_NAME
```

### ./algorithm-python$ ./template.sh HELLOWORLD 
### ./algorithm-python$ cd helloworld/ 
### ./algorithm-python/helloworld$ ls 
```bash
 total 24
 drwxrwxr-x 2 user user 4096 Jul  2 02:02 ./
 drwxr-xr-x 5 user user 4096 Jul  2 02:02 ../
 -rw-rw-r-- 1 user user   73 Jul  2 02:02 answer.dat
 -rw-rw-r-- 1 user user   35 Jul  2 02:02 input.dat
 -rwxrwxr-x 1 user user  923 Jul  2 02:02 run.sh*
 -rwxrwxr-x 1 user user  226 Jul  2 02:02 solution.py*
```

## 문제 풀기

solution.py를 수정한다. 해당 파일에는 기본적으로 HELLOWORLD 문제에 대한 정답이 들어있다. 
해당 문제를 푼 코드를 가정하자. 

### ./algorithm-python/helloworld$ cat solution.py
```python
 #!/usr/bin/env python
 import sys
 rl = lambda: sys.stdin.readline()
 #f = open('input.dat', 'r')
 #rl = lambda: f.readline()
 #import pdb
 #pdb.set_trace()
 n = int(rl())
 for i in range(n):
  print "Hello, %s!" % rl().strip()
```

pdb를 사용하는 경우 stdin의 입력처리가 pdb의 명령커맨드로 처리되어 문제가 발생한다.  

주석을 참고하여 stdin이 아닌 file 입출력으로 코드를 변경하면, 해당 문제를 해결 할 수 있다.

## 정답 체크 
run.sh의 출력결과는 output.dat에 저장 되며, 실행할 스크립트를 변경하거나 입출력 및 정답 파일 명을 변경할 수 있다. 

### $ ./run.sh another_solution.py 
```bash
 ERROR: another_solution.py is not exists
 Usage: run.sh [solution.py] [input.dat] [answer.dat] [output.dat]
```

정답일 경우 아래와 같이 pass 라고 알려준다.

### ./algorithm-python/helloworld$ ./run.sh
```bash
 solution.py pass
```

오답일 경우 diff 명령어를 통해 차이를 보여준다. 

### ./algorithm-python/helloworld$ perl -pi -e 's/Hello/Bye/' answer.dat 
### ./algorithm-python/helloworld$ ./run.sh
```bash
 Hello, World!
 Hello, Algospot!
 Hello, Illu!
 Hello, Jullu!
 Hello, Kodori!
==========
 1,5c1,5 < Hello, World! < Hello, Algospot! < Hello, Illu! < Hello, Jullu! < Hello, Kodori! --- > Bye, World! > Bye, Algospot! > Bye, Illu! > Bye, Jullu! > Bye, Kodori!
```

## 정답 제출

poolc_push.sh 에서 script 이름을 수정하자 
https://github.com/PoolC/algospot 에 자동으로 push가 된다. 
다만 _poolc 경로에 https://github.com/PoolC/algospot 를 미리 checkout 받아두어야 하는 점에 주의하자
.git/config 파일에 github_id 와 github_pw 를 @: 로 구분하여 넣어주면 ID PW 저장이 가능하다 
Ex. url = https://[github_ID]:[github_PW]@github.com/PoolC/algospot

### ./algorithm-python$ ./poolc_push.sh boardcover
```bash
 Already up-to-date.
 # On branch master
 # Changes to be committed:
 #   (use "git reset HEAD <file>..." to unstage)
 #
 #       new file:   BOARDCOVER/doodoori2.py
 #
 [master e3960b1] BOARDCOVER doodoori2.py
  1 file changed, 96 insertions(+)
  create mode 100755 BOARDCOVER/doodoori2.py
  Username for 'https://github.com': doodoori2
  Password for 'https://doodoori2@github.com':
  To https://github.com/PoolC/algospot
     7fc5720..e3960b1  master -> master
 # On branch master
 		nothing to commit (working directory clean)
```

