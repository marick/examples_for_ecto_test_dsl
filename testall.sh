for d in $(ls -d */)
do
    (echo $d; cd $d; mix test)
done
