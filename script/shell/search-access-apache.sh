cat $1 | cut -d " " -f1| sort | uniq -c| sort -nur
