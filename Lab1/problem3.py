# 3.a

def is_set(lst):
    if len(lst)==0 or lst[0] in lst[1:]:
        return False

    elif len(lst) == 1:
        return True
    else:
        return is_set(lst[1:])

lst=[]
print(is_set(lst))

#3.b

def distinct(index,lst):
    
    if index==len(lst)-1 or len(lst)==0:
        return 0
    elif lst.count(lst[index])==1:
        return 1 + distinct(index+1,lst)
    else:
        return distinct(index+1,lst)

lst=[]
print(distinct(0,lst))

