/*
 * FakeSubstrate
 * =============
 * limited set of the mobilehooker library
 * based on saurik's code
 * 
 */
#import <objc/runtime.h>
#import <objc/objc.h>
void MSHookMessageEx(Class cls, SEL selector, IMP impl, IMP *orig)
{
        Method hookd=class_getInstanceMethod(cls, selector);
	IMP old=method_getImplementation(hookd);
        //const char* types=method_getTypeEncoding(hookd);
        method_setImplementation(hookd, impl);
	*orig = old;
}
template <typename Type_>
static inline Type_ &MSHookIvar(id self, const char *name) {
    Ivar ivar(class_getInstanceVariable(object_getClass(self), name));
    void *pointer(ivar == NULL ? NULL : reinterpret_cast<char *>(self) + ivar_getOffset(ivar));
    return *reinterpret_cast<Type_ *>(pointer);
}

