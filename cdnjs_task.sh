#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

bash $DIR/the_actaul_task.sh >> ~/mycron.log 2>&1

