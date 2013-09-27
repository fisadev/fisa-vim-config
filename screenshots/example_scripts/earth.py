class Animal:
    def __init__(self):
        self.age = 0
        self.live()

    def live(self):
        print "i'm alive!"

class Human(Animal):
    def talk(self):
        print 'hello!'

    def feed(self, other):
        print 'feeding', other

THEME = 'earth'

def start():
    a = Human()
    b = Animal()
    a.feed(b)

