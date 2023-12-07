;#region classes
/**
 * The {@link https://www.autohotkey.com/docs/v2/lib/Any.htm|`Any`} class is the root (top most) class of AutoHotkey's type hierarchy.  
 * All other types are a sub-type of Any.
 * @class
 */
class Any {
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Any.htm#Base|`Base`} retrieves or sets the value's {@link https://www.autohotkey.com/docs/v2/Objects.htm#delegation|`base object`}.  
     * @property
     * The base object must be an Object.  
     * @type {(Prototype)}
     * @see {@link https://www.autohotkey.com/docs/v2/lib/Any.htm#GetBase|`ObjGetBase()`}
     * , {@link https://www.autohotkey.com/docs/v2/lib/Object.htm#SetBase|`ObjSetBase()`}
     * , {@link https://www.autohotkey.com/docs/v2/lib/Object.htm#Base|`Object.Base()`}
     * @throws {(Error)} - Assigning a new base that would change the native type of the object.  
     * @example <caption>  
     * Checking if object's base matches the main Object prototype.</caption>
     * obj := Object()
     * if (obj.Base = Object.Prototype)
     *     MsgBox('Yes, obj is based on the Object prototype.')
     */
    Base => Prototype
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Any.htm#GetMethod|`GetMethod()`} retrieves the implementation function of a method.  
     * @method
     * @param {(String)} [Name] - The name of the method to retrieve.  
     * Omit this parameter to perform validation on Value itself and return Value if successful.  
     * @param {(Number)} [ParamCount] - The number of parameters that would be passed to the method or function.  
     * If omitted (or if the parameter count was not verified), a basic check is performed for a Call method to verify that the object is most likely callable.  
     * @returns {(Function Object)}
     * @throws {(MethodError)} - Method is not found or cannot be retrieved without invoking a property getter.  
     * @throws {(ValueError)} - Validation attempted and failed.  
     * @throws {(MethodError)} - Validation attempted and failed.  
     * @see {@link https://www.autohotkey.com/docs/v2/Objects.htm|`Objects`}
     * , {@link https://www.autohotkey.com/docs/v2/lib/HasBase.htm|`HasBase()`}
     * , {@link https://www.autohotkey.com/docs/v2/lib/HasMethod.htm|`HasMethod()`}
     * , {@link https://www.autohotkey.com/docs/v2/lib/HasProp.htm|`HasProp()`}
     * @example <caption>  
     * Getting a reference to the HasBase() method and using it.</caption>
     * ; Get reference to 'HasBase' method
     * hb := Any.GetMethod('HasBase')
     * ; Use method to check if array is of object type
     * if hb(array, object)
     *     MsgBox('True. Array is derived from object')
     */
    GetMethod([Name:=Unset, ParamCount:=Unset]) => MethodReference
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Any.htm#HasBase|`HasBase()`} checks if BaseObj is in this Value's chain of base objects
     * @method
     * @param {(Object | Primitive)} Baseobj - The potential base object to test.  
     * @returns {(Integer)} 1 if BaseObj is found in this value's chain of base objects, otherwise 0.  
     * @see {@link https://www.autohotkey.com/docs/v2/Objects.htm|`Objects`}
     * , {@link https://www.autohotkey.com/docs/v2/lib/Object.htm#Base|`Object.Base()`}
     * , {@link https://www.autohotkey.com/docs/v2/lib/Any.htm#GetBase|`ObjGetBase()`}
     * , {@link https://www.autohotkey.com/docs/v2/lib/HasMethod.htm|`HasMethod()`}
     * , {@link https://www.autohotkey.com/docs/v2/lib/HasProp.htm|`HasProp()`}
     * @example <caption>  
     * Confirming that Arrays are derived from Objects.</caption>
     * if array.HasBase(object)
     *     MsgBox('Yes. Array is derived from Object.')
     */
    HasBase(BaseObj) => Integer

    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Any.htm#HasMethod|`HasMethod()`} returns a non-zero number if the specified value has a method by the specified name.  
     * @method
     * @param {(String)} [Name] - The method name to check for.  
     * Omit this parameter to check whether Value itself is callable.  
     * @param {(Integer)} [ParamCount] - The number of parameters that would be passed to the method or function.  
     * If omitted, or if the parameter count was not verified, a basic check is performed for a Call method to verify that the object is most likely callable.  
     * @returns {(Integer)} 1 if a method was found and passed validation (if performed), otherwise 0.  
     * @see {@link https://www.autohotkey.com/docs/v2/Objects.htm|`Objects`}
     * , {@link https://www.autohotkey.com/docs/v2/lib/HasBase.htm|`HasBase()`}
     * , {@link https://www.autohotkey.com/docs/v2/lib/HasProp.htm|`HasProp()`}
     * , {@link https://www.autohotkey.com/docs/v2/lib/GetMethod.htm|`GetMethod()`}
     * @example <caption>  
     * Verifying that an array has a push method</caption>
     * arr := []
     * if arr.HasMethod('Push')
     *     MsgBox('Yes. All Array objects have a Push() method.')
     */
    HasMethod([Name:=Unset, ParamCount:=Unset]) => Integer

    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Any.htm#HasProp|`HasProp()`} returns true if the value has an attribute with this name, otherwise it returns false.  
     * @method
     * @param {(String)} Name - The property name to check for.  
     * @returns {(Integer)} 1 if property name is found, otherwise 0.  
     * @see {@link https://www.autohotkey.com/docs/v2/Objects.htm|`Objects`}
     * , {@link https://www.autohotkey.com/docs/v2/lib/HasBase.htm|`HasBase()`}
     * , {@link https://www.autohotkey.com/docs/v2/lib/HasMethod.htm|`HasMethod()`}
     * @example <caption>  
     * Checking an object for the presence of a specific property.</caption>
     * obj := {name:'AutoHotkey'}
     * if obj.HasProp('name')
     *     MsgBox('Yes, this object has a name property.')
     * else MsgBox('No, this object does not have a name property.')
     */
    HasProp(Name) => Integer
    
    /**
     * @method
     */
    __Init() => String
}

/**
 * Object is the basic class from which other AutoHotkey object classes derive.  
 * Each instance of Object consists of a set of "own properties" and a base object,  
 * from which more properties are inherited.  
 * Objects also have methods. These act identically to functions but are just callable properties.  
 * @class
 * @example
 * my_obj := Object()
 * MsgBox('my_obj type is: ' Type(my_obj))
 */
class Object extends Any {
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Any.htm#Base|`Base`} retrieves or sets the value's {@link https://www.autohotkey.com/docs/v2/Objects.htm#delegation|`base object`}.  
     * The base object must be an Object.  
     * @property
     * @type {(Prototype)}
     * @see {@link https://www.autohotkey.com/docs/v2/lib/Any.htm#GetBase|`ObjGetBase()`}
     * , {@link https://www.autohotkey.com/docs/v2/lib/Object.htm#SetBase|`ObjSetBase()`}
     * , {@link https://www.autohotkey.com/docs/v2/lib/Object.htm#Base|`Object.Base()`}
     * @throws {(Error)} - Assigning a new base that would change the native type of the object.  
     * @example <caption>  
     * Comparing a base to </caption>
     * thing := Object()
     * if (thing.Base = Object.Prototype)
     *     MsgBox('Yes, thing is based on the Object prototype.')
     * else Msgbox('No, thing is not based on the Object prototype.')
     */
    Base => Object.Prototype
    
    /**
     * Creates a new Object.  
     * @method
     * @constructs Object
     * @example <caption>  
     * Two ways to create a new object.</caption>
     * ; Create a new object
     * my_obj1 := Object()
     * my_obj2 := Object.Call()
     * my_obj3 := {}
     */
    static Call() => Object
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Object.htm#Clone|`Clone()`} returns a shallow copy of the object.  
     * Each property or method owned by the object is copied into the clone.  
     * Shallow copy means:  
     * - Primitive values are copied
     * - Objects **references** are copied. The objects themselves are not duplicated.  
     *   Meaning the original and the clone will have references to the same object.  
     * - Dynamic properties are copied but not invoked.   
     * Past block quote
     * @method
     * @returns {(Object)} Shallow copy of the object
     * @example <caption>  
     * How to use clone and an example of the differences  
     * between copied primitives and copied object references.</caption>
     * obj := {string:'test', array:[1,2,3]}
     * clone := obj.Clone()
     * MsgBox('original string: ' clone.string 
     *     '`noriginal array[2]: ' clone.array[2])
     * obj.string := 'changed!'
     * obj.array[2] := 'changed!'
     * MsgBox('clone string: ' clone.string ' Primitive copy did not change.'
     *     '`nclone array[2]: ' clone.array[2] ' Object reference did change.')
     */
    Clone() => Object
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Object.htm#DefineProp|`DefineProp()`} defines a new own property for the object.  
     * @method
     * @param {(String)} Name - Name of the property  
     * @param {(Object)} DescriptorObject - An object with one of the following own properties, or both Get and Set:  
     * - Get: Called when the property's value is retrieved.  
     * - Set: Called when the property is assigned a value. Its second parameter is the value being assigned.  
     * - Call: Called when the property is called.  
     * - Value: Any value to assign to the property.  
     * @returns {(Object)} Reference to the object the property was added to.  
     * @example <caption>  
     * Using a descriptor object to define an object method.</caption>
     * math := {}
     * adder := {call:(this, n1, n2) => n1+n2}
     * mathRef := math.DefineProp('add', adder)
     * MsgBox(math.add(2, 4) '`n' mathRef.add(10, 5))
     */
    DefineProp(Name, DescriptorObject) => ObjectReference

    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Object.htm#DeleteProp|`DeleteProp()`} removes an own property from an object.  
     * @method
     * @param {(String)} Name - A property name
     * @returns {(Any)} Value of removed property
     * @example <caption>  
     * Removing a property from an object.</caption>
     * obj := {x:'test'}
     * rem := obj.DeleteProp('x')
     * MsgBox('Property removed: ' rem)
     * ; Error: x no longer exists
     * MsgBox(obj.x)
     */
    DeleteProp(Name) => Value

    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Object.htm#GetOwnPropDesc|`GetOwnPropDesc()`} returns a descriptor for a given own property, compatible with {@link https://www.autohotkey.com/docs/v2/lib/Object.htm#DefineProp|`DefineProp`}.  
     * @method
     * @param {(String)} Name - A property name.  
     * @returns {(Object)} Descriptor
     * @example <caption>  
     * Getting a descriptor object from an object property.</caption>
     * math := {}
     * adder := {call:(this, n1, n2) => n1+n2}
     * math.DefineProp('add', adder)
     * MsgBox(math.add(1, 2))
     * adder_ref := math.GetOwnPropDesc('add')
     * MsgBox(adder_ref(3, 4))
     */
    GetOwnPropDesc(Name) => DescriptorObject

    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Object.htm#HasOwnProp|`HasOwnProp()`} returns true if the object has a property by the specified Name.  
     * @method
     * @param {(String)} Name - The name of a property.  
     * This method is also defined as a function: ObjHasOwnProp(objectName, propertyName)
     * @returns {(Integer)} 1 if property name is found, otherwise 0.  
     * @example <caption>  
     * Test if an object has a specific property.</caption>
     * obj := {test: 'data'}
     * if (obj.HasOwnProp('test'))
     *     MsgBox('obj has a property named "test"')
     */
    HasOwnProp(Name) => Integer

    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Object.htm#OwnProps|`OwnProps()`} returns an enumerator of all the object's properties.  
     * Usually, this is used with a for-loop to loop through all the object's properties.  
     * @method
     * @returns {(Enumerator)}
     * @example <caption>  
     * Creates an enumerator with each property of the object</caption>
     * obj := {p1:'apple', p2:'banana', p3:'cherry'}
     * for key, value in obj.OwnProps()
     *     MsgBox('Key: ' key '`nvalue: ' value)
     */
    OwnProps() => Enumerator
}

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/Array.htm|`Array`} is an object containsing a list or sequence of values.  
 * Each element of an array has an index.  
 * Unlike most common languages, AHK indices start at 1, not 0.  
 * @class
 * @returns {(Array)}
 */
class Array extends Object {
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Array.htm#Length|`Length`} retrieves or sets the length of an array.  
     * Length includes elements which have no value.  
     * Setting Length higher will add enough unset values to the array to equal the new length.  
     * Setting Length lower will truncate everything past the defined index.  
     * @property
     * @type {(Integer)}
     * @example <caption>  
     * Setting an array's length.</caption>
     * arr := [1, 2]
     * arr.Length := 4
     * MsgBox('Array now: [1, 2, unset, unset]')
     *  
     * arr := [1, 2, 3, 4, 5]
     * arr.Length := 3
     * MsgBox('Array now: [1, 2, 3]')
     */
    Length => Integer
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Array.htm#Capacity|`Capacity`} retrieves or sets the capacity of an array.  
     * Capacity is the total amount of elements the array can hold before it needs to be expanded.  
     * Length is the total amount of elements in use.  
     * A capacity lower than Length will truncate eveything past the capacity total.  
     * @property
     * @type {(Integer)}
     * @example <caption>  
     * Showing Capacity differs from Length.</caption>
     * arr := ['a', 'b', 'c', 'd']
     * MsgBox('Length: ' arr.Length '`nCapacity: ' arr.Capacity)
     * arr.RemoveAt(2, 2)
     * MsgBox('After RemoveAt(2, 2)'
     *     '`nLength: ' arr.Length '`nCapacity: ' arr.Capacity)
     */
    Capacity => Integer
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Array.htm#Default|`Default`} defines the default value returned when an unset element is requested.  
     * Default is unset by default and must be set by the user.  
     * Setting a default value does not prevent an error being thrown when index is out of range.  
     * @property
     * @type {(Any)} Can be any type of value
     * @throws {(UnsetItemError)} - An attempt was made to read the value of an item, but there was no value.  
     * @example <caption>  
     * Assigning a default value to an array.</caption>
     * arr := [1, 2, unset]
     * arr.Default := 'Not found'
     * MsgBox('Index 2: ' arr[2] '`nIndex 3: ' arr[3])
     */
    Default => Any
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Array.htm#__Item|`__Item`} retrieves or sets the value of an array element.  
     * Items are indicated through bracket notation `arr[item]`
     * @property
     * @param {(Integer)} Index - Index to insert value(s).  
     * An index of 0 is the same as `array.Length + 1` and works identical to `Push()`.  
     * A negative index starts at the last element. `-1` last, `-2` second from last, etc.  
     * @throws {(IndexError)} - Using an out of bounds index.  
     * @example <caption>  
     * Using the __item property.</caption>
     * arr := ['a','b','c']
     * MsgBox('index 2 contains: ' arr.__Item[2])
     */
    __Item[Index] => Any
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Array.htm#Call|`Call()`} creates a new Array.  
     * @method
     * @example <caption>  
     * 2 ways to create an array object</caption>
     * my_arr1 := Array(1, 2, 3)
     * my_arr2 := Array.Call(1, 2, 3)
     * my_arr3 := [1, 2, 3]
     */
    static Call([Value1, ..., ValueN]) => Array
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Array.htm#Clone|`Clone()`} returns a shallow copy of the array.  
     * All array elements are copied to the new array.  
     * Shallow copy means:  
     * - Primitive values are copied
     * - Object references are copied. The objects themselves are not cloned.  
     * - Dynamic properties are copied but not invoked.  
     * @method
     * @returns {(Array)} Shallow copy of array
     * @example <caption>  
     * Showing the differences of a shallow clone.</caption>
     * obj := {string:'test', array:[1,2,3]}
     * clone := obj.Clone()
     * MsgBox(clone.string '`n' clone.array[2])
     * obj.string := 'changed!'
     * obj.array[2] := 'changed!'
     * MsgBox(clone.string '`n' clone.array[2])
     */
    Clone() => Array
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Array.htm#Delete|`Delete()`} removes the value of an array element, leaving that index without a value.  
     * @method
     * @param {(Integer)} Index - Index to insert value(s).  
     * An index of 0 is the same as `array.Length + 1` and works identical to `Push()`.  
     * A negative index starts at the last element. `-1` last, `-2` second from last, etc.  
     * @returns {(Any)} The removed value is returned
     * @example <caption>  
     * Removing an element from an array.</caption>
     * arr := [1, 2, 3]
     * rem := arr.Delete(2)
     * MsgBox(rem)
     */
    Delete(Index) => Any
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Array.htm#Get|`Get()`} returns the value at a given index, or a default value if one is provided.  
     * If default is omitted, `x := arr.Get(index)` is equivalent `x := arr[index]`, except `__item` isn't called (if callable).  
     * @method
     * @param {(Integer)} Index - The number of the element to get from the array.  
     *   Using index of 0 is the same as `array.Length + 1` and works identical to `Push()`.  
     *   A negative index starts at the end and goes that many elements toward the beginning. -1 is the last index, -2 is second from last, etc.
     * @param {(Any)} [Default] - Any default value.  
     * @returns {(Any)} The value at index if one is found.  
     *   Else, the default parameter value is used (if provided).  
     *   Else, the {@link https://www.autohotkey.com/docs/v2/lib/Array.htm#Default|`array default`} value if one is defined.  
     *   Else, an UnsetItemError is thrown.  
     * @throws {(UnsetItemError)} - Value not set and no default parameter, and default property not defined.  
     * @throws {(IndexError)} - Index is zero or out of range
     * @example <caption>  
     * Retrieving a value from an array.</caption>
     * arr := [1, 2, 3, unset]
     * MsgBox('index 2: ' arr.get(2, 'Not found') '`nindex 4: ' arr.get(4, 'Not found'))
     */
    Get(Index [, Default:=Unset]) => Any
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Array.htm#Has|`Has()`} returns true if the specified index is valid and there is a value at that position.  
     * @method
     * @param {(Integer)} Index - Index to insert value(s).  
     * An index of 0 is the same as `array.Length + 1` and works identical to `Push()`.  
     * A negative index starts at the last element. `-1` last, `-2` second from last, etc.  
     * @returns {(Number)} 1 if array has that index number otherwise 0.  
     * @example <caption>  
     * Check if an array element has a value.</caption>
     * arr := ['a', 'b', 'c']
     * if (arr.has(2))
     *     MsgBox('Element 2 of this array contains a value.')
     */
    Has(Index) => Integer
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Array.htm#InsertAt|`InsertAt()`} inserts one or more values at a given position in the array.  
     * @method
     * @param {(Integer)} Index - Index to insert value(s).  
     * An index of 0 is the same as `array.Length + 1` and works identical to `Push()`.  
     * A negative index starts at the last element. `-1` last, `-2` second from last, etc.  
     * @param {(Any)} Value - Value to insert.  
     * An array of values can passed if the variable is marked with a `*`  
     * `arr.InsertAt(3, arr_of_values*)`  
     * There can only be one array of values and it must be the last value listed.  
     * @param {(Any)} [AdditionalValues] - Any number of additional values separated by commas.  
     * @returns {(String)} An empty string is always returned.  
     * @throws {ValueError} - Index is out of range
     * @example <caption>  
     * Insert some letters into an array of letters.</caption>
     * arr := ['a', 'e']
     * MsgBox(view_array(arr))
     * arr.InsertAt(2, 'b', 'c', 'd')
     * MsgBox('After InsertAt:`n`n' view_array(arr))
     * 
     * view_array(arr) {
     *     str := ''
     *     for i, v in arr
     *         str .= 'Value: ' v '`n'
     *     return str
     * }
     */
    InsertAt(Index, Value [, AdditionalValues:=Unset]) => EmptyString

    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Array.htm#Pop|`Pop()`} removes and returns the last array element.  
     * @method
     * @returns {(Any)} Value of element removed
     * @throws {Error} - Cannot remove an element from an empty array.  
     * @example <caption>  
     * Removing the last element of an array.</caption>
     * arr := ['a', 'b', 'c']
     * removed_item := arr.Pop()
     * MsgBox('Array Size: ' arr.Length)
     * MsgBox('Removed value: ' removed_item)
     */
    Pop() => Any
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Array.htm#Push|`Push()`} appends value(s) to the end of an array.  
     * @method
     * @param {(Any)} Value - Any value
     * @param {(Any)} AdditionalValues - Any additional values
     * @returns {(String)} An empty string is always returned.  
     * @example <caption>  
     * Add an element to the end of an array.</caption>
     * arr := [1, 2]
     * arr.Push(3)
     * for i, v in arr
     *     MsgBox('Index: ' i '`nValue: ' v)
     */
    Push(Value [, AdditionalValues:=Unset]) => EmptyString
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Array.htm#RemoveAt|`RemoveAt()`} removes itmes from an array.  
     * @method
     * @param {(Integer)} Index - Index to insert value(s).  
     * An index of 0 is the same as `array.Length + 1` and works identical to `Push()`.  
     * A negative index starts at the last element. `-1` last, `-2` second from last, etc.  
     * @param {(Integer)} Length - The number of consecutive elements to remove.  
     * @returns {(Any)} The value removed is returned if no Length is provied.  
     * Otherwise, an empty string is returned.  
     * @throws {ValueError} - If index is out of range.  
     * @example <caption>  
     * Remove a value from a specific element.</caption>
     * arr := ['a', 'y', 'z', 'b', 'c']
     * arr.RemoveAt(2, 2)
     * for i, v in arr
     *     MsgBox('Index: ' i '`nValue: ' v)
     */
    InsertAt(Index [, Length:=Unset]) => Any  
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Array.htm#__New|`__New()`} appends items and is equivalent to {@link https://www.autohotkey.com/docs/v2/lib/Array.htm#Push|`Push`}.  
     * This method exists to support {@link https://www.autohotkey.com/docs/v2/lib/Array.htm#Call|`Call()`}, and is not intended to be called directly.  
     * @method
     * @param {(Any)} Value - Value to insert.  
     * An array of values can passed if the variable is marked with a `*`  
     * `arr.InsertAt(3, arr_of_values*)`  
     * There can only be one array of values and it must be the last value listed.  
     * @param {(Any)} AdditionalValues - Any number of additional values separated by commas.  
     * @returns {(String)} An empty string is always returned.  
     * @see {@link https://www.autohotkey.com/docs/v2/Objects.htm#Custom_NewDelete|`Construction and Destruction`}
     */
    __New(Value [, AdditionalValues:=Unset]) => EmptyString
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Array.htm#__Enum|`__Enum()`} creates an enumerator to iterate through an array's elements.  
     * This method is typically not called directly as enumerable objects can be directly passed to a for-loop.  
     * @method
     * @returns {(Enumerator)} Enumerable function object.  
     * @see {@link https://www.autohotkey.com/docs/v2/lib/Enumerator.htm|`Enumerator Object`}
     * @example <caption>  
     * Manually using an enumerator.</caption>
     * arr := ['a', 'b', 'c']
     * e := arr.__Enum()
     * While e(&i, &v)
     *     MsgBox('Index: ' i '`nValue: ' v)
     * for i, v in arr
     *     MsgBox('Index: ' i '`nValue: ' v)
     */
    __Enum() => Enumerator
}

/**
 * A {@link https://www.autohotkey.com/docs/v2/lib/Buffer.htm|`Buffer`} encapsulates a block of memory for use with memory sensitive actions such as DllCall, structures, StrPut, and raw file I/O.  
 * Buffer objects are typically created by calling Buffer(), but can also be returned by FileRead with the "RAW" option.  
 * @class
 */
class Buffer extends Object {
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Buffer.htm|`ClipboardAll()`} creates an object containing everything on the clipboard, including binary data (like pictures).  
     * ClipboardAll is derived from the Buffer class.  
     * @class
     * @see {@link https://www.autohotkey.com/docs/v2/lib/A_Clipboard.htm|`A_Clipboard`}
     * , {@link https://www.autohotkey.com/docs/v2/lib/ClipWait.htm|`ClipWait()`}
     * , {@link https://www.autohotkey.com/docs/v2/lib/OnClipboardChange.htm|`OnClipboardChange()`}
     * , {@link https://www.autohotkey.com/docs/v2/lib/_ClipboardTimeout.htm|`#ClipboardTimeout`}
     * , {@link https://www.autohotkey.com/docs/v2/lib/Buffer.htm|`Buffer`}
     */
    class ClipboardAll extends Buffer {
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/Buffer.htm#Ptr|`Ptr`} retrieves the address of the data contained by the object.  
         * This address is valid until the object is freed.  
         * @property
         * @type {(Integer)}
         * @example <caption>  
         * Showing a buffer pointer.</caption>
         * clipBak := ClipboardAll()
         * MsgBox('Data address is: ' clipBak.Ptr)
         */
        Ptr => Integer  
        
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/Buffer.htm#Size|`Size`} retrieves the size, in bytes, of the raw binary data.  
         * @property
         * @type {(Integer)}
         * @example <caption>  
         * Showing size of a buffer.</caption>
         * clipBak := ClipboardAll()
         * MsgBox('Size of current clipboard data: ' clipBak.Size ' bytes')
         */
        Size => Integer
        
        /**
         * Creates a {@link https://www.autohotkey.com/docs/v2/lib/Buffer.htm|`Buffer`} object.  
         * @method
         * @param {(Object | Integer)} [Data] - A Buffer-like object or a pure integer which is the address of the binary data.  
         * The data must be in a {@link https://www.autohotkey.com/docs/v2/lib/ClipboardAll.htm#Remarks|`specific format`}, so typically it originates from a previous call to ClipboardAll().  
         * Omitting both parameters retrieves the current contents of the clipboard.  
         * @param {(Integer)} [Size] - The number of bytes of data to use. This is not necessary with buffer objects.  
         * @returns {(ClipboardAll)} A  buffer object
         * @throws {(MemoryError)} - Memory could not be allocated.  
         * @see {@link https://www.autohotkey.com/docs/v2/lib/DllCall.htm|`DllCall()`}
         * , {@link https://www.autohotkey.com/docs/v2/lib/NumPut.htm|`NumPut()`}
         * , {@link https://www.autohotkey.com/docs/v2/lib/NumGet.htm|`NumGet()`}
         * , {@link https://www.autohotkey.com/docs/v2/lib/StrPut.htm|`StrPut()`}
         * , {@link https://www.autohotkey.com/docs/v2/lib/StrGet.htm|`StrGet()`}
         * , {@link https://www.autohotkey.com/docs/v2/lib/File.htm#RawRead|`File.RawRead()`}
         * , {@link https://www.autohotkey.com/docs/v2/lib/File.htm#RawWrite|`File.RawWrite()`}
         * , {@link https://www.autohotkey.com/docs/v2/lib/ClipboardAll.htm|`ClipboardAll`}

         * @example <caption>  
         * Clipboard backup and restore.</caption>
         * ; Save highlighted text to variable
         * $F1:: {
         *     backup := ClipboardAll()
         *     A_Clipboard := ''
         *     Send('^c')
         *     ClipWait(2, 0)
         *     text := A_Clipboard
         *     A_Clipboard := backup
         *     MsgBox('Highlighted text saved as variable:'
         *         '`n' text
         *         '`nOriginal clipboard data is back on clipboard.')
         * }
         */
        static Call([Data:=Unset, Size:=Buffer.Size]) => ClipboardAll

    }
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Buffer.htm#Ptr|`Ptr`} retrieves the buffer's current memory address.  
     * @property
     * @type {(Integer)}
     * @example <caption>  
     * Showing and using a buffer pointer.</caption>
     * buff := Buffer(4)
     * MsgBox('Pointer address of this buffer:`n' buff.ptr)
     * NumPut('Int', 420, buff.Ptr)
     * MsgBox('Number stored in buffer:`n' NumGet(buff.ptr, 0, 'Int'))
     */
    Ptr => Integer
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Buffer.htm#Size|`Size`} retrieves or sets the buffer's size, in bytes.  
     * @property
     * @type {(Integer)}
     * @throws {(MemoryError)} - Memory could not be allocated.  
     * @example <caption>  
     * Getting the size of a buffer.</caption>
     * buff := Buffer(16)
     * MsgBox('Size of buffer: ' buff.Size ' bytes')
     */
    Size => Integer
    
    /**
     * Creates a {@link https://www.autohotkey.com/docs/v2/lib/Buffer.htm|`Buffer`}.  
     * @constructs Buffer
     * @method
     * @param {(Integer)} [ByteCount] - Number of bytes to allocate.  
     * If omitted, the Buffer is created with a null (zero) Ptr and zero Size.  
     * @param {(Integer)} [FillByte] - Number between 0-255. Each byte will be filled with that number.  
     * If omitted, the buffer's memory is allocated but the bytes of the buffer are not set.  
     * If buffer will be written to without first being read, it is better to omit FillByte as it has a time cost proportionate to the number of bytes.  
     * @returns {(Buffer)} A buffer object.  
     * @throws {(MemoryError)} - If the memory could not be allocated.  
     * @example <caption>  
     * Creating a new 8 byte buffer.</caption>
     * buff := Buffer(8)
     */
    static Call([ByteCount:=Unset, FillByte:=Unset]) => Buffer
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Buffer.htm#__New|`__New()`} allocates or reallocates the buffer and optionally fills it.  
     * This method exists to support {@link https://www.autohotkey.com/docs/v2/lib/Buffer.htm#Call|`Call`}, and is not usually called directly.  
     * @method
     * @param {(Integer)} [ByteCount] - Number of bytes to allocate, reallocate, or free the buffer.  
     * This is equivalent to assigning {@link https://www.autohotkey.com/docs/v2/lib/Buffer.htm#Size|`Size`}.  
     * @param {(Integer)} [FillByte] - Number between 0-255. Each byte will be filled with that number.  
     * @returns {(String)} An empty string is always returned.  
     * @see {@link https://www.autohotkey.com/docs/v2/Objects.htm#Custom_NewDelete|`Construction and Destruction`}  
     * @example <caption>  
     * Expanding, storing, and retrieving a number from a buffer.</caption>
     * num := 65536
     * buff := Buffer(2, 0)
     * ; 2 byte can only store up to 65535
     * ; Increase buffer to 4 bytes and fill with zeroes
     * buff.__New(4 ,0)
     * NumPut('uInt', num, buff)
     * ; Prove number is stored in buff
     * n := NumGet(buff, 'Int')
     * MsgBox('n value: ' n)
     */
    __New(ByteCount:=Unset, FillByte:=0) => EmptyString
}

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/Class.htm|`Class`} objects contain static methods and properties creates an object containing everything on the clipboard (such as pictures and formatting).  
 * @class
 * @see {@link https://www.autohotkey.com/docs/v2/lib/A_Clipboard.htm|`A_Clipboard`}
 * , {@link https://www.autohotkey.com/docs/v2/lib/ClipWait.htm|`ClipWait()`}
 * , {@link https://www.autohotkey.com/docs/v2/lib/OnClipboardChange.htm|`OnClipboardChange()`}
 * , {@link https://www.autohotkey.com/docs/v2/lib/_ClipboardTimeout.htm|`#ClipboardTimeout`}
 * , {@link https://www.autohotkey.com/docs/v2/lib/Buffer.htm|`Buffer`}
 */
class Class extends Object {
    /**
     * Constructs a new instance of the class.  
     * @method
     * @param params - Any amount of parameters.  
     * @returns {(Class)}
     * @example <caption>  
     * Multiple ways to make an object.</caption>
     * obj1 := {}
     * obj2 := Object()
     * obj3 := Object.Call()
     */
    Call(params*) => Class
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Class.htm#Prototype|`Prototype`} retrieves or sets the object on which all instances of the class are based.  
     * By default, the class's Prototype contains all instance methods and dynamic properties defined within the class definition, and can be used to retrieve references to methods or property getters/setters or define new ones.  
     * A class's Prototype is normally based on the Prototype of its base class:  
     * `ClassObj.Prototype.base == ClassObj.base.Prototype`  
     * Prototype is automatically defined as an own property of any class object created by a class definition.  
     * @property
     * @type {(Prototype)}
     */
    Prototype => Prototype
}

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/Error.htm|`Error`} objects are {@link https://www.autohotkey.com/docs/v2/lib/Throw.htm|`thrown`} by built-in code when a runtime error occurs, and may also be thrown explicitly by the script.  
 * Specific error types:  
 * - MemoryError - A memory allocation failed.  
 * - OSError - An internal function call to a Win32 function failed. Message includes an error code and description generated by the operating system. OSErrors have an additional Number property which contains the error code.  
 *   Calling OSError(code) with a numeric code sets Number and Message based on the given OS-defined error code. If code is omitted it defaults to A_LastError.  
 * - TargetError - A function failed because its target could not be found. Message indicates what kind of target, such as a window, control, menu or status bar.  
 * - TimeoutError - SendMessage timed out.  
 * - TypeError - An unexpected type of value was used as input for a function, property assignment, or some other operation. Usually Message indicates the expected and actual type, and Extra contains a string representing the errant value.  
 * - UnsetError - An attempt was made to read the value of a variable, property or item, but there was no value.  
 *   - MemberError
 *     - PropertyError
 *     - MethodError
 *   - UnsetItemError
 * - ValueError - An unexpected value was used as input for a function, property assignment, or some other operation. Usually Message indicates which expectation was broken, and Extra contains a string representing the errant value.  
 *   - IndexError - The index parameter of an object's __Item property was invalid or out of range.  
 * - ZeroDivisionError - Division by zero was attempted in an expression or with the Mod function.  
 * @class
 * @see {@link https://www.autohotkey.com/docs/v2/lib/Throw.htm|`Throw`}
 * , {@link https://www.autohotkey.com/docs/v2/lib/Try.htm|`Try`}
 * , {@link https://www.autohotkey.com/docs/v2/lib/Catch.htm|`Catch`}
 * , {@link https://www.autohotkey.com/docs/v2/lib/Finally.htm|`Finally`}
 * , {@link https://www.autohotkey.com/docs/v2/lib/OnError.htm|`OnError()`}
 * , {@link https://www.autohotkey.com/docs/v2/lib/Error.htm#error-types|`Error Types`}
 */
class Error extends Object {
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Error.htm#new|`Message`} contains a description of the error.
     * @property
     * @type {(String)}
     */
    Message => String
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Error.htm#new|`What`} contains the name of the thing that threw the error. Usually a function name.  
     * Is blank when an exception is thrown inside an expression. Example: `('a' / 1)`
     * @property
     * @type {(String)}
     */
    What => String
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Error.htm#new|`Extra`} contains any additional information about the error.  
     * If a non-empty string is passed, the error message will include a line that says:  
     * `Specifically: ` followed by the provided text.
     * @property
     * @type {(String)}
     */
    Extra => String
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Error.htm#new|`File`} is the full path of the script file containing the line at which the error occurred or where the Error object was constructed.  
     * @property
     * @type {(String)}
     */
    File => String
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Error.htm#new|`Line`} is number of the line at which the error occurred or where the Error object was constructed.  
     * @property
     * @type {(Integer)}
     */
    Line => Integer
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Error.htm#new|`Stack`} is the full call stack at the time of error or error object construction.  
     * A stack line is formatted as follows:  
     * * ``[FilePath] ([Line]) : [What] SourceCode`r`n``  
     *   Represents a call to the function What.  
     *   File and Line indicate the current script line at this stack depth.  
     *   SourceCode is an approximation of the source code at that line, as it would be shown in {@link https://www.autohotkey.com/docs/v2/lib/ListLines.htm|`ListLines`}.
     * * ``> What`r`n``  
     *    Represents the launching of a thread, typically the direct cause of the function call above it.
     * * `... N more`  
     *   Indicates that the stack trace was truncated, and there are N more stack entries not shown.  
     *   Currently the Stack property cannot exceed 2047 characters.
     * @property
     * @type {(String)}
     */
    Stack => String

    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Error.htm#error-types|`Error()`} creates an Error object.  
     * @method
     * @param {(String)} [Message] - A message describing the error.  
     * @param {(String)} [What] - What threw the exception.  
     * This is usually the name of a function, but is blank for exceptions thrown due to an error in an expression.  
     * @param {(String)} [Extra] - A string value relating to the error, if available.  
     * If this value can be converted to a non-empty string, the standard error dialog displays a line with `Specifically:` followed by this string.  
     * @returns {(Error)} Error object.  
     * @example <caption>  
     * Creating and reading an error object.</caption>
     * result := test_div(1, 'a')
     * if (result is Error) {
     *     str := ''
     *     loop parse 'message what extra file line stack', ' '
     *         str .= 'error ' A_LoopField ':`n' result.%A_LoopField% '`n`n'
     *     MsgBox(str)
     * }
     * 
     * test_div(num1, num2) {
     *     switch {
     *         case (num2 = 0):
     *             return ZeroDivisionError('The second param cannot be a 0'
     *                 ,A_ThisFunc '()')
     *         case (num1 is Number && num2 is Number):
     *             return (num1 / num2)
     *         default: 
     *             return TypeError('Param 1 and 2 must be numbers'
     *                 ,A_ThisFunc '()'
     *                 ,'Param 1: ' num1 ' (' Type(num1) ')'
     *                 '`nParam 2: ' num2 ' ('  Type(num2) ')' )
     *     }
     * }
     */
    static Call([Message:='Error', What:=A_ThisFunc, Extra:=Unset]) => Error
}

class MemoryError extends Error {
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Error.htm#MemoryError|`MemoryError()`} - A memory allocation failed.  
     * @method
     * @param {(String)} [Message] - A message describing the error.  
     * @param {(String)} [What] - What threw the exception.  
     * This is usually the name of a function, but is blank for exceptions thrown due to an error in an expression.  
     * @param {(String)} [Extra] - A string value relating to the error, if available.  
     * If this value can be converted to a non-empty string, the standard error dialog displays a line with `Specifically:` followed by this string.  
     * @returns {(MemoryError)} MemoryError object.  
     */
    static Call([Message:='MemoryError', What:=A_ThisFunc, Extra:='']) => MemoryError
}

class OSError extends Error {
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Error.htm#OSError|`OSError()`} - An internal function call to a Win32 function failed.  
     * Message includes an error code and description generated by the operating system.  
     * OSErrors have an additional Number property which contains the error code.  
     * Calling OSError(code) with a numeric code sets Number and Message based on the given OS-defined error code.  
     * If code is omitted it defaults to A_LastError.  
     * @method
     * @param {(String)} [Message] - A message describing the error.  
     * @param {(String)} [What] - What threw the exception.  
     * This is usually the name of a function, but is blank for exceptions thrown due to an error in an expression.  
     * @param {(String)} [Extra] - A string value relating to the error, if available.  
     * If this value can be converted to a non-empty string, the standard error dialog displays a line with `Specifically:` followed by this string.  
     * @returns {(OSError)} OSError object.  
     */
    static Call([Message:='(0)', What:=A_ThisFunc, Extra:='']) => OSError
}

class TargetError extends Error {
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Error.htm#TargetError|`TargetError()`} - A function failed because its target could not be found.  
     * Message indicates what kind of target, such as a window, control, menu or status bar.  
     * @method
     * @param {(String)} [Message] - A message describing the error.  
     * @param {(String)} [What] - What threw the exception.  
     * This is usually the name of a function, but is blank for exceptions thrown due to an error in an expression.  
     * @param {(String)} [Extra] - A string value relating to the error, if available.  
     * If this value can be converted to a non-empty string, the standard error dialog displays a line with `Specifically:` followed by this string.  
     * @returns {(TargetError)} TargetError object.  
     */
    static Call([Message:='TargetError', What:=A_ThisFunc, Extra:='']) => TargetError
}

class TimeoutError extends Error {
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Error.htm#TimeoutError|`TimeoutError()`} - {@link https://www.autohotkey.com/docs/v2/lib/SendMessage.htm|`SendMessage`} timed out.  
     * @method
     * @param {(String)} [Message] - A message describing the error.  
     * @param {(String)} [What] - What threw the exception.  
     * This is usually the name of a function, but is blank for exceptions thrown due to an error in an expression.  
     * @param {(String)} [Extra] - A string value relating to the error, if available.  
     * If this value can be converted to a non-empty string, the standard error dialog displays a line with `Specifically:` followed by this string.  
     * @returns {(TimeoutError)} TimeoutError object.  
     */
    static Call([Message:='TimeoutError', What:=A_ThisFunc, Extra:='']) => TimeoutError
}

class TypeError extends Error {
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Error.htm#TypeError|`TypeError()`} - An unexpected type of value was used as input for a function, property assignment, or some other operation.  
     * Usually, Message indicates the expected and actual type, and Extra contains a string representing the errant value.  
     * @method
     * @param {(String)} [Message] - A message describing the error.  
     * @param {(String)} [What] - What threw the exception.  
     * This is usually the name of a function, but is blank for exceptions thrown due to an error in an expression.  
     * @param {(String)} [Extra] - A string value relating to the error, if available.  
     * If this value can be converted to a non-empty string, the standard error dialog displays a line with `Specifically:` followed by this string.  
     * @returns {(TypeError)} TypeError object.  
     */
    static Call([Message:='TypeError', What:=A_ThisFunc, Extra:='']) => TypeError
}

class UnsetError extends Error {
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Error.htm#UnsetError|`UnsetError()`} - An attempt was made to read the value of a variable, property or item, but there was no value.  
     * Or an attempt was made to access a method that does not exist.  
     * @method
     * @param {(String)} [Message] - A message describing the error.  
     * @param {(String)} [What] - What threw the exception.  
     * This is usually the name of a function, but is blank for exceptions thrown due to an error in an expression.  
     * @param {(String)} [Extra] - A string value relating to the error, if available.  
     * If this value can be converted to a non-empty string, the standard error dialog displays a line with `Specifically:` followed by this string.  
     * @returns {(UnsetError)} UnsetError object.  
     */
    static Call([Message:='UnsetError', What:=A_ThisFunc, Extra:='']) => UnsetError
}

class MemberError extends UnsetError {
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Error.htm#MemberError|`MemberError()`} - Either an attempt was made to read the value of a property or item, but there was no value,  
     * or an attempt was made to access a method that does not exist.  
     * @method
     * @param {(String)} [Message] - A message describing the error.  
     * @param {(String)} [What] - What threw the exception.  
     * This is usually the name of a function, but is blank for exceptions thrown due to an error in an expression.  
     * @param {(String)} [Extra] - A string value relating to the error, if available.  
     * If this value can be converted to a non-empty string, the standard error dialog displays a line with `Specifically:` followed by this string.  
     * @returns {(MemberError)} MemberError object.  
     */
    static Call([Message:='MemberError', What:=A_ThisFunc, Extra:='']) => MemberError
}

class PropertyError extends MemberError {
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Error.htm#PropertyError|`PropertyError()`} - An attempt was made to read the value of a property but there was no value.  
     * @method
     * @param {(String)} [Message] - A message describing the error.  
     * @param {(String)} [What] - What threw the exception.  
     * This is usually the name of a function, but is blank for exceptions thrown due to an error in an expression.  
     * @param {(String)} [Extra] - A string value relating to the error, if available.  
     * If this value can be converted to a non-empty string, the standard error dialog displays a line with `Specifically:` followed by this string.  
     * @returns {(PropertyError)} PropertyError object.  
     */
    static Call([Message:='PropertyError', What:=A_ThisFunc, Extra:='']) => PropertyError
}

class MethodError extends MemberError {
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Error.htm#MethodError|`MethodError()`} - An attempt was made to access a method that does not exist.  
     * @method
     * @param {(String)} [Message] - A message describing the error.  
     * @param {(String)} [What] - What threw the exception.  
     * This is usually the name of a function, but is blank for exceptions thrown due to an error in an expression.  
     * @param {(String)} [Extra] - A string value relating to the error, if available.  
     * If this value can be converted to a non-empty string, the standard error dialog displays a line with `Specifically:` followed by this string.  
     * @returns {(MethodError)} MethodError object.  
     */
    static Call([Message:='MethodError', What:=A_ThisFunc, Extra:='']) => MethodError
}

class UnsetItemError extends UnsetError {
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Error.htm#UnsetItemError|`UnsetItemError()`} - An attempt was made to read the value of a an item, but there was no value.  
     * @method
     * @param {(String)} [Message] - A message describing the error.  
     * @param {(String)} [What] - What threw the exception.  
     * This is usually the name of a function, but is blank for exceptions thrown due to an error in an expression.  
     * @param {(String)} [Extra] - A string value relating to the error, if available.  
     * If this value can be converted to a non-empty string, the standard error dialog displays a line with `Specifically:` followed by this string.  
     * @returns {(UnsetItemError)} UnsetItemError object.  
     */
    static Call([Message:='UnsetItemError', What:=A_ThisFunc, Extra:='']) => UnsetItemError
}

class ValueError extends Error {
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Error.htm#ValueError|`ValueError()`} - An unexpected value was used as input for a function, property assignment, or some other operation.  
     * Usually Message indicates which expectation was broken, and Extra contains a string representing the errant value.  
     * @method
     * @param {(String)} [Message] - A message describing the error.  
     * @param {(String)} [What] - What threw the exception.  
     * This is usually the name of a function, but is blank for exceptions thrown due to an error in an expression.  
     * @param {(String)} [Extra] - A string value relating to the error, if available.  
     * If this value can be converted to a non-empty string, the standard error dialog displays a line with `Specifically:` followed by this string.  
     * @returns {(ValueError)} ValueError object.  
     */
    static Call([Message:='ValueError', What:=A_ThisFunc, Extra:='']) => ValueError
}

class IndexError extends ValueError {
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Error.htm#IndexError|`IndexError()`} - The index parameter of an object's {@link https://www.autohotkey.com/docs/v2/Objects.htm#__Item|`__Item property`} was invalid or out of range.  
     * @method
     * @param {(String)} [Message] - A message describing the error.  
     * @param {(String)} [What] - What threw the exception.  
     * This is usually the name of a function, but is blank for exceptions thrown due to an error in an expression.  
     * @param {(String)} [Extra] - A string value relating to the error, if available.  
     * If this value can be converted to a non-empty string, the standard error dialog displays a line with `Specifically:` followed by this string.  
     * @returns {(IndexError)} IndexError object.  
     */
    static Call([Message:='IndexError', What:=A_ThisFunc, Extra:='']) => IndexError
}

class ZeroDivisionError extends Error {
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Error.htm#ZeroDivisionError|`ZeroDivisionError()`} - Divison by zero was attempted in an expression or with the Mod function.  
     * @method
     * @param {(String)} [Message] - A message describing the error.  
     * @param {(String)} [What] - What threw the exception.  
     * This is usually the name of a function, but is blank for exceptions thrown due to an error in an expression.  
     * @param {(String)} [Extra] - A string value relating to the error, if available.  
     * If this value can be converted to a non-empty string, the standard error dialog displays a line with `Specifically:` followed by this string.  
     * @returns {(ZeroDivisionError)} ZeroDivisionError object.  
     */
    static Call([Message:='ZeroDivisionError', What:=A_ThisFunc, Extra:='']) => ZeroDivisionError
}

/**
 * A {@link https://www.autohotkey.com/docs/v2/lib/File.htm|`File Object`} provides an interface for file input/output.  
 * {@link https://www.autohotkey.com/docs/v2/lib/FileOpen.htm|`FileOpen()`} returns a File object.  
 * @class
 */
class File extends Object {
        /**
     * {@link https://www.autohotkey.com/docs/v2/lib/File.htm#Pos|`Pos`} retrieves or sets the position of the file pointer.  
     * The position is a byte offset from the beginning of the file, where 0 is the first byte.  
     * When data is written to or read from the file, the file pointer automatically moves to the next byte after that data.  
     * @property
     * @type {(Integer)}
     * @example <caption>  
     * Get start position of script source's 3rd line.</caption>
     * fob := FileOpen(A_ScriptFullPath, 'r')
     * loop 9
     *     fob.ReadLine()
     * MsgBox('The pointer position at the start of line 3 is: ' fob.pos)
     * fob.Close()
     */
    Pos => Integer
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/File.htm#Length|`Length`} retrieves or sets the size of the file.  
     * Length is represented in bytes.  
     * This property should be used only with an actual file.  
     * @property
     * @type {(Integer)}
     * @example <caption>  
     * Checking the size of the current script file.</caption>
     * fob := FileOpen(A_ScriptFullPath, 'r')
     * MsgBox('Size of this script: ' fob.Length ' bytes')
     * fob.Close()
     */
    Length => Integer
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/File.htm#AtEOF|`AtEOF`} retrieves a non-zero value if the file pointer has reached the end of the file.  
     * This property should be used only with an actual file.  
     * @property
     * @type {(Integer)}
     * @example <caption>  
     * Check if AT End Of File.</caption>
     * fob := FileOpen('c:\some\path\test.txt', 'r')
     * MsgBox('Size of file is: ' fob.Length ' bytes')
     * fob.Close()
     */
    AtEOF => Integer
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/File.htm#Encoding|`Encoding`} retrieves or sets the text encoding used by this file object.  
     * NewEncoding may be a numeric code page identifier (see {@link https://learn.microsoft.com/windows/win32/intl/code-page-identifiers|`Microsoft Docs`}) or one of the following strings.  
     * - `UTF-8`: Unicode UTF-8, equivalent to CP65001.  
     * - `UTF-16`: Unicode UTF-16 with little endian byte order, equivalent to CP1200.  
     * - `CPnnn`: a code page where `nnn` is a numeric identifier.  
     * Setting a new encoding never causes a BOM to be added or removed, as the BOM is normally written to the file when it is first created.  
     * @property
     * @type {(NumberString )}
     * @example <caption>  
     * Showing a file's encoding type.</caption>
     * fob := FileOpen('c:\some\path\test.txt', 'r')
     * MsgBox('This file is encoded using: ' fob.Encoding)
     * fob.Close()
     */
    Encoding => String
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/File.htm#Handle|`Handle`} retrieves a system file handle, intended for use with DllCalls. See {@link https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-createfilea|`CreateFile`}.  
     * File objects internally buffer reads or writes.  
     * If data has been written into the object's internal buffer, it is committed to disk before the handle is returned.  
     * If the buffer contains data read from file, it is discarded and the actual file pointer is reset to the logical position indicated by `FileObj.Pos`.  
     * @property
     * @type {(Integer)}
     * @example <caption>  
     * Showing a file's encoding type.</caption>
     * fob := FileOpen('c:\some\path\test.txt', 'r')
     * MsgBox('The handle to this file: ' fob.Handle)
     * fob.Close()
     */
    Handle => Integer

    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/File.htm#Read|`Read()`} reads a string of characters from the file and advances the file pointer.  
     * @method
     * @param {(Integer)} [Characters] - The maximum number of characters to read.  
     * If omitted, the rest of the file is read and returned as one string.  
     * If the File object was created from a handle to a non-seeking device such as a console buffer or pipe, omitting this parameter may cause the method to fail or return only what data is currently available.  
     * @returns {(String)} Character(s) from file.  
     * @example <caption>  
     * Opening and displaying AHK's license.</caption>
     * fob := FileOpen(A_AhkPath '\..\..\license.txt', 'r')
     * txt := fob.read()
     * fob.Close()
     * MsgBox(txt)
     */
    Read([Characters:=Unset]) => String
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/File.htm#Write|`Write()`} writes a string of characters to the file and advances the file pointer.  
     * @method
     * @param {(String)} String - The string of characters to write.  
     * @returns {(Integer)} Number of bytes (not characters) that were written to file.  
     * @example <caption>  
     * Create a text file and write to it.</caption>
     * file_path := A_ScriptDir '\testfile.txt'
     * if !FileExist(file_path)
     *     FileAppend('', file_path)
     * fob := FileOpen(file_path, 'rw')
     * bytes_written := fob.write('hello world')
     * fob.Close()
     * Run(file_path)
     */
    Write(String) => Integer

    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/File.htm#ReadLine|`ReadLine()`} reads a line of text from the file and advances the file pointer.  
     * A max of 65,534 characters per line can be read in at a time and subsequent calls to ReadLine() will get the remaining characters.  
     * @method
     * @returns {(String)} Next line of text from the file excluding the end character.  
     * @example <caption>  
     * Reading individual lines of script.</caption>
     * fob := FileOpen(A_ScriptFullPath, 'r')
     * line1 := fob.ReadLine()
     * line2 := fob.ReadLine()
     * fob.Close()
     * MsgBox('Line 1: ' line1 '`nLine 2: ' line2)
     */
    ReadLine() => String

    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/File.htm#WriteLine|`WriteLine()`} writes a string of characters followed by a new line `` `n `` or carraige return+new line `` `r`n `` (depending on the flags used to open the file), and advances the file pointer.  
     * @method
     * @param {(String)} [Text] - An optional string to write.  
     * If no parameter is passed, an empty line is inserted.  
     * @returns {(Integer)} Number of bytes that were written to file. Bytes, not characters.  
     * @example <caption>  
     * Writing individual lines to file.</caption>
     * file_path := A_ScriptDir '\testfile.txt'
     * if !FileExist(file_path)
     *     FileAppend('', file_path)
     * fob := FileOpen(file_path, 'rw')
     * fob.WriteLine('hello world')
     * fob.WriteLine('Line 2')
     * fob.WriteLine('One last line')
     * fob.Close()
     * Run(file_path)
     */
    WriteLine([Text:='']) => Integer

    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/File.htm#ReadNum|`ReadUInt()`} reads a 32-bit (4 byte) unsigned integer from the file and advances the file pointer.  
     * @method
     * @returns {(Integer|String)} On success, returns number, otherwise returns an empty string.  
     * If the number of bytes read is non-zero but less than the size of UInt, the missing bytes are assumed to be zero.  
     * @example <caption>  
     * Getting a 32-bit unsigned integer from the start of a file.</caption>
     * fob := FileOpen('c:\some\path\test.bin', 'r')
     * num := fob.ReadUInt()
     * fob.Close()
     */
    ReadUInt() => Integer | String
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/File.htm#ReadNum|`ReadInt()`} reads a 32-bit (4 byte) integer from the file and advances the file pointer.  
     * @method
     * @returns {(Integer|String)} On success, returns number, otherwise returns an empty string.  
     * If the number of bytes read is non-zero but less than the size of Int, the missing bytes are assumed to be zero.  
     * @example <caption>  
     * Getting a 32-bit signed integer from the start of a file.</caption>
     * fob := FileOpen('c:\some\path\test.bin', 'r')
     * num := fob.ReadInt()
     * fob.Close()
     */
    ReadInt() => Integer | String
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/File.htm#ReadNum|`ReadInt64()`} reads a 64-bit (8 byte) integer from the file and advances the file pointer.  
     * @method
     * @returns {(Integer|String)} On success, returns number, otherwise returns an empty string.  
     * If the number of bytes read is non-zero but less than the size of Int64, the missing bytes are assumed to be zero.  
     * @example <caption>  
     * Getting a 64-bit integer from the start of a file.</caption>
     * fob := FileOpen('c:\some\path\test.bin', 'r')
     * num := fob.ReadInt64()
     * fob.Close()
     */
    ReadInt64() => Integer | String
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/File.htm#ReadNum|`ReadShort()`} reads a 16-bit (2 byte) short integer from the file and advances the file pointer.  
     * @method
     * @returns {(Integer|String)} On success, returns number, otherwise returns an empty string.  
     * If the number of bytes read is non-zero but less than the size of Short, the missing bytes are assumed to be zero.  
     * @example <caption>  
     * Getting a 16-bit signed integer from the start of a file.</caption>
     * fob := FileOpen('c:\some\path\test.bin', 'r')
     * num := fob.ReadShort()
     * fob.Close()
     */
    ReadShort() => Integer | String
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/File.htm#ReadNum|`ReadUShort()`} reads a 16-bit (2 byte) unsigned short integer from the file and advances the file pointer.  
     * @method
     * @returns {(Integer|String)} On success, returns number, otherwise returns an empty string.  
     * If the number of bytes read is non-zero but less than the size of UShort, the missing bytes are assumed to be zero.  
     * @example <caption>  
     * Getting a 16-bit unsigned integer from the start of a file.</caption>
     * fob := FileOpen('c:\some\path\test.bin', 'r')
     * num := fob.ReadUShort()
     * fob.Close()
     */
    ReadUShort() => Integer | String
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/File.htm#ReadNum|`ReadChar()`} reads an 8-bit (1 byte) char from the file and advances the file pointer.  
     * @method
     * @returns {(Integer|String)} On success, returns number, otherwise returns an empty string.  
     * If the number of bytes read is non-zero but less than the size of Char, the missing bytes are assumed to be zero.  
     * @example <caption>  
     * Getting an 8-bit signed integer from the start of a file.</caption>
     * fob := FileOpen('c:\some\path\test.bin', 'r')
     * num := fob.ReadChar()
     * fob.Close()
     */
    ReadChar() => Integer | String
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/File.htm#ReadNum|`ReadUChar()`} reads an 8-bit (1 byte) unsigned char from the file and advances the file pointer.  
     * @method
     * @returns {(Integer|String)} On success, returns number, otherwise returns an empty string.  
     * If the number of bytes read is non-zero but less than the size of UChar, the missing bytes are assumed to be zero.  
     * @example <caption>  
     * Getting an 8-bit unsigned integer from the start of a file.</caption>
     * fob := FileOpen('c:\some\path\test.bin', 'r')
     * num := fob.ReadUChar()
     * fob.Close()
     */
    ReadUChar() => Integer | String
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/File.htm#ReadNum|`ReadDouble()`} reads a 64-bit (8 byte) floating point number from the file and advances the file pointer.  
     * @method
     * @returns {(Float|String)} On success, returns number, otherwise returns an empty string.  
     * If the number of bytes read is non-zero but less than the size of Double, the missing bytes are assumed to be zero.  
     * @example <caption>  
     * Getting a 64-bit floating point number from the start of a file.</caption>
     * fob := FileOpen('c:\some\path\test.bin', 'r')
     * num := fob.ReadDouble()
     * fob.Close()
     */
    ReadDouble() => Float | String
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/File.htm#ReadNum|`ReadFloat()`} reads a 32-bit (4 byte) floating point number from the file and advances the file pointer.  
     * @method
     * @returns {(Float|String)} On success, returns number, otherwise returns an empty string.  
     * If the number of bytes read is non-zero but less than the size of Float, the missing bytes are assumed to be zero.  
     * @example <caption>  
     * Getting a 32-bit floating point number from the start of a file.</caption>
     * fob := FileOpen('c:\some\path\test.bin', 'r')
     * num := fob.ReadFloat()
     * fob.Close()
     */
    ReadFloat() => Float | String
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/File.htm#WriteNum|`WriteUInt()`} writes a 32-bit (4 byte) unsigned integer to the file and advances the file pointer.  
     * @method
     * @returns {(Integer)} Returns the number of bytes that were written.  
     * @example <caption>  
     * Writing a 32-bit unsigned integer to the start of a file.</caption>
     * fob := FileOpen('c:\some\path\test.bin', 'rw')
     * num := fob.WriteUInt(42)
     * fob.Close()
     */
    WriteUInt(Integer) => Integer
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/File.htm#WriteNum|`WriteInt()`} writes a 32-bit (4 byte) integer to the file and advances the file pointer.  
     * @method
     * @returns {(Integer)} Returns the number of bytes that were written.  
     * @example <caption>  
     * Writing a 32-bit signed integer to the start of a file.</caption>
     * fob := FileOpen('c:\some\path\test.bin', 'rw')
     * num := fob.WriteInt(42)
     * fob.Close()
     */
    WriteInt(Integer) => Integer
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/File.htm#WriteNum|`WriteInt64()`} writes a 64-bit (8 byte) integer to the file and advances the file pointer.  
     * @method
     * @returns {(Integer)} Returns the number of bytes that were written.  
     * @example <caption>  
     * Writing a 64-bit integer to the start of a file.</caption>
     * fob := FileOpen('c:\some\path\test.bin', 'rw')
     * num := fob.WriteInt64(42)
     * fob.Close()
     */
    WriteInt64(Integer) => Integer
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/File.htm#WriteNum|`WriteShort()`} writes a 16-bit (2 byte) short integer to the file and advances the file pointer.  
     * @method
     * @returns {(Integer)} Returns the number of bytes that were written.  
     * @example <caption>  
     * Writing a 16-bit signed integer to the start of a file.</caption>
     * fob := FileOpen('c:\some\path\test.bin', 'rw')
     * num := fob.WriteShort(42)
     * fob.Close()
     */
    WriteShort(Number) => Integer
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/File.htm#WriteNum|`WriteUShort()`} writes a 16-bit (2 byte) unsigned short integer to the file and advances the file pointer.  
     * @method
     * @returns {(Integer)} Returns the number of bytes that were written.  
     * @example <caption>  
     * Writing a 32-bit unsigned integer to the start of a file.</caption>
     * fob := FileOpen('c:\some\path\test.bin', 'rw')
     * num := fob.WriteUShort(-42)
     * fob.Close()
     */
    WriteUShort(Number) => Integer
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/File.htm#WriteNum|`WriteChar()`} writes an 8-bit (1 byte) char to the file and advances the file pointer.  
     * @method
     * @returns {(Integer)} Returns the number of bytes that were written.  
     * @example <caption>  
     * Writing an 8-bit signed integer to the start of a file.</caption>
     * fob := FileOpen('c:\some\path\test.bin', 'rw')
     * num := fob.WriteChar(42)
     * fob.Close()
     */
    WriteChar(Number) => Integer
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/File.htm#WriteNum|`WriteUChar()`} writes an 8-bit (1 byte) unsigned char to the file and advances the file pointer.  
     * @method
     * @returns {(Integer)} Returns the number of bytes that were written.  
     * @example <caption>  
     * Writing a 8-bit unsigned integer to the start of a file.</caption>
     * fob := FileOpen('c:\some\path\test.bin', 'rw')
     * num := fob.WriteUChar(-42)
     * fob.Close()
     */
    WriteUChar(Number) => Integer
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/File.htm#WriteNum|`WriteDouble()`} writes a 64-bit (8 byte) floating point number to the file and advances the file pointer.  
     * @method
     * @returns {(Number)} Returns the number of bytes that were written.  
     * @example <caption>  
     * Writing a 32-bit floating point number to the start of a file.</caption>
     * fob := FileOpen('c:\some\path\test.bin', 'rw')
     * num := fob.WriteDouble(3.14)
     * fob.Close()
     */
    WriteDouble(Float) => Integer
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/File.htm#WriteNum|`WriteFloat()`} writes a 32-bit (4 byte) floating point number to the file and advances the file pointer.  
     * @method
     * @returns {(Number)} Returns the number of bytes that were written.  
     * @example <caption>  
     * Writing a 64-bit floating point number to the start of a file.</caption>
     * fob := FileOpen('c:\some\path\test.bin', 'rw')
     * num := fob.WriteFloat(3.14)
     * fob.Close()
     */
    WriteFloat(Float) => Integer
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/File.htm#RawRead|`RawRead()`} reads raw binary data from the file into memory and advances the file pointer.  
     * @method
     * @param {(Integer)} Buffer - Either a {@link https://www.autohotkey.com/docs/v2/lib/Buffer.htm|`Buffer`}-like object or the memory address which will receive the data.  
     * @param {(Integer)} [Bytes] - The maximum number of bytes to read.  
     * This parameter is optional if Buffer is an object.  
     * @returns {(Integer)} Number of bytes that were read.  
     * @throws {Error} - If bytes exceeds the size of the buffer.  
     * @example <caption>  
     * Getting the first 64 bytes of data from a file.</caption>
     * fob := FileOpen('c:\some\path\test.bin', 'r')
     * buff := Buffer(64)
     * bin_data := fob.RawRead(buff, 64)
     * fob.Close()
     */
    RawRead(Buffer [, Bytes:=Buffer.Size]) => Integer

    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/File.htm#RawWrite|`RawWrite()`} writes raw binary data to the file and advances the file pointer.  
     * @method
     * @param {(Buffer|String|Integer)} Buffer - Either a {@link https://www.autohotkey.com/docs/v2/lib/Buffer.htm|`Buffer`}-like object, a string containing binary data, or a memory address containing the data.  
     * @param {(Integer)} [Bytes] - The number of bytes to write.  
     * This parameter is optional if Buffer is an object or a string.  
     * @returns {(Integer)} Number of bytes that were read.  
     * @throws {Error} - If bytes exceeds the size of the buffer.  
     * @example <caption>  
     * Writing binary data to a file.</caption>
     * fob := FileOpen('c:\some\path\test.bin', 'rw')
     * buff := Buffer(8)
     * num := fob.RawWrite(buff)
     * fob.Close()
     */
    RawWrite(Data [, Bytes:=Buffer.Size]) => Integer

    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/File.htm#Seek|`Seek()`} moves the file pointer.  
     * @param {(Integer)} Distance - Distance to move, in bytes. Lower values are closer to the beginning of the file.  
     * @param {(Integer)} [Origin] - Starting point for the file pointer move. Must be one of the following:
     * - `0` (SEEK_SET): Beginning of the file. Distance must be zero or greater.  
     * - `1` (SEEK_CUR): Current position of the file pointer.  
     * - `2` (SEEK_END): End of the file. Distance should usually be negative.  
     * If omitted, Origin defaults to SEEK_END when Distance is negative and SEEK_SET otherwise.  
     * @returns {(Integer)} 1 on success, 0 on failure  
     * @example <caption>  
     * Set the file pointer 32 bytes in.</caption>
     * fob := FileOpen('c:\some\path\test.txt', 'r')
     * fob.Seek(32, 0)
     */
    Seek(Distance [, Origin:=0]) => Integer

    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/File.htm#Close|`Close()`} closes the file, flushes any data in the cache to disk, and releases the share locks.  
     * As a good practice, it is recommended to close the file as soon as possible.  
     * The file is closed automatically when the object is freed.  
     * @returns {(String)} An empty string is always returned.  
     * @example <caption>  
     * Closing an open file to access it.</caption>
     * path := A_ScriptDir '\testfile.txt'
     * fob := FileOpen(path, 'w')
     * fob.Write('Hello, world!')
     * try FileAppend('`nline 2', path)
     * catch
     *     MsgBox('Could not write to an open file')
     * fob.Close()
     * try FileAppend('`nline 2', path)
     * catch
     *     MsgBox('Could not write to an open file')
     * Run(path)
     */
    Close() => EmptyString
}

/**
 * A {@link https://www.autohotkey.com/docs/v2/lib/Func.htm|`Func`} represents a user-defined or built-in function.  
 * The Closure class extends Func but does not define any new properties.  
 * @class
 */
class Func extends Object {

    /**
     * An {@link https://www.autohotkey.com/docs/v2/lib/Enumerator.htm|`Enumerator`} object is a type of {@link https://www.autohotkey.com/docs/v2/misc/Functor.htm|`function object`} which is called repeatedly to enumerate (cycle through) a sequence of values in an object.  
     * Enumerators are primarily used with {@link https://www.autohotkey.com/docs/v2/lib/For.htm|`For-loops`} and are not usually called directly.  
     * While built-in enumerators are instances of the Enumerator class, any function object can potentially be used with a for-loop.  
     * @class
     * @example <caption>  
     * Different ways to use enumerators</caption>
     * arr := ['a', 'b', 'c']
     * 
     * ; Enumerator that only returns the value of each element
     * enum := arr.__Enum(1)
     * for value in enum
     *     MsgBox('for-loop`nvalue only: ' value)
     * 
     * ; Enumerator that returns the index and value of each element
     * enum := arr.__Enum(2)
     * for index, value in enum
     *     MsgBox('for-loop`nindex: ' index '`nvalue: ' value)
     * 
     * ; Using an enumerator with a while-loop
     * enum := arr.__Enum()
     * while enum(&index, &value)
     *     MsgBox('while-loop`nindex: ' index '`nvalue: ' value)
     */
    class Enumerator extends Func {
        /**
         * Retrieves the next item or items in an enumeration.  
         * @method
         * @param {(VarRef)} OutputVar1 - Variable to store index, key, or value.  
         * - `__Enum(1)` - OutputVar1 receives the value for each element.  
         * - `__Enum(2)` - OutputVar1 receives the key/index for each map/array element, respectively.  
         * @param {(VarRef)} [OutputVar2] - Variable to store each element's value.  
         * OutputVar2 will always contain the valuea dn only when `__Enum(2)` is used.  
         * @returns {(Integer)} Non-zero integer if successful or zero if there were no items remaining.  
         * @example <caption>  
         * Different ways to use enumerators</caption>
         * arr := ['a', 'b', 'c']
         * 
         * ; Enumerator that only returns the value of each element
         * enum := arr.__Enum(1)
         * for value in enum
         *     MsgBox('for-loop`nvalue only: ' value)
         * 
         * ; Enumerator that returns the index and value of each element
         * enum := arr.__Enum(2)
         * for index, value in enum
         *     MsgBox('for-loop`nindex: ' index '`nvalue: ' value)
         * 
         * ; Using an enumerator with a while-loop
         * enum := arr.__Enum()
         * while enum(&index, &value)
         *     MsgBox('while-loop`nindex: ' index '`nvalue: ' value)
         */
        Call(&OutputVar1 [, &OutputVar2]) => Integer
    }
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Func.htm#Name|`Name`} returns the function's name.  
     * @type {(String)}
     * @example <caption>  
     * Get a function's name from a reference.</caption>
     * func_reference := MsgBox
     * MsgBox('Function original name: ' func_reference.Name)
     */
    Name => String
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Func.htm#IsBuiltIn|`IsBuiltIn`} is set to 1 if the function is a built-in, native AHK function, otherwise it is 0.  
     * @type {(Integer)}
     * @example <caption>  
     * How to check if a function is provided natively by AHK.</caption>
     * if MsgBox.IsBuiltIn
     *     MsgBox('Yes, MsgBox is a built-in function of the language.')
     */
    IsBuiltIn => Integer
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Func.htm#IsVariadic|`IsVariadic`} is set to 1 if the function is {@link https://www.autohotkey.com/docs/v2/Functions.htm#Variadic|`variadic`}, otherwise 0.  
     * Only the last parameter of a function can be variadiac.
     * @type {(Integer)}
     * @example <caption>  
     * Check if the last parameter is variadiac.</caption>
     * if my_func.IsVariadic
     *     MsgBox('The last parameter of this function is variadic.')
     *  
     * my_func(mandatory, optional:='default', variadic_arr*) {
     *     return
     * }
     */
    IsVariadic => Number
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Func.htm#MinParams|`MinParams`} returns the number of required parameters.  
     * Optional and variadic parameters are not included.
     * @type {(Number)}
     * @example <caption>  
     * Checking all parameters of a function.</caption>
     * MsgBox('The ' my_func.Name ' function has ' (my_func.MaxParams + my_func.IsVariadic) ' parameters.'
     *     '`nRequired parameters: ' my_func.MinParams
     *     '`nOptional parameters: ' (my_func.MaxParams - my_func.MinParams)
     *     '`nLast parameter is variadic: ' (my_func.IsVariadic ? 'True' : 'False')
     * )
     * 
     * my_func(mandatory1, mandatory2, opt1:='default', opt2:='default', variadic*) {
     *     return
     * }
     */
    MinParams => Number  
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Func.htm#MaxParams|`MaxParams`} returns the number of formally-declared parameters for a user-defined function or maximum parameters for a built-in function.  
     * If the function is {@link https://www.autohotkey.com/docs/v2/Functions.htm#Variadic|`variadic`}, the returned number indicates the maximum amount of parameters which can be accepted by the function without overflowing into the "variadic*" parameter.  
     * @type {(Integer)}
     * @example <caption>  
     * Checking all parameters of a function.</caption>
     * MsgBox('The ' my_func.Name ' function has ' (my_func.MaxParams + my_func.IsVariadic) ' parameters.'
     *     '`nRequired parameters: ' my_func.MinParams
     *     '`nOptional parameters: ' (my_func.MaxParams - my_func.MinParams)
     *     '`nLast parameter is variadic: ' (my_func.IsVariadic ? 'True' : 'False')
     * )
     * 
     * my_func(mandatory1, mandatory2, opt1:='default', opt2:='default', variadic*) {
     *     return
     * }
     */
    MaxParams => Integer

    /**
     *{@link https://www.autohotkey.com/docs/v2/lib/Func.htm#Call|`Call()`} calls the function.  
     * @method
     * @param {(Any)} [Params] - Any amount of parameters, separated by commas.  
     * Each parameter must be separated by a comma.  
     * @returns {(Any)} Return values, if any, are defined within each function.  
     * An empty string is returned if no return value is explicitly provided.
     */
    Call([Params]) => Any
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Func.htm#Bind|`Bind()`} binds parameters to the function and returns a {@link https://www.autohotkey.com/docs/v2/misc/Functor.htm#BoundFunc|`BoundFunc object`}.  
     * For details and examples, see {@link https://www.autohotkey.com/docs/v2/misc/Functor.htm#BoundFunc|`BoundFunc object`}.  
     * @method
     * @param {(Any)} [Param1] - Provide a predefined value for the first param of the function.  
     * @param {(Any)} [ParamN] - Any amount of additional parameters to bind.  
     * Any parameter can be skipped, leaving that parameter empty. A value can be provided
     * later during the function Call().
     * Parameter slots can be skipped to pass values onto other parameters.  
     * @returns {(BoundFunc object)}
     * @example <caption>  
     * Creating a BoundFunc by using a function's .Bind method.</caption>
     * ; Binding a parameter and calling the boundfunc
     * hello := MsgBox.Bind('Hello, world!', 'Oh, hi!')
     * hello()
     * 
     * ; Creating a boundfunc for a SetTimer callback
     * farewell := MsgBox.Bind('Goodbye, world.', 'Bye-bye!')
     * SetTimer(farewell, -3000)
     */
    Bind([Param1, ParamN]) => BoundFunc
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Func.htm#IsByRef|`IsByRef()`} determines whether a parameter is ByRef.  
     * @method
     * @param {(Integer)} [ParamIndex] - The index number of the parameter, starting at 1.  
     * If ParamIndex is omitted, all parameters are checked.  
     * @returns {(Number)} 1 if parameter is ByRef, otherwise 0.  
     * @throws {IndexError} - ParamIndex is out of range.  
     * @example <caption>  
     * Checking for parameters that are "By Reference"</caption>
     * if my_func.IsByRef()
     *     MsgBox('my_func has at least one parameter that is By Reference.')
     * 
     * loop my_func.MaxParams
     *     if my_func.IsByRef(A_Index)
     *         MsgBox('Parameter #' A_Index ' is by reference parameter.')
     *     else MsgBox('Parameter #' A_Index ' is a normal parameter.')
     * 
     * my_func(mandatory, optional:='default', variadic*) {
     *     return
     * }
     */
    IsByRef([ParamIndex:=Unset]) => Integer
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Func.htm#IsOptional|`IsOptional()`} determines whether a parameter is optional.  
     * @method
     * @param {(Integer)} [ParamIndex] - The index number of the parameter, starting at 1.  
     * If ParamIndex is omitted, all parameters are checked.  
     * @returns {(Integer)} 1 if parameter is Optional, otherwise 0.  
     * @throws {IndexError} - ParamIndex is out of range.  
     * @example <caption>  
     * Checking for optional parameters.</caption>
     * if my_func.IsOptional()
     *     MsgBox('my_func has at least one optional parameter')
     * 
     * loop my_func.MaxParams
     *     if my_func.IsOptional(A_Index)
     *         MsgBox('Parameter #' A_Index ' is optional.')
     *     else MsgBox('Parameter #' A_Index ' is mandatory.')
     * 
     * my_func(mandatory, optional:='default', variadic*) {
     *     return
     * }
     */
    IsOptional([ParamIndex:=Unset]) => Integer
}  

/**
 * A {@link https://www.autohotkey.com/docs/v2/misc/Functor.htm#BoundFunc|`BoundFunc Object`} acts like a function, but has predefined parameters.  
 * BoundFunc objects can be created in two ways:  
 * - Using a function's {@link https://www.autohotkey.com/docs/v2/lib/Func.htm#Bind|`Bind()`} method
 *   Creates a function boundfunc.
 * - Using the {@link https://www.autohotkey.com/docs/v2/lib/ObjBindMethod.htm|`ObjBindMethod()`} function.  
 *   Creates a method boundfunc.
 * To skip a parameter, leave that bind slot (index) blank. See example.  
 * Boundfuncs can be used with: {@link https://www.autohotkey.com/docs/v2/lib/CallbackCreate.htm|`CallbackCreate`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm|`Gui events`}
 * , {@link https://www.autohotkey.com/docs/v2/lib/For.htm|`For-loops`}, {@link https://www.autohotkey.com/docs/v2/lib/HotIf.htm|`HotIf`}, {@link https://www.autohotkey.com/docs/v2/lib/Hotkey.htm|`Hotkey`}
 * , {@link https://www.autohotkey.com/docs/v2/lib/Hotstring.htm|`Hotstring`}, {@link https://www.autohotkey.com/docs/v2/lib/InputHook.htm|`InputHook`} (OnEnd, OnChar, OnKeyDown, OnKeyUp)
 * , {@link https://www.autohotkey.com/docs/v2/lib/Menu.htm#Add|`Menu.Add`}, {@link https://www.autohotkey.com/docs/v2/lib/OnClipboardChange.htm|`OnClipboardChange`}
 * , {@link https://www.autohotkey.com/docs/v2/lib/OnError.htm|`OnError`}, {@link https://www.autohotkey.com/docs/v2/lib/OnExit.htm|`OnExit`}
 * , {@link https://www.autohotkey.com/docs/v2/lib/OnMessage.htm|`OnMessage`}, {@link https://www.autohotkey.com/docs/v2/misc/RegExCallout.htm|`RegEx callouts`}
 * , {@link https://www.autohotkey.com/docs/v2/lib/SetTimer.htm|`SetTimer`}, {@link https://www.autohotkey.com/docs/v2/lib/Sort.htm|`Sort`}
 * @class
 * @example <caption>  
 * Autofire using a boundfunc and settimer.</caption>
 * *LButton::auto_click('LButton')
 * 
 * auto_click(hold_key) {
 *     if !GetKeyState(hold_key, 'P')
 *         return
 *     Click()
 *     callback := auto_click.Bind(hold_key)
 *     SetTimer(callback, -50)
 * }
 */
class BoundFunc extends Func {
}

/**
 * A {@link https://www.autohotkey.com/docs/v2/Functions.htm#closures|`Closure`} is a nested function bound to a set of free variables.  
 * Free variables are variables from the outer function which are also used by the closure function.  
 * Closures allow nested functions to share variables with the outer function, even after the outer function has returned.  
 * To create a closure, simply define a function inside another function and have the inner function reference a variable from the outer function.  
 * @class
 * @example <caption>  
 * Demonstrating closure vs static function</caption>
 * outer_func()
 * 
 * outer_func() {
 *     x := 'outer_func variable text'
 *     static_fn()
 *     closure_fn()
 *     return
 *     
 *     static static_fn() {
 *         if IsSet(x)
 *             Msgbox('x is set to: ' x)
 *         else
 *             MsgBox('x is not set.')
 *     }
 *     
 *     closure_fn() {
 *         MsgBox('Unlike a static func, a closure func can access the variables in outer_func().'
 *         '`nx is set to: ' x)
 *     }
 * }
 */
class Closure extends Func {
    
}

/**
 * A {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm|`GUI`} provides the ability to create and manage custom windows and controls.  
 * Such windows can be used for a multitude of things, including data entry, hotkeys, file trees, or any other custom user interfaces.  
 * Gui objects can be created with Gui() and retrieved with {@link https://www.autohotkey.com/docs/v2/lib/GuiFromHwnd.htm|`GuiFromHwnd`}.  
 * @class
 * @example
 * goo := Gui([Options:='', Title:=A_ScriptName, EventObj:=Unset]) => Gui
 */
class Gui extends Object {
    /**
     * 
     */
    class Control extends Object {
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#ClassNN|`ClassNN`} retrieves the class name and sequence number (ClassNN) of the control.  
         * @property
         * @type {(String)}
         * @see {@link https://www.autohotkey.com/docs/v2/lib/ControlGetClassNN.htm|`ControlGetClassNN`}
         */
        ClassNN => String
    
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Enabled|`Enabled`} retrieves interaction state of the control or sets control stat to enabled/disabled.  
         * * `1`: enabled  
         * * `0`: disabled  
         * 
         * For Tab controls, this will also enable or disable all of the tab's sub-controls.  
         * @property
         * @type {(Integer)}
         */
        Enabled => Integer
    
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Focused|`Focused`} retrieves the focus state of the control.  
         * * `1`: focused  
         * * `0`: not focused  
         * 
         * To focus the control, use the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Focus|`Focus()`} method.
         * @property
         * @type {(Integer)}
         */
        Focused => Integer
    
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Gui|`Gui`} retrieves a reference to the control's parent {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm|`GUI object`}.  
         * @property
         * @type {(Gui)}
         */
        Gui => Gui
        
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Hwnd|`Hwnd`} retrieves the window handle (HWND) of the control.  
         * @see {@link https://www.autohotkey.com/docs/v2/lib/PostMessage.htm|`PostMessage()`}
         * , {@link https://www.autohotkey.com/docs/v2/lib/SendMessage.htm|`SendMessage()`}
         * , {@link https://www.autohotkey.com/docs/v2/lib/DllCall.htm|`DllCall()`}
         * , {@link https://www.autohotkey.com/docs/v2/lib/Control.htm#Parameter|`Control parameter`}
         * @property
         * @type {(Integer)}
         */
        Hwnd => Integer
        
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Name|`Name`} retrieves or sets the explicit name of the control.  
         * A control name can also be set by using the `v` (var) option:  
         * - Creating a control:  
         * 
         *       GuiObject.AddButton('vExitBtn', 'Exit')
         * - Add with the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Opt|`Opt()`} method:  
         * 
         *       GuiControl.Opt('vExitBtn')
         * @property
         * @type {(String)}
         */
        Name => String
    
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Text|`Text`} retrieves or sets the text/caption of the control.  
         * @property
         * @type {(String)}
         */
        Text => String
    
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Type|`Type`} retrieves the type of the control.  
         * `ActiveX`, `Button`, `CheckBox`, `ComboBox`, `Custom`, `DateTime`, `DDL`, `Edit`, `GroupBox`, `Hotkey`, `Link`, `ListBox`, `ListView`, `MonthCal`, `Pic`, `Progress`, `Radio`, `Slider`, `StatusBar`, `Tab`, `Tab2`, `Tab3`, `Text`, `TreeView`, `UpDown`
         * @property
         * @type {(String)}
         */
        Type => String
    
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`Visible`} retrieves the current visibility state of the control, or shows or hides it.  
         * @property
         * @type {(Integer)}
         */
        Visible => Integer
        
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Focus|`Focus()`} sets the keyboard focus to this control.  
         * To be effective, the window generally must not be minimized or hidden.  
         * To retrieve the focus state of the control, use the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Focused|`Focused`} property.  
         * @method
         * @returns {(String)} An empty string is always returned.  
         * @example <caption>  
         * Focusing a specific control.</caption>
         * goo := Gui()
         * goo.btn_exit := goo.AddButton('xm ym w100', 'Exit Script')
         * goo.btn_exit.OnEvent('Click', (*) => ExitApp())
         * goo.btn_msg := goo.AddButton('xm w100', 'PopUp Msg')
         * goo.btn_msg.OnEvent('Click', (*) => MsgBox('Pop Up!'))
         * goo.btn_exit.Focus()
         * txt := 'Even though "PopUp Msg" was added last, the '
         *     . '`nFocused button was set to "' goo.FocusedCtrl.Text '"'
         * goo.AddText('xm', txt)
         * goo.Show('y200')
         */
        Focus() => EmptyString
    
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#GetPos|`GetPos()`} retrieves the position and size of the control.  
         * Unlike {@link https://www.autohotkey.com/docs/v2/lib/ControlGetPos.htm|`ControlGetPos()`}, this method applies {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#DPIScale|`DPI scaling`} to the returned coordinates.  
         * @method
         * @param {(VarRef)} [X] - Store x coordinate of control on the GUI
         * @param {(VarRef)} [Y] - Store y coordinate of control on the GUI
         * @param {(VarRef)} [Width] - Store width of control
         * @param {(VarRef)} [Height] - Store height of control
         * @returns {(String)} An empty string is always returned.  
         * @example <caption>  
         * Adjust button attributes using checkboxes.</caption>
         * goo := Gui()
         * goo.MarginX := goo.MarginY := 10
         * goo.AddText('xm ym', 'Check boxes to change button:')
         * goo.cb_tall := goo.AddCheckbox('xm w100 h30 vTall', 'Make Tall')
         * goo.cb_tall.OnEvent('Click', check_events)
         * goo.cb_wide := goo.AddCheckbox('x+m w100 h30 vWide', 'Make Wide')
         * goo.cb_wide.OnEvent('Click', check_events)
         * goo.btn_exit := goo.AddButton('xm', 'ExitScript')
         * goo.btn_exit.OnEvent('Click', (*) => ExitApp())
         * goo.Show('h150')
         * 
         * check_events(control, info) {
         *     control.gui.btn_exit.GetPos(,, &w, &h)
         *     switch control.name {
         *         case 'Tall':
         *             if (h > 30)
         *                 h := 30
         *             else h := 60
         *         case 'Wide': 
         *             if (w > 100)
         *                 w := 100
         *             else w := 200
         *     }
         *     control.gui.btn_exit.Move(,, w, h)
         * }
         */
        GetPos([&X, &Y, &Width, &Height]) => EmptyString
    
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Move|`Move()`} moves and/or resizes the control.  
         * Unlike {@link https://www.autohotkey.com/docs/v2/lib/ControlMove.htm|`ControlMove()`}, this method applies {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#DPIScale|`DPI scaling`} to the returned coordinates.  
         * @method
         * @param {(Integer)} [X] - New x coordinate.  
         * @param {(Integer)} [Y] - New y coordinate.  
         * @param {(Integer)} [Width] - New control width.  
         * @param {(Integer)} [Height] - New control height.  
         * @returns {(String)} An empty string is always returned.  
         * @example <caption>  
         * Adjust button attributes using checkboxes.</caption>
         * goo := Gui()
         * goo.MarginX := goo.MarginY := 10
         * goo.AddText('xm ym', 'Check boxes to change button:')
         * goo.cb_tall := goo.AddCheckbox('xm w100 h30 vTall', 'Make Tall')
         * goo.cb_tall.OnEvent('Click', check_events)
         * goo.cb_wide := goo.AddCheckbox('x+m w100 h30 vWide', 'Make Wide')
         * goo.cb_wide.OnEvent('Click', check_events)
         * goo.btn_exit := goo.AddButton('xm', 'ExitScript')
         * goo.btn_exit.OnEvent('Click', (*) => ExitApp())
         * goo.Show('h150')
         * 
         * check_events(control, info) {
         *     control.gui.btn_exit.GetPos(,, &w, &h)
         *     switch control.name {
         *         case 'Tall':
         *             if (h > 30)
         *                 h := 30
         *             else h := 60
         *         case 'Wide': 
         *             if (w > 100)
         *                 w := 100
         *             else w := 200
         *     }
         *     control.gui.btn_exit.Move(,, w, h)
         * }
         */
        Move([X, Y, Width, Height]) => EmptyString
        
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#OnCommand|`OnCommand()`} registers a function or method to be called when a control notification is received via the {@link https://learn.microsoft.com/windows/win32/menurc/wm-command|`WM_COMMAND message`}.  
         * @method
         * @param {(Integer)} NotifyCode - The control-defined notification code to monitor.  
         * @param {(String|FuncObj)} Callback - The function, method, boundfunc, or object to call when the event is raised.  
         * If the GUI has an event sink and this is a string, it's used as the name of a method belonging to the event sink.  
         * @param {(Integer)} [AddRemove] - Adjust callback order or delete callback. If omitted, parameter defaults to 1.  
         * - `1` = Add the callback after any previously registered callbacks.  
         * - `-1` = Add the callback before any previously registered callbacks.  
         * - `0` = Remove the callback.  
         * @returns {(String)} An empty string is always returned.  
         * @see {@link https://www.autohotkey.com/docs/v2/misc/SendMessageList.htm|`WM - Window Messages`}
         * , {@link https://www.autohotkey.com/docs/v2/lib/GuiOnCommand.htm|`OnCommand()`}
         * , {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm|`OnEvent()`}
         */
        OnCommand(NotifyCode, Callback [, AddRemove:=1]) => EmptyString
    
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Events|`OnEvent()`} assigns a {@link https://www.autohotkey.com/docs/v2/Functions.htm|`Function`}, 
         * {@link https://www.autohotkey.com/docs/v2/Concepts.htm#methods|`Method`},  
         * or {@link https://www.autohotkey.com/docs/v2/lib/Object.htm|`Object`} to be called when a specified event happens.  
         * @method
         * @param {(String)} EventName - One of the following event(s):  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Change|`Change`} - The control's value changes.  
         * 
         *       Ctrl_Change(GuiCtrlObj, Info)
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Click|`Click`} - The control is clicked.  
         * 
         *       Ctrl_Click(GuiCtrlObj, Info)  
         *       Link_Click(GuiCtrlObj, Info, Href)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#DoubleClick|`DoubleClick`} - The control is double-clicked.  
         * 
         *       Ctrl_DoubleClick(GuiCtrlObj, Info)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#ColClick|`ColClick`} - One of the ListView's column headers is clicked.  
         * 
         *       Ctrl_ColClick(GuiCtrlObj, Info)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Ctrl-ContextMenu|`ContextMenu`} - The user right-clicks the control  
         *   or presses Menu or Shift+F10 while the control has the keyboard focus.  
         * 
         *       Ctrl_ContextMenu(GuiCtrlObj, Item, RightClicked, X, Y)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Focus|`Focus`} - The control gains the keyboard focus.  
         * 
         *       Ctrl_Focus(GuiCtrlObj, Reserved)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#LoseFocus|`LoseFocus`} - The control loses the keyboard focus.  
         * 
         *       Ctrl_LoseFocus(GuiCtrlObj, Reserved)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#ItemCheck|`ItemCheck`} - A ListView or TreeView item is checked or unchecked.  
         * 
         *       Ctrl_ItemCheck(GuiCtrlObj, Item, Checked)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#ItemEdit|`ItemEdit`} - A ListView or TreeView item's label is edited by the user.  
         * 
         *       Ctrl_ItemEdit(GuiCtrlObj, Item)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#ItemExpand|`ItemExpand`} - A TreeView item is expanded or collapsed.  
         * 
         *       Ctrl_ItemExpand(GuiCtrlObj, Item, Expanded)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#ItemFocus|`ItemFocus`} - The focused item changes in a ListView.  
         * 
         *       Ctrl_ItemFocus(GuiCtrlObj, Item)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#ItemSelect|`ItemSelect`} - A ListView or TreeView item is selected, or a ListView item is deselected.  
         * 
         *       ListView_ItemSelect(GuiCtrlObj, Item, Selected)  
         *       TreeView_ItemSelect(GuiCtrlObj, Item)
         * @param {(String|FuncObj)} Callback - A function, method,  
         * or object that is called when the event is raised.  
         * A callback's first parameter is always the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm|`GuiControl`} that raised the event.  
         * @param {(Integer)} [AddRemove] - Adjust callback order or delete callback.  
         * - `1` = Add the callback after any previously registered callbacks.  
         * - `-1` = Add the callback before any previously registered callbacks.  
         * - `0` = Remove the callback.  
         * 
         * If multiple callbacks are registered, a callback that returns  
         * a non-empty string will stop all remaining callbacks from running.  
         * @returns {(String)} An empty string is always returned.  
         * @example <caption>  
         * </caption>
         */
        OnEvent(EventName, Callback [, AddRemove:=1]) => EmptyString
        
        /**
         * Registers a function or method to be called when a control notification  
         * is received via the {@link https://learn.microsoft.com/windows/win32/controls/wm-notify|`WM_NOTIFY`} message.  
         * @method
         * @param {(Integer)} NotifyCode - The control-defined notification code to monitor.  
         * @param {(String|FuncObj)} Callback - The function, method, boundfunc,  
         * or object to call when the event is raised.  
         * If the GUI has an event sink and this is a string, it's used  
         * as the name of a method belonging to the event sink.  
         * @param {(Integer)} [AddRemove] - Adjust callback order or delete callback.  
         * If omitted, parameter defaults to 1.  
         * - `1` = Add the callback after any previously registered callbacks.  
         * - `-1` = Add the callback before any previously registered callbacks.  
         * - `0` = Remove the callback.  
         * @returns {(String)} An empty string is always returned.  
         * @see {@link https://www.autohotkey.com/docs/v2/lib/GuiOnNotify.htm|`OnNotify()`}
         * , {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm|`OnEvent()`}
         */
        OnNotify(NotifyCode, Callback [, AddRemove:=1]) => EmptyString
        
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Opt|`Opt()`} sets various options to change a control's appearance or behaviors.  
         * @method
         * @param {(String)} Options - Any {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#OtherOptions|`general`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm|`control-specific`} options, separated by spaces/tabs.  
         * **Common Styles and Other Options**  
         * Prefix with `-` to disable an option and `+` (or no sign) to add an option.  
         * - `Vstring`: Assign a {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Name|`Name`} to a control where `string` is the new name.  
         *   A control's name can be used to get a reference to that control from a GUI object.  
         *
         *       GuiControl.Opt('+VMyControl')  
         *       GuiControl := Gui['MyControl']  
         * - `Events`: Handled by the control's {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm|`OnEvent()` method}.  
         * - `AltSubmit`: Use control's alternate submit method.  
         *   DropDownList, ComboBox, ListBox, Tab: {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Submit|`Gui.Submit`} uses selected item's position instead of its text.  
         *   ComboBox: If no item is selected, the text of the edit field is stored.  
         * - `C#`: Set text color where `#` is one of the following:  
         *   - RGB hex value (0x prefix is optional): `C0x000000` to `CFFffFF`  
         *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}: `CBlack`, `CSilver`, `CGray`, `CWhite`, `CMaroon`, `CRed`, `CPurple`  
         *     `CFuchsia`, `CGreen`, `CLime`, `COlive`, `CYellow`, `CNavy`, `CBlue`, `CTeal`, `CAqua`  
         *   - Reset/Default: `CDefault` or `C`  
         *   The color option does not affect {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Button|`buttons`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#StatusBar|`status bars`}.  
         * - `Disabled`: Disables the control preventing user focus or modifications of the contents.  
         *   Control can be enabled using `-Disabled` or setting {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Enabled`} to true.  
         *   A `0` for enabled or `1` for disabled can immediately follow `Disabled`.  
         *
         *       con.Opt('+Disabled0')
         *       var := 1, con.Opt('+Disabled' var)
         * - `Hidden`: The control is initially invisible.  
         *   Use `-Hidden` or {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Visible`} to unhide it.  
         *   A `0` for visible or `1` for hidden can immediately follow `Hidden`.  
         * 
         *       con.Opt('+Hidden0')
         *       var := 1, con.Opt('+Hidden' var)
         * - `Left`: Left-justifies the control's text within its available width.  
         *   Applies to: {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Button|`Button`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Checkbox|`Checkbox`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#DateTime|`DateTime`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Edit|`Edit`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#GroupBox|`GroupBox`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Radio|`Radio`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Slider|`Slider`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Tab|`Tab`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Tab|`Tab2`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Text|`Text`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#UpDown|`UpDown`}
         * - `Right`: Right-justifies the control's text within its available width.  
         *   For {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Checkbox|`Checkbox`} and {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Radio|`Radio Buttons`}, this also moves the box from the left side to the right.  
         *   Applies to: {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Button|`Button`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Checkbox|`Checkbox`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#DateTime|`DateTime`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Edit|`Edit`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#GroupBox|`GroupBox`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Link|`Link`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Radio|`Radio`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Slider|`Slider`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Tab|`Tab`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Tab|`Tab2`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Text|`Text`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#UpDown|`UpDown`}
         * - `Center`: Centers the control's text within its available width.  
         *   Applies to: {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Button|`Button`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Checkbox|`Checkbox`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Edit|`Edit`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#GroupBox|`GroupBox`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Radio|`Radio`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Slider|`Slider`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Text|`Text`}
         * - `Section`: Sets current control as the new Section for use with the {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#xs|`XS` and `YS`} positioning options.  
         * - `Tabstop`: Disabling Tabstop of a control prevents the user from tabbing to that control.  
         * - `Wrap`: Enables word-wrapping of the control's contents within its available width.  
         *   This is enabled by default for almost all controls.  
         * - `VScroll`: Provide or remove a vertical scroll bar if appropriate for this type of control.  
         * - `HScroll`: Provide or remove a horizontal scroll bar if appropriate for this type of control.  
         *   Note about {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#ListBox|`ListBoxes`}: Horizontal scrolling width defaults to 3 times the ListBox's width.  
         *   To specify a different scrolling width, include a number immediately after the word HScroll.  
         *  
         * **Uncommon Styles and Options**
         * - `BackgroundTrans`: Uses a transparent background, which allows any control that lies behind  
         *   a Text, Picture, or GroupBox control to show through.  
         *   Use GuiCtrl.Opt("+Background") to remove this option later.  
         *   An error is thrown if a control type does not support this option.  
         *   Known limitation: BackgroundTrans might not work in a Tab control that contains a ListView.  
         * - `Background#`: Sets control background color where `#` is one of the following:  
         *   - RGB hex value (0x prefix is optional):  
         *     `C0x000000` to `CFFffFF`  
         *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}:  
         *     `CBlack`, `CSilver`, `CGray`, `CWhite`, `CMaroon`, `CRed`, `CPurple`, `CFuchsia`  
         *     `CGreen`, `CLime`, `COlive`, `CYellow`, `CNavy`, `CBlue`, `CTeal`, `CAqua`  
         *     Reset color to default.  
         * - `Border`: Provides a thin-line border around the control. Adding a border to an  
         *   existing control might require increasing the control's width and height by 1 pixel.  
         * - `Redraw`: Enable/disable redrawing (visual updates) of a control (Uses: {@link https://learn.microsoft.com/en-us/windows/win32/gdi/wm-setredraw|`WM_SETREDRAW`}).  
         *   Disabling redraw `-Redraw` prior to adding multiple controls/elements can increase performance.  
         *   Enable redraw `+Redraw` after all changes have been made.  
         * - `Theme`: Used to override the window's current theme setting for the newly created control.  
         *   This setting has no effect when used on an existing control. See {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Theme|`GUI's +/-Theme option`} for details.  
         * - {@link https://www.autohotkey.com/docs/v2/misc/Styles.htm|`Style Number`} `+0x0`: Specify a plus or minus sign  
         *   followed immediately by a decimal or hexadecimal style number.  
         * - {@link https://learn.microsoft.com/en-us/windows/win32/winmsg/extended-window-styles|`ExStyle Number`} `+E0x0`: Specify a plus or minus sign  
         *   followed immediately by the letter E and a decimal or hexadecimal extended style number.  
         * @returns {(String)} An empty string is always returned.  
         * @example <caption>  
         * Hiding and showing all GUI controls.</caption>
         * goo := Gui()
         * goo.cb_hide := goo.AddCheckbox('xm ym vcb_hide', 'Hide All')
         * goo['cb_hide'].OnEvent('click', test)
         * loop 3
         *     goo.AddButton('xm w100 h25', 'Button' A_Index)
         *     ,goo.AddCheckbox('x+m w100 h25 +Border +Right', 'Checkbox' A_Index)
         * con := goo.AddButton('xm w210', 'Exit Script')
         * con.OnEvent('Click', (*) => ExitApp())
         * goo.show()
         * 
         * test(con, info) {
         *     if con.value
         *         option := '+Hidden'
         *     else option := '-Hidden'
         *     
         *     for hwnd, control in con.gui
         *         if (control.Name != 'cb_hide')
         *             control.Opt(option)
         * }
         */
        Opt(Options) => EmptyString
    
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Redraw|`Redraw()`} repaints the region of the GUI window occupied by the control.  
         * Redrawing solves problems such as groupbox artifacting.  
         * If called repeatedly, this may cause GUI flickering.  
         * @method
         * @example <caption>  
         * Call Redraw() if a control needs redrawn.</caption>
         * control_obj.Redraw()
         */
        Redraw() => String
        
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#SetFont|`SetFont()`} sets the font typeface, size, style, and/or color for the control.  
         * Omitting both parameters sets the control font to the current Gui.SetFont() values. If Gui.SetFont() has not been set, the system default values are used.
         * @method
         * @param {(String)} [Options] - Zero or more options separated by spaces.  
         * Styling words. These are executed in order so specifying `norm italic` would reset the text to normal and then italicize it.  
         * - `bold` - Adds a heavy weight/boldness to text.  
         * - `italic` - Italicizes text.  
         * - `strike` - Strikes out text by adding a horizontal line through it.  
         * - `underline` - Underlines text.  
         * - `norm`- Disables all aforementioned settings.It is possible to use norm to turn off all attributes and then selectively turn on others. For example, specifying norm italic would set the font to normal then to italic.  
         * Other options:  
         * - `C#`: Set text color where `#` is one of the following:  
         *   - RGB hex value (0x prefix is optional):  
         *     `C0x000000` to `CFFffFF`  
         *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}:  
         *     `CBlack`, `CSilver`, `CGray`, `CWhite`, `CMaroon`, `CRed`, `CPurple`, `CFuchsia`  
         *     `CGreen`, `CLime`, `COlive`, `CYellow`, `CNavy`, `CBlue`, `CTeal`, `CAqua`  
         *   - Reset/Default:  
         *     `CDefault` or `C`  
         *   The color option does not affect {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Button|`buttons`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#StatusBar|`status bars`}.  
         * - `S#`: Size in points where `#` is a decimal value.  
         * - `W#`: Weight/boldness where `#` is a decimal value between 1 and 1000. 400 is normal. 700 is bold.  
         * - `Q#`: {@link https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-createfonta|`Text rendering quality`} where `#` is an integer between 0 and 5.  
         *    - `0` - Window Constant: `DEFAULT_QUALITY` - Appearance of the font does not matter.  
         *    - `1` - Window Constant: `DRAFT_QUALITY` - Appearance of the font is less important than when the PROOF_QUALITY value is used.  
         *    - `2` - Window Constant: `PROOF_QUALITY` - Character quality of the font is more important than exact matching of the logical-font attributes.  
         *    - `3` - Window Constant: `NONANTIALIASED_QUALITY` - Font is never antialiased, that is, font smoothing is not done.  
         *    - `4` - Window Constant: `ANTIALIASED_QUALITY` - Font is antialiased, or smoothed, if the font supports it and the size of the font is not too small or too large.  
         *    - `5` - Window Constant: `CLEARTYPE_QUALITY` - If set, text is rendered (when possible) using ClearType antialiasing method.  
         * @param {(String)} [FontName] - The name of any font, such as one from the {@link https://www.autohotkey.com/docs/v2/misc/FontsStandard.htm|`font table`}.  
         * If FontName is omitted or does not exist on the system, the previous font typeface will be used, otherwise the system's default Gui typeface is used.  
         * @returns {(String)} An empty string is always returned.  
         * @see {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#SetFont|`Gui.SetFont()`}
         * @example <caption>  
         * Changing control font properties.</caption>
         * goo := Gui()
         * con := goo.AddText('xm ym w200 h30 Center Border', 'Big Header Text')
         * con.SetFont('S16 Bold c00A080')
         * con := goo.AddText('xm w200 h100 Left', 'Normal text goes down here.`nMore text.'
         *                     '`nEven more text`n+1 more line.`nLine++`nEOL (End of lines!)')
         * con.SetFont('s10 Italic')
         * con.SetFont(, 'Courier New')
         * con.SetFont(, 'Consolas')
         * goo.Show()
         */
        SetFont([Options:=GuiFontOptions, FontName:=GuiFontType]) => EmptyString
    }

    /**
     * ActiveX components, such as the {@link https://learn.microsoft.com/en-us/dotnet/desktop/winforms/controls/webbrowser-control-overview?view=netframeworkdesktop-4.8|`MSIE browser control`}, can be embedded into a GUI window.  
     * @class
     */
    class ActiveX extends Gui.Control {
        /**
         * Retrieves or sets the contents of a value-capable control.
         * The Value is the ActiveX object of the ActiveX control. 
         * For details about the ActiveX component and its method used below, see:  
         * - {@link https://learn.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa752085(v=vs.85)|`WebBrowser object (Microsoft Docs)`}  
         * - {@link https://learn.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa752093(v=vs.85)|`Navigate method (Microsoft Docs)`}  
         * @example <caption>  
         * Adding an MSIE control to a GUI.</caption>
         * goo := Gui()
         * goo.MarginX := goo.MarginY := 0
         * goo.BackColor := 0xFFFF00
         * con := goo.AddText('xm ym w924 h30', 'Yes, this is inside a GUI.')
         * con.SetFont('s18')
         * con.SetFont('s18 Bold')
         * con := goo.AddButton('x+0 w100 h30', 'Exit')
         * con.OnEvent('Click', (*) => ExitApp())
         * goo.web := goo.AddActiveX("x0 y+0 w1024 h768", "Shell.Explorer")
         * ; The ActiveX object is stored in the value property
         * goo.Show()
         * goo.web.value.Navigate("https://www.autohotkey.com/docs/v2/index.htm")
         */
        value => String
    }
    
    /**
     * A pushbutton, which can be pressed to trigger an action.
     * @class
     */
    class Button extends Gui.Control {
        /**
         * The caption that displays on the button.  
         * If the text of a button is increased, the button does not auto-adjust in size.  
         * Use the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Move|`Move()`} method to adjust button width if needed.
         * @type {(String)}
         * @example <caption>  
         * Changing button caption.</caption>
         * goo := Gui()
         * control := goo.AddButton('w200 h100', 'change')
         * control.lowercase := 1
         * control.OnEvent('Click', change_text)
         * goo.Show('')
         * 
         * change_text(con, info) {
         *     if (con.lowercase)
         *         con.Text := StrUpper(con.Text)
         *         ,con.lowercase := 0
         *     else
         *         con.Text := StrLower(con.Text)
         *         ,con.lowercase := 1
         * }
         */
        Text => String
        
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Events|`OnEvent()`} assigns a {@link https://www.autohotkey.com/docs/v2/Functions.htm|`Function`}, 
         * {@link https://www.autohotkey.com/docs/v2/Concepts.htm#methods|`Method`},  
         * or {@link https://www.autohotkey.com/docs/v2/lib/Object.htm|`Object`} to be called when a specified event happens.  
         * @method
         * @param {(String)} EventName - One of the following event(s):  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Click|`Click`} - The Button is clicked.  
         * 
         *       Button_Click(GuiCtrlObj, Info)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#DoubleClick|`DoubleClick`} - The Button is double-clicked.  
         * 
         *       Button_DoubleClick(GuiCtrlObj, Info)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Ctrl-ContextMenu|`ContextMenu`} - The user right-clicks the Button or presses  
         * Menu or Shift+F10 while the Button has the keyboard focus.  
         * 
         *       Button_ContextMenu(GuiCtrlObj, Info, RightClicked, X, Y)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Focus|`Focus`} - The Button gains the keyboard focus.  
         * 
         *       Button_Focus(GuiCtrlObj, Reserved)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#LoseFocus|`LoseFocus`} - The Button loses the keyboard focus.  
         * 
         *       Button_LoseFocus(GuiCtrlObj, Reserved)  
         * - Callback Params:
         *     - `GuiCtrlObj`: Reference to the Button's object  
         *     - `Info`: Not used with Button controls  
         *     - `RightClicked`:  
         *       `1` = Mouse right click was used  
         *       `0` = `AppsKey` or `Shift+F10` was used  
         *     - `X` and `Y`: Right click dependant (Check `RightClicked` param)  
         *       Right Clicked = Coords of mouse click  
         *       Keyboard = Coords of the control's upper left corner  
         * @param {(String|FuncObj)} Callback - A function, method,  
         * or object that is called when the event is raised.  
         * A callback's first parameter is always the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm|`GuiControl`} that raised the event.  
         * @param {(Integer)} [AddRemove] - Adjust callback order or delete callback.  
         * - `1` = Add the callback after any previously registered callbacks.  
         * - `-1` = Add the callback before any previously registered callbacks.  
         * - `0` = Remove the callback.  
         * 
         * If multiple callbacks are registered, a callback that returns  
         * a non-empty string will stop all remaining callbacks from running.  
         * @returns {(String)} An empty string is always returned.  
         * @example <caption>  
         * Multiple buttons and events</caption>
         * goo := Gui()
         * 
         * goo.btn_max := goo.AddButton('xm ym w100', 'Maximize Window')
         * goo.btn_max.OnEvent('Click', (con, *) => con.gui.Maximize())
         * 
         * goo.btn_res := goo.AddButton('xm w100', 'Restore Window')
         * goo.btn_res.OnEvent('Click', (con, *) => con.gui.Restore())
         * 
         * goo.btn_win := goo.AddButton('xm w100', 'Toggle Win Border')
         * goo.btn_win.OnEvent('Click', border_toggle)
         * 
         * goo.btn_warn := goo.AddButton('xm w100', 'Focus this button`nUse tab/arrow')
         * goo.btn_warn.OnEvent('Focus', (con, *) => con.gui.BackColor := 0xE0E000)
         * goo.btn_warn.OnEvent('LoseFocus', (con, *) => con.gui.BackColor := 'Default')
         * goo.btn_warn.OnEvent('Click', (*) => MsgBox("Don't click me!"))
         * 
         * goo.btn_exit := goo.AddButton('xm w100', 'Close').OnEvent('Click', quit)
         * 
         * goo.Show('AutoSize')
         * 
         * quit(*) => ExitApp()
         * 
         * border_toggle(con, info) {
         *     static state := 0
         *     state := !state
         *     if state
         *         con.gui.Opt('-Caption')
         *     else con.gui.Opt('+Caption')
         * }
         */
        OnEvent(EventName, Callback [, AddRemove:=1]) => EmptyString

        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Opt|`Opt()`} sets various options to change a control's appearance or behaviors.  
         * @method
         * @param {(String)} Options - Any {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#OtherOptions|`general`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm|`control-specific`} options, separated by spaces/tabs.  
         * **Positioning and Sizing of Controls**  
         * Use the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Move|`Move()`} method to change control size/position.
         * 
         * **Common Styles and Other Options**  
         * Prefix with `-` to disable an option and `+` (or no sign) to add an option.  
         * - `Vstring`: Assign a {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Name|`Name`} to a control where `string` is the new name.  
         *   A control's name can be used to get a reference to that control from a GUI object.  
         *
         *       GuiControl.Opt('+VMyControl')  
         *       GuiControl := Gui['MyControl']  
         * - `Events`: Handled by the control's {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm|`OnEvent()` method}.  
         * - `Disabled`: Disables the control preventing user focus or modifications of the contents.  
         *   Control can be enabled using `-Disabled` or setting {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Enabled`} to true.  
         *   A `0` for enabled or `1` for disabled can immediately follow `Disabled`.  
         *
         *       con.Opt('+Disabled0')
         *       var := 1, con.Opt('+Disabled' var)
         * - `Hidden`: The control is initially invisible.  
         *   Use `-Hidden` or {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Visible`} to unhide it.  
         *   A `0` for visible or `1` for hidden can immediately follow `Hidden`.  
         * 
         *       con.Opt('+Hidden0')
         *       var := 1, con.Opt('+Hidden' var)
         * - `Left`: Left-justifies the control's text within its available width.  
         * - `Right`: Right-justifies the control's text within its available width.  
         * - `Center`: Centers the control's text within its available width.  
         * - `Section`: Sets current control as the new Section for use with the {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#xs|`XS` and `YS`} positioning options.  
         * - `Tabstop`: Disabling Tabstop of a control prevents the user from tabbing to that control.  
         *  
         * **Uncommon Styles and Options**
         * - `Background#`: Sets control background color where `#` is one of the following:  
         *   - RGB hex value (0x prefix is optional):  
         *     `C0x000000` to `CFFffFF`  
         *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}:  
         *     `CBlack`, `CSilver`, `CGray`, `CWhite`, `CMaroon`, `CRed`, `CPurple`, `CFuchsia`  
         *     `CGreen`, `CLime`, `COlive`, `CYellow`, `CNavy`, `CBlue`, `CTeal`, `CAqua`  
         *     Reset color to default.  
         * - `Border`: Provides a thin-line border around the control. Adding a border to an  
         *   existing control might require increasing the control's width and height by 1 pixel.  
         * - `Redraw`: Enable/disable redrawing (visual updates) of a control (Uses: {@link https://learn.microsoft.com/en-us/windows/win32/gdi/wm-setredraw|`WM_SETREDRAW`}).  
         *   Disabling redraw `-Redraw` prior to adding multiple controls/elements can increase performance.  
         *   Enable redraw `+Redraw` after all changes have been made.  
         * - `Theme`: Used to override the window's current theme setting for the newly created control.  
         *   This setting has no effect when used on an existing control. See {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Theme|`GUI's +/-Theme option`} for details.  
         * - {@link https://www.autohotkey.com/docs/v2/misc/Styles.htm|`Style Number`} `+0x0`: Specify a plus or minus sign  
         *   followed immediately by a decimal or hexadecimal style number.  
         * - {@link https://learn.microsoft.com/en-us/windows/win32/winmsg/extended-window-styles|`ExStyle Number`} `+E0x0`: Specify a plus or minus sign  
         *   followed immediately by the letter E and a decimal or hexadecimal extended style number.  
         * @returns {(String)} An empty string is always returned.  
         * @example <caption>  
         * </caption>
         */
        Opt(Options) => EmptyString
    }
    
    /**
     * @class
     */
    class CheckBox extends Gui.Control {
    
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Value|`Value`} retrieves or sets the checked state.  
         * Values can be:  
         * `1`: Checked  
         * `0`: Unchecked  
         * `-1`: Grey checked/undetermined ({@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#CheckBox|`Check3` option} must be enabled)  
         * Use the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Text|`Text property`} to set/get the control text.
         * @property
         * @type {(Integer)}
         */
        Value => Integer
        
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Events|`OnEvent()`} assigns a {@link https://www.autohotkey.com/docs/v2/Functions.htm|`Function`}, 
         * {@link https://www.autohotkey.com/docs/v2/Concepts.htm#methods|`Method`},  
         * or {@link https://www.autohotkey.com/docs/v2/lib/Object.htm|`Object`} to be called when a specified event happens.  
         * @method
         * @param {(String)} EventName - One of the following event(s):  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Click|`Click`} - The CheckBox is clicked.  
         * 
         *       CheckBox_Click(GuiCtrlObj, Info)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#DoubleClick|`DoubleClick`} - The CheckBox is double-clicked.  
         * 
         *       CheckBox_DoubleClick(GuiCtrlObj, Info)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Ctrl-ContextMenu|`ContextMenu`} - The user right-clicks the CheckBox or presses  
         * Menu or Shift+F10 while the CheckBox has the keyboard focus.  
         * 
         *       CheckBox_ContextMenu(GuiCtrlObj, Info, RightClicked, X, Y)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Focus|`Focus`} - The CheckBox gains the keyboard focus.  
         * 
         *       CheckBox_Focus(GuiCtrlObj, Reserved)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#LoseFocus|`LoseFocus`} - The CheckBox loses the keyboard focus.  
         * 
         *       CheckBox_LoseFocus(GuiCtrlObj, Reserved)  
         * - Callback Params:
         *     - `GuiCtrlObj`: Reference to the CheckBox's object  
         *     - `Info`: Not used with CheckBox controls  
         *     - `RightClicked`:  
         *       `1` = Mouse right click was used  
         *       `0` = `AppsKey` or `Shift+F10` was used  
         *     - `X` and `Y`: Right click dependant (Check `RightClicked` param)  
         *       Right Clicked = Coords of mouse click  
         *       Keyboard = Coords of the control's upper left corner  
         * @param {(String|FuncObj)} Callback - A function, method,  
         * or object that is called when the event is raised.  
         * A callback's first parameter is always the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm|`GuiControl`} that raised the event.  
         * @param {(Integer)} [AddRemove] - Adjust callback order or delete callback.  
         * - `1` = Add the callback after any previously registered callbacks.  
         * - `-1` = Add the callback before any previously registered callbacks.  
         * - `0` = Remove the callback.  
         * 
         * If multiple callbacks are registered, a callback that returns  
         * a non-empty string will stop all remaining callbacks from running.  
         * @returns {(String)} An empty string is always returned.  
         * @example <caption>  
         * Custom example not written yet.</caption>
         */
        OnEvent(EventName, Callback [, AddRemove:=1]) => EmptyString
        
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Opt|`Opt()`} 
         * @param {(String)} Options - Any {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#OtherOptions|`general`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm|`control-specific`} options, separated by spaces/tabs.  
         * **Control Specific Options**  
         * - `Check3`: Adds a 3rd "indeterminate" gray checkmark state to the checkbox.  
         *   This can be used to indidcate the checkbox has neither been checked or unchecked.  
         * - `Checked` or `CheckedGray`: Starts the checkbox checked or checked grey/indeterminate.  
         *   `Checked` may also be followed by a 0 (unchecked), 1 (checked), or -1 (gray checked).  
         *  
         *       goo.AddCheckBox('+Checked0')
         *       var := 1, goo.AddCheckBox('+Checked' var)
         * 
         * **Positioning and Sizing of Controls**  
         * Use the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Move|`Move()`} method to change control size/position.
         *  
         * **Common Styles and Other Options**  
         * Prefix with `-` to disable an option and `+` (or no sign) to add an option.  
         * - `Vstring`: Assign a {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Name|`Name`} to a control where `string` is the new name.  
         *   A control's name can be used to get a reference to that control from a GUI object.  
         *
         *         GuiControl.Opt('+VMyControl')  
         *         GuiControl := Gui['MyControl']  
         * - `Events`: Handled by the control's {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm|`OnEvent()` method}.  
         * - `C#`: Set text color where `#` is one of the following:  
         *   - RGB hex value (0x prefix is optional): `C0x000000` to `CFFffFF`  
         *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}: `CBlack`, `CSilver`, `CGray`, `CWhite`, `CMaroon`, `CRed`, `CPurple`  
         *     `CFuchsia`, `CGreen`, `CLime`, `COlive`, `CYellow`, `CNavy`, `CBlue`, `CTeal`, `CAqua`  
         *   - Reset/Default: `CDefault` or `C`  
         * - `Disabled`: Disables the control preventing user focus or modifications of the contents.  
         *   Control can be enabled using `-Disabled` or setting {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Enabled`} to true.  
         *   A `0` for enabled or `1` for disabled can immediately follow `Disabled`.  
         *
         *       con.Opt('+Disabled0')
         *       var := 1, con.Opt('+Disabled' var)
         * - `Hidden`: The control is initially invisible.  
         *   Use `-Hidden` or {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Visible`} to unhide it.  
         *   A `0` for visible or `1` for hidden can immediately follow `Hidden`.  
         * 
         *       con.Opt('+Hidden0')
         *       var := 1, con.Opt('+Hidden' var)
         * - `Left`: Left-justifies the control's text within its available width.  
         * - `Right`: Right-justifies the control's text within its available width.  
         *   This also moves the box from the left to the right side of the control.  
         * - `Center`: Centers the control's text within its available width.  
         * - `Section`: Sets current control as the new Section for use with the {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#xs|`XS` and `YS`} positioning options.  
         * - `Tabstop`: Disabling Tabstop of a control prevents the user from tabbing to that control.  
         * - `Wrap`: Enables word-wrapping of the control's contents within its available width.  
         *  
         * **Uncommon Styles and Options**
         * - `Background#`: Sets control background color where `#` is one of the following:  
         *   - RGB hex value (0x prefix is optional): `000000` to `0xFFffFf`
         *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}: `Black`, `Silver`, `Gray`, `White`, `Maroon`, `Red`, `Purple`  
         *   `Fuchsia`, `Green`, `Lime`, `Olive`, `Yellow`, `Navy`, `Blue`, `Teal`, `Aqua`  
         *   - Reset/Default: `BackgroundDefault` or `-Background`  
         * - `Border`: Provides a thin-line border around the control. Adding a border to an  
         *   existing control might require increasing the control's width and height by 1 pixel.  
         * - `Redraw`: Enable/disable redrawing (visual updates) of a control (Uses: {@link https://learn.microsoft.com/en-us/windows/win32/gdi/wm-setredraw|`WM_SETREDRAW`}).  
         *   Disabling redraw `-Redraw` prior to adding multiple controls/elements can increase performance.  
         *   Enable redraw `+Redraw` after all changes have been made.  
         * - `Theme`: Used to override the window's current theme setting for the newly created control.  
         *   This setting has no effect when used on an existing control. See {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Theme|`GUI's +/-Theme option`} for details.  
         * - {@link https://www.autohotkey.com/docs/v2/misc/Styles.htm|`Style Number`} `+0x0`: Specify a plus or minus sign  
         *   followed immediately by a decimal or hexadecimal style number.  
         * - {@link https://learn.microsoft.com/en-us/windows/win32/winmsg/extended-window-styles|`ExStyle Number`} `+E0x0`: Specify a plus or minus sign  
         *   followed immediately by the letter E and a decimal or hexadecimal extended style number.  
         * @param {(String|Number|Array)} [ControlSpecific] - Control specific setting.  
         * @returns {(GuiControl)} GuiControl Object
         * @example <caption>  
         * </caption>
         */
        Opt(Options) => EmptyString
    }
    
    /**
     * @class
     */
    class Custom extends Gui.Control {
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Opt|`Opt()`} 
         * @param {(String)} Options - Any {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#OtherOptions|`general`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm|`control-specific`} options, separated by spaces/tabs.  
         * Not all options work with all custom controls.
         * **Positioning and Sizing of Controls**  
         * Use the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Move|`Move()`} method to change control size/position.
         * 
         * **Common Styles and Other Options**  
         * Prefix with `-` to disable an option and `+` (or no sign) to add an option.  
         * - `Vstring`: Assign a {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Name|`Name`} to a control where `string` is the new name.  
         *   A control's name can be used to get a reference to that control from a GUI object.  
         *
         *         GuiControl.Opt('+VMyControl')  
         *         GuiControl := Gui['MyControl']  
         * - `Events`: Handled by the control's {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm|`OnEvent()` method}.  
         * - `C#`: Set text color where `#` is one of the following:  
         *   - RGB hex value (0x prefix is optional): `C0x000000` to `CFFffFF`  
         *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}: `CBlack`, `CSilver`, `CGray`, `CWhite`, `CMaroon`, `CRed`, `CPurple`  
         *     `CFuchsia`, `CGreen`, `CLime`, `COlive`, `CYellow`, `CNavy`, `CBlue`, `CTeal`, `CAqua`  
         *   - Reset/Default: `CDefault` or `C`  
         * - `Disabled`: Disables the control preventing user focus or modifications of the contents.  
         *   Control can be enabled using `-Disabled` or setting {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Enabled`} to true.  
         *   A `0` for enabled or `1` for disabled can immediately follow `Disabled`.  
         *
         *       con.Opt('+Disabled0')
         *       var := 1, con.Opt('+Disabled' var)
         * - `Hidden`: The control is initially invisible.  
         *   Use `-Hidden` or {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Visible`} to unhide it.  
         *   A `0` for visible or `1` for hidden can immediately follow `Hidden`.  
         * 
         *       con.Opt('+Hidden0')
         *       var := 1, con.Opt('+Hidden' var)
         * - `Left`: Left-justifies the control's text within its available width.  
         * - `Right`: Right-justifies the control's text within its available width and moves the box to the right side.  
         * - `Center`: Centers the control's text within its available width.  
         * - `Section`: Sets current control as the new Section for use with the {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#xs|`XS` and `YS`} positioning options.  
         * - `Tabstop`: Disabling Tabstop of a control prevents the user from tabbing to that control.  
         * - `Wrap`: Enables word-wrapping of the control's contents within its available width.  
         * - `VScroll`: Provide or remove a vertical scroll bar if appropriate for this type of control.  
         * - `HScroll`: Provide or remove a horizontal scroll bar if appropriate for this type of control.  
         *  
         * **Uncommon Styles and Options**
         * - `Background#`: Sets control background color where `#` is one of the following:  
         *   - RGB hex value (0x prefix is optional): `C0x000000` to `CFFffFF`  
         *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}: `CBlack`, `CSilver`, `CGray`, `CWhite`, `CMaroon`, `CRed`, `CPurple`  
         *     `CFuchsia`, `CGreen`, `CLime`, `COlive`, `CYellow`, `CNavy`, `CBlue`, `CTeal`, `CAqua`  
         *   - Reset/Default: `CDefault` or `-Background`  
         * - `Border`: Provides a thin-line border around the control. Adding a border to an  
         *   existing control might require increasing the control's width and height by 1 pixel.  
         * - `Redraw`: Enable/disable redrawing (visual updates) of a control (Uses: {@link https://learn.microsoft.com/en-us/windows/win32/gdi/wm-setredraw|`WM_SETREDRAW`}).  
         *   Disabling redraw `-Redraw` prior to adding multiple controls/elements can increase performance.  
         *   Enable redraw `+Redraw` after all changes have been made.  
         * - `Theme`: Used to override the window's current theme setting for the newly created control.  
         *   This setting has no effect when used on an existing control. See {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Theme|`GUI's +/-Theme option`} for details.  
         * - {@link https://www.autohotkey.com/docs/v2/misc/Styles.htm|`Style Number`} `+0x0`: Specify a plus or minus sign  
         *   followed immediately by a decimal or hexadecimal style number.  
         * - {@link https://learn.microsoft.com/en-us/windows/win32/winmsg/extended-window-styles|`ExStyle Number`} `+E0x0`: Specify a plus or minus sign  
         *   followed immediately by the letter E and a decimal or hexadecimal extended style number.  
         * @returns {(String)} An empty string is always returned.  
         * @example <caption>  
         * </caption>
         */
        Opt(Options) => EmptyString
    }
    
    /**
     * @class
     */
    class DateTime extends Gui.Control {
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Value|`Value`} retrieves or sets the control's  
         * DateTimeStamp in {@link https://www.autohotkey.com/docs/v2/lib/FileSetTime.htm#YYYYMMDD|`YYYYMMDDHH24MISS format`}.  
         * Use {@link https://www.autohotkey.com/docs/v2/Variables.htm#Now|`A_Now`} to set Value to current time.  
         * If the {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#ChooseNone|choose none `+2` option} was used, setting  
         * Value to 0 will clear the DateTime control.
         * @type {(String)}
         * @example  

         */
        Value => String
        
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Events|`OnEvent()`} assigns a {@link https://www.autohotkey.com/docs/v2/Functions.htm|`Function`}, 
         * {@link https://www.autohotkey.com/docs/v2/Concepts.htm#methods|`Method`},  
         * or {@link https://www.autohotkey.com/docs/v2/lib/Object.htm|`Object`} to be called when a specified event happens.  
         * @method
         * @param {(String)} EventName - One of the following event(s):  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Change|`Change`} - The DateTime's value changes.  
         * 
         *       DateTime_Change(GuiCtrlObj, Info)
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Ctrl-ContextMenu|`ContextMenu`} - The user right-clicks the DateTime or presses  
         * Menu or Shift+F10 while the DateTime has the keyboard focus.  
         * 
         *       DateTime_ContextMenu(GuiCtrlObj, Info, RightClicked, X, Y)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Focus|`Focus`} - The DateTime gains the keyboard focus.  
         * 
         *       DateTime_Focus(GuiCtrlObj, Reserved)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#LoseFocus|`LoseFocus`} - The DateTime loses the keyboard focus.  
         * 
         *       DateTime_LoseFocus(GuiCtrlObj, Reserved)  
         * - Callback Params:
         *     - `GuiCtrlObj`: Reference to the DateTime's object  
         *     - `Info`: Not used with DateTime controls  
         *     - `RightClicked`:  
         *       `1` = Mouse right click was used  
         *       `0` = `AppsKey` or `Shift+F10` was used  
         *     - `X` and `Y`: Right click dependant (Check `RightClicked` param)  
         *       Right Clicked = Coords of mouse click  
         *       Keyboard = Coords of the control's upper left corner  
         * @param {(String|FuncObj)} Callback - A function, method,  
         * or object that is called when the event is raised.  
         * A callback's first parameter is always the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm|`GuiControl`} that raised the event.  
         * @param {(Integer)} [AddRemove] - Adjust callback order or delete callback.  
         * - `1` = Add the callback after any previously registered callbacks.  
         * - `-1` = Add the callback before any previously registered callbacks.  
         * - `0` = Remove the callback.  
         * 
         * If multiple callbacks are registered, a callback that returns  
         * a non-empty string will stop all remaining callbacks from running.  
         * @returns {(String)} An empty string is always returned.  
         * @example <caption>  
         * </caption>
         */
        OnEvent(EventName, Callback [, AddRemove:=1]) => EmptyString
        
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Opt|`Opt()`} 
         * @param {(String)} Options - Any {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#OtherOptions|`general`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm|`control-specific`} options, separated by spaces/tabs.  
         * **Positioning and Sizing of Controls**  
         * Use the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Move|`Move()`} method to change control size/position.
         * 
         * **Common Styles and Other Options**  
         * Prefixing with `+` adds/enables an option and `-` removes it. If no sign is provided, `+` is assumed.  
         * - `Vstring`: Assign a {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Name|`Name`} to a control where `string` is the new name.  
         *   A control's name can be used to get a reference to that control from a GUI object.  
         *
         *         GuiControl.Opt('+VMyControl')  
         *         GuiControl := Gui['MyControl']  
         * - `Events`: Handled by the control's {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm|`OnEvent()` method}.  
         * - `C#`: Set the day color where `#` is an RGB hex number `c0x0` to `cFFFFFF` (0x prefix is optional) or a color string `cRed`.  
         *   {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Color word list`}: `Black`, `Silver`, `Gray`, `White`, `Maroon`, `Red`, `Purple`, `Fuchsia`, `Green`, `Lime`, `Olive`, `Yellow`, `Navy`, `Blue`, `Teal`, `Aqua`  
         * - `Disabled`: Applies a disabled state to the control preventing the user from focusing or modifying its contents.  
         *   Use {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Enabled`} to enable it later.  
         *   The word `Disabled` may optionally be followed immediately by a `0` for enabled or `1` for disabled to indicate starting state.  
         * - `Hidden`: The control is initially invisible.  
         *   Use {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Visible`} to show it later.  
         *   The word `Hidden` may optionally be followed immediately by a `0` for visible or `1` for hidden to indicate the starting state.  
         * - `Left`: Causes the drop-down calendar to drop down on the left side of the control and is the default.  
         * - `Right`: Causes the drop-down calendar to drop down on the right side of the control instead of the left.  
         * - `Section`: Sets current control as the new section control. Used with the `XS` and `YS` positioning options.  
         * - `Tabstop`: Enable a control to be tabbed to. When tabbing to a control with `-Tabstop`, that control is skipped over.  
         * - `Wrap`: Enables word-wrapping of the control's contents within its available width.  
         * - `VScroll`: Provide or remove a vertical scroll bar.  
         * - `HScroll`: Provide or remove a horizontal scroll bar.  
         *  
         * **Uncommon Styles and Options**
         * - `Background#`: Sets control background color where `#` is one of the following:  
         *   - RGB hex value (0x prefix is optional): `000000` to `0xFFffFf`
         *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}: `Black`, `Silver`, `Gray`, `White`, `Maroon`, `Red`, `Purple`  
         *   `Fuchsia`, `Green`, `Lime`, `Olive`, `Yellow`, `Navy`, `Blue`, `Teal`, `Aqua`  
         *   - Reset/Default: `BackgroundDefault` or `-Background`  
         * - `Border`: Provides a thin-line border around the control. Adding a border to an existing control might require increasing the control's width and height by 1 pixel.  
         * - `Redraw`: When used with {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Opt|`Opt`}, this option enables or disables redraw (visual updates) for a control by sending it a WM_SETREDRAW message.  
         *   When working with multiple controls or control elements, performance can be increased by disabling redraw: `-Redraw`  
         *   Don't forget to enable redraw when finished: `+Redraw` after all the changes are made.               
         * - `Theme`: Used to override the window's current theme setting for the newly created control.  
         *   It has no effect when used on an existing control; however, this may change in a future version.  
         *   See {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Theme|`GUI's +/-Theme option`} for details.  
         * - {@link https://www.autohotkey.com/docs/v2/misc/Styles.htm|`Style Number`} `+0x0`: Specify a plus or minus sign followed immediately by a decimal or hexadecimal style number.  
         * - {@link https://learn.microsoft.com/en-us/windows/win32/winmsg/extended-window-styles|`ExStyle Number`} `+E0x0`: Specify a plus or minus sign followed immediately by the letter E and a decimal or hexadecimal extended style number.  
         * @returns {(String)} An empty string is always returned.  
         * @example <caption>  
         * </caption>
         */
        Opt(Options) => EmptyString
        
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#DateTime_SetFormat|`SetFormat()`} sets the display format of a {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#DateTime|`DateTime`} control.  
         * @method 
         * @param {(String)} [DateFormat] - Sets the desired {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#DateTimeFormat|`display format`} of a DateTime control.
         * - `ShortDate`: Locale short date format. Example: 6/1/2005  
         *   ShortDate is used if DateFormat is omitted or is an empty string  
         * - `LongDate`: Locale long date format. Example: Wednesday, June 01, 2005  
         * - `Time`: Shows locale time only. Example: 9:37:45 PM  
         *   The date is still present in the control even thought it's not shown.  
         *   It  will be retrieved along with the time in the YYYYMMDDHH24MISS format.  
         * - `Custom`: Any combination of {@link https://www.autohotkey.com/docs/v2/lib/FormatTime.htm|`date and time formats`}.  
         * @param {String} [Format] - Sets the display format of a DateTime control.  
         * @returns {(String)} An empty string is always returned.  
         */
        SetFormat([DateFormat:='']) => EmptyString
    }
    
    /**
     * @class
     */
    class Edit extends Gui.Control {
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Events|`OnEvent()`} assigns a {@link https://www.autohotkey.com/docs/v2/Functions.htm|`Function`}, 
         * {@link https://www.autohotkey.com/docs/v2/Concepts.htm#methods|`Method`},  
         * or {@link https://www.autohotkey.com/docs/v2/lib/Object.htm|`Object`} to be called when a specified event happens.  
         * @method
         * @param {(String)} EventName - One of the following event(s):  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Change|`Change`} - The Edit's value changes.  
         * 
         *       Edit_Change(GuiCtrlObj, Info)
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Focus|`Focus`} - The Edit gains the keyboard focus.  
         * 
         *       Edit_Focus(GuiCtrlObj, Reserved)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#LoseFocus|`LoseFocus`} - The Edit loses the keyboard focus.  
         * 
         *       Edit_LoseFocus(GuiCtrlObj, Reserved)  
         * - Callback Params:
         *     - `GuiCtrlObj`: Reference to the Edit's object  
         *     - `Info`: Not used with Edit controls  
         *     - `Item`: Not used with Edit controls  
         *     - `RightClicked`:  
         *       `1` = Mouse right click was used  
         *       `0` = `AppsKey` or `Shift+F10` was used  
         *     - `X` and `Y`: Right click dependant (Check `RightClicked` param)  
         *       Right Clicked = Coords of mouse click  
         *       Keyboard = Coords of the control's upper left corner  
         * @param {(String|FuncObj)} Callback - A function, method,  
         * or object that is called when the event is raised.  
         * A callback's first parameter is always the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm|`GuiControl`} that raised the event.  
         * @param {(Integer)} [AddRemove] - Adjust callback order or delete callback.  
         * - `1` = Add the callback after any previously registered callbacks.  
         * - `-1` = Add the callback before any previously registered callbacks.  
         * - `0` = Remove the callback.  
         * 
         * If multiple callbacks are registered, a callback that returns  
         * a non-empty string will stop all remaining callbacks from running.  
         * @returns {(String)} An empty string is always returned.  
         * @example <caption>  
         * </caption>
         */
        OnEvent(EventName, Callback [, AddRemove:=1]) => EmptyString
        
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Opt|`Opt()`} 
         * @param {(String)} Options - Any {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#OtherOptions|`general`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm|`control-specific`} options, separated by spaces/tabs.  
         * **Control Specific Options**  
         * - `Limit`: Restricts the user's input to the visible width of the edit field. If a number is included after limit, such as `Limit10`, the input will be limited to that specific number of characters.  
         * - `Lowercase`: The characters typed by the user are automatically converted to lowercase.  
         * - `Multi`: Allows more than one line of text.  
         * - `Number`: Allows only digits to be typed into the edit field. (however, it is still possible to paste non-digits into it). Attaching an UpDown control to the control will also force numbers only.  
         * - `Password`: Hides the user's input (such as for password entry) by substituting masking characters for what the user types. If a non-default masking character is desired, include it immediately after the word Password. For example, Password* would make the masking character an asterisk rather than the black circle (bullet). Note: This option has no effect for multi-line edit controls.  
         * - `ReadOnly`: Prevents the user from changing the control's contents. However, the text can still be scrolled, selected and copied to the clipboard.  
         * - `T#`: Sets tab stops which determine how far each tab will indent the text where # is the amount of dialogue units (a unit determined by the OS). Default value is 32.  
         *   If only one tab stop is set, it's used for all tabs. If multiple tab stops are set, they're followed in order. Up to 50 tab stops can be defined.  
         * - `Uppercase`: The characters typed by the user are automatically converted to uppercase.  
         * - `WantCtrlA`: Specify `-WantCtrlA` to prevent Ctrl+A from selecting all text in the edit control.  
         * - `WantReturn`: Specify `-WantReturn` to prevent Enter from adding a new line to a multi-line edit control. Enter will instead activate the Gui's default control. The user can still add new lines to the edit box by using Ctrl+Enter.  
         * - `WantTab`: Causes Tab to produce a tab character in the control rather than navigating to the next control. If disabled, a tab can still be produced in a multi-line edit control by pressing Ctrl+Tab.  
         * - `Wrap`: Specify `-Wrap` to turn off word-wrapping in a multi-line edit control. This style cannot be changed after the control has been created. To change it, either destroy and recreate the window and its control or create two overlapping edit controls, one with wrap enabled and one without. Show the one needed and hide the other.  
         *  
         * **Positioning and Sizing of Controls**  
         * Use the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Move|`Move()`} method to change control size/position.
         * 
         * **Common Styles and Other Options**  
         * Prefixing with `+` adds/enables an option and `-` removes it. If no sign is provided, `+` is assumed.  
         * - `Vstring`: Assign a {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Name|`Name`} to a control where `string` is the new name.  
         *   A control's name can be used to get a reference to that control from a GUI object.  
         *
         *         GuiControl.Opt('+VMyControl')  
         *         GuiControl := Gui['MyControl']  
         * - `Events`: Handled by the control's {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm|`OnEvent()` method}.  
         * - `C#`: Set the day color where `#` is an RGB hex number `c0x0` to `cFFFFFF` (0x prefix is optional) or a color string `cRed`.  
         *   {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Color word list`}: `Black`, `Silver`, `Gray`, `White`, `Maroon`, `Red`, `Purple`, `Fuchsia`, `Green`, `Lime`, `Olive`, `Yellow`, `Navy`, `Blue`, `Teal`, `Aqua`  
         * - `Disabled`: Applies a disabled state to the control preventing the user from focusing or modifying its contents.  
         *   Use {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Enabled`} to enable it later.  
         *   The word `Disabled` may optionally be followed immediately by a `0` for enabled or `1` for disabled to indicate starting state.  
         * - `Hidden`: The control is initially invisible.  
         *   Use {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Visible`} to show it later.  
         *   The word `Hidden` may optionally be followed immediately by a `0` for visible or `1` for hidden to indicate the starting state.  
         * - `Left`: Causes the drop-down calendar to drop down on the left side of the control and is the default.  
         * - `Right`: Causes the drop-down calendar to drop down on the right side of the control instead of the left.  
         * - `Section`: Sets current control as the new section control. Used with the `XS` and `YS` positioning options.  
         * - `Tabstop`: Enable a control to be tabbed to. When tabbing to a control with `-Tabstop`, that control is skipped over.  
         * - `Wrap`: Enables word-wrapping of the control's contents within its available width.  
         * - `VScroll`: Provide or remove a vertical scroll bar.  
         * - `HScroll`: Provide or remove a horizontal scroll bar.  
         *  
         * **Uncommon Styles and Options**
         * - `Background#`: Sets control background color where `#` is an RGB hex number `c0x0` to `cFFFFFF` or a color string `cRed`.  
         *   Specifying `BackgroundDefault` or `-Background` applies the system's default background color.  
         *   {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Color word list`}: `Black`, `Silver`, `Gray`, `White`, `Maroon`, `Red`, `Purple`, `Fuchsia`, `Green`, `Lime`, `Olive`, `Yellow`, `Navy`, `Blue`, `Teal`, `Aqua`  
         * - `Border`: Provides a thin-line border around the control. Adding a border to an existing control might require increasing the control's width and height by 1 pixel.  
         * - `Redraw`: When used with {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Opt|`Opt`}, this option enables or disables redraw (visual updates) for a control by sending it a WM_SETREDRAW message.  
         *   When working with multiple controls or control elements, performance can be increased by disabling redraw: `-Redraw`  
         *   Don't forget to enable redraw when finished: `+Redraw` after all the changes are made.               
         * - `Theme`: Used to override the window's current theme setting for the newly created control.  
         *   It has no effect when used on an existing control; however, this may change in a future version.  
         *   See {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Theme|`GUI's +/-Theme option`} for details.  
         * - {@link https://www.autohotkey.com/docs/v2/misc/Styles.htm|`Style Number`} `+0x0`: Specify a plus or minus sign followed immediately by a decimal or hexadecimal style number.  
         * - {@link https://learn.microsoft.com/en-us/windows/win32/winmsg/extended-window-styles|`ExStyle Number`} `+E0x0`: Specify a plus or minus sign followed immediately by the letter E and a decimal or hexadecimal extended style number.  
         * @returns {(String)} An empty string is always returned.  
         * @example <caption>  
         * </caption>
         */
        Opt(Options) => EmptyString
    }
    
    /**
     * @class
     */
    class GroupBox extends Gui.Control {
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Events|`OnEvent()`} assigns a {@link https://www.autohotkey.com/docs/v2/Functions.htm|`Function`}, 
         * {@link https://www.autohotkey.com/docs/v2/Concepts.htm#methods|`Method`},  
         * or {@link https://www.autohotkey.com/docs/v2/lib/Object.htm|`Object`} to be called when a specified event happens.  
         * @method
         * @param {(String)} EventName - One of the following event(s):  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Ctrl-ContextMenu|`ContextMenu`} - The user right-clicks the GroupBox or presses  
         * Menu or Shift+F10 while the GroupBox has the keyboard focus.  
         * 
         *       GroupBox_ContextMenu(GuiCtrlObj, Item, RightClicked, X, Y)  
         * - Callback Params:
         *     - `GuiCtrlObj`: Reference to the GroupBox's object  
         *     - `Item`: Not used with GroupBox controls  
         *     - `RightClicked`:  
         *       `1` = Mouse right click was used  
         *       `0` = `AppsKey` or `Shift+F10` was used  
         *     - `X` and `Y`: Right click dependant (Check `RightClicked` param)  
         *       Right Clicked = Coords of mouse click  
         *       Keyboard = Coords of the control's upper left corner  
         * @param {(String|FuncObj)} Callback - A function, method,  
         * or object that is called when the event is raised.  
         * A callback's first parameter is always the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm|`GuiControl`} that raised the event.  
         * @param {(Integer)} [AddRemove] - Adjust callback order or delete callback.  
         * - `1` = Add the callback after any previously registered callbacks.  
         * - `-1` = Add the callback before any previously registered callbacks.  
         * - `0` = Remove the callback.  
         * 
         * If multiple callbacks are registered, a callback that returns  
         * a non-empty string will stop all remaining callbacks from running.  
         * @returns {(String)} An empty string is always returned.  
         * @example <caption>  
         * </caption>
         */
        OnEvent(EventName, Callback [, AddRemove:=1]) => EmptyString
    }
    
    /**
     * @class
     */
    class Hotkey extends Gui.Control {
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Events|`OnEvent()`} assigns a {@link https://www.autohotkey.com/docs/v2/Functions.htm|`Function`}, 
         * {@link https://www.autohotkey.com/docs/v2/Concepts.htm#methods|`Method`},  
         * or {@link https://www.autohotkey.com/docs/v2/lib/Object.htm|`Object`} to be called when a specified event happens.  
         * @method
         * @param {(String)} EventName - One of the following event(s):  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Change|`Change`} - The Edit's value changes.  
         * 
         *       Hotkey_Change(GuiCtrlObj, Info)
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Ctrl-ContextMenu|`ContextMenu`} - The user right-clicks the Hotkey control or presses  
         * Menu or Shift+F10 while the Hotkey control has the keyboard focus.  
         * 
         *       Hotkey_ContextMenu(GuiCtrlObj, Info, RightClicked, X, Y)  
         * - Callback Params:
         *     - `GuiCtrlObj`: Reference to the Hotkey control's object  
         *     - `Info`: Not used with Hotkey controls  
         *     - `RightClicked`:  
         *       `1` = Mouse right click was used  
         *       `0` = `AppsKey` or `Shift+F10` was used  
         *     - `X` and `Y`: Right click dependant (Check `RightClicked` param)  
         *       Right Clicked = Coords of mouse click  
         *       Keyboard = Coords of the control's upper left corner  
         * @param {(String|FuncObj)} Callback - A function, method,  
         * or object that is called when the event is raised.  
         * A callback's first parameter is always the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm|`GuiControl`} that raised the event.  
         * @param {(Integer)} [AddRemove] - Adjust callback order or delete callback.  
         * - `1` = Add the callback after any previously registered callbacks.  
         * - `-1` = Add the callback before any previously registered callbacks.  
         * - `0` = Remove the callback.  
         * 
         * If multiple callbacks are registered, a callback that returns  
         * a non-empty string will stop all remaining callbacks from running.  
         * @returns {(String)} An empty string is always returned.  
         * @example <caption>  
         * </caption>
         */
        OnEvent(EventName, Callback [, AddRemove:=1]) => EmptyString
    }
    
    /**
     * @class
     */
    class Link extends Gui.Control {
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Events|`OnEvent()`} assigns a {@link https://www.autohotkey.com/docs/v2/Functions.htm|`Function`}, 
         * {@link https://www.autohotkey.com/docs/v2/Concepts.htm#methods|`Method`},  
         * or {@link https://www.autohotkey.com/docs/v2/lib/Object.htm|`Object`} to be called when a specified event happens.  
         * @method
         * @param {(String)} EventName - One of the following event(s):  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Click|`Click`} - The Link is clicked.  
         * 
         *       Link_Click(GuiCtrlObj, Info, Href)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Ctrl-ContextMenu|`ContextMenu`} - The user right-clicks the Link or presses  
         * Menu or Shift+F10 while the Link has the keyboard focus.  
         * 
         *       Link_ContextMenu(GuiCtrlObj, Item, RightClicked, X, Y)  
         * - Callback Params:
         *     - `GuiCtrlObj`: Reference to the Link's object  
         *     - `Href`: The link's HREF attribute. If a Click event callback  
         *       is registered, the HREF attribute is not automatically executed.  
         *     - `Info`: The link's ID attribute (a string) if it has one, otherwise the link's index (an integer).  
         *     - `Item`: Not used with Link controls.  
         *     - `RightClicked`:  
         *       `1` = Mouse right click was used  
         *       `0` = `AppsKey` or `Shift+F10` was used  
         *     - `X` and `Y`: Right click dependant (Check `RightClicked` param)  
         *       Right Clicked = Coords of mouse click  
         *       Keyboard = Coords of the control's upper left corner  
         * @param {(String|FuncObj)} Callback - A function, method,  
         * or object that is called when the event is raised.  
         * A callback's first parameter is always the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm|`GuiControl`} that raised the event.  
         * @param {(Integer)} [AddRemove] - Adjust callback order or delete callback.  
         * - `1` = Add the callback after any previously registered callbacks.  
         * - `-1` = Add the callback before any previously registered callbacks.  
         * - `0` = Remove the callback.  
         * 
         * If multiple callbacks are registered, a callback that returns  
         * a non-empty string will stop all remaining callbacks from running.  
         * @returns {(String)} An empty string is always returned.  
         * @example <caption>  
         * </caption>
         */
        OnEvent(EventName, Callback [, AddRemove:=1]) => EmptyString
    }
    
    /**
     * Class for grouping the list controls: ComboBox, DropDownList, ListBox, and Tab
     * @class
     */
    class List extends Gui.Control {
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Add|`Add()`} appends items to a multi-item control (ListBox, DropDownList, ComboBox, or Tab).  
         * To replace/overwrite the list, use the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Delete|`Delete()`} method beforehand.
         * @method
         * @param {(Array)} Items - An array of strings to be inserted as items at the end of the control's list.
         * @returns {(String)} An empty string is always returned.  
         * @see {@link https://www.autohotkey.com/docs/v2/lib/ListView.htm#Add|`ListView.Add()`}
         * , {@link https://www.autohotkey.com/docs/v2/lib/TreeView.htm#Add|`TreeView.Add()`}
         * @example <caption>  
         * </caption>
         */
        Add(Items) => EmptyString
        
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Choose|`Choose()`} selects an item in a multi-item control (ListBox, DropDownList, ComboBox, or Tab).  
         * Unlike {@link https://www.autohotkey.com/docs/v2/lib/ControlChooseIndex.htm|`ControlChooseIndex()`}, this method does not raise a {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Change|`Change`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#DoubleClick|`DoubleClick`} event.  
         * @method
         * @param {(Integer|String)} Value - Specify the number of the item. 1 for first item, 2 for second.  
         * If value is a `0` or `EmptyString`, any selected value is deselected.  
         * If Value is a string (including a numeric string), the list item that matches the most leading characters is selected. This search is not case sensitive.  
         * If the ListBox is multi-select, all matching items are selected.  
         * @returns {(String)} An empty string is always returned.  
         * @example
         */
        Choose(Value) => EmptyString
        
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Delete|`Delete()`} removes one or all items from a multi-item control (ListBox, DropDownList, ComboBox, or Tab).  
         * @method
         * @param {(Integer)} Value - Item number to be deleted. `1` is first item, `2` is second, etc.  
         * If value is omitted, all items are deleted.  
         * @returns {(String)} An empty string is always returned.  
         * @see {@link https://www.autohotkey.com/docs/v2/lib/ListView.htm#Delete|`ListView.Delete()`}
         * , {@link https://www.autohotkey.com/docs/v2/lib/TreeView.htm#Delete|`TreeView.Delete()`}
         * @example
         */
        Delete([Value]) => EmptyString
    }
    
    /**
     * @class
     */
    class ComboBox extends Gui.List {
        /**
         * Gets or sets the text of the currently selected item of the ComboBox.  
         * If there is no selected item, the text in the control's edit field is retrieved instead.  
         * To select an item by its position number instead of its text, use the Value property.
         * @type {(String)}
         */
        Text => String
        
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Value|`Value`} retrieves or sets position number  
         * of the currently selected item.  
         * If text is in the ComboBox, the first matching text is used.  
         * 0 indicates nothing is selected and no matches were made.  
         * Setting the property to 0 clears any selected item.  
         * Use the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Text|`Text property`} to set/get the control text.
         * @property
         * @type {(Integer)}
         */
        Value => Integer
        
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Add|`Add()`} appends the specified entries to the control.  
         * @method
         * @param {(Array)} Items - An array of strings to appened to the list.  
         * To replace the list with a new one, use the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Delete|`Delete() method`} first and then add the list.  
         * To pre-select an item, use the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Choose|`Choose() method`}.  
         * @returns {(String)} An empty string is always returned.  
         * @example <caption>  
         * </caption>
         * goo := Gui()
         * goo.letter_combo := goo.AddComboBox('xm ym r6', ['a', 'b', 'c'])
         * goo.Show('y300 AutoSize')
         * MsgBox('Click OK to add "e", "f", "g" to the ComboBox.')
         * goo.letter_combo.Add(['e', 'f', 'g'])
         */
        Add(Items) => EmptyString
    
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Choose|`Choose()`} sets a value from the ComboBox to selected.  
         * @method
         * @param {(Integer|String)} Value - Specify the number of the item. 1 for first item, 2 for second.  
         * If value is a `0` or `EmptyString`, any selected value is deselected.  
         * If Value is a string (including a numeric string), the list item that matches the most leading characters is selected. This search is not case sensitive.  
         * @returns {(String)} An empty string is always returned.  
         */
        Choose(Value) => EmptyString
    
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Delete|`Delete()`} removes the specified entry or all entries from the ComboBox.  
         * @method
         * @param {(Integer)} [Value] - The index number of the item to delete or all items if value is omitted.  
         * @returns {(String)} An empty string is always returned.  
         * @example <caption>  
         * </caption>
         *  
         */
        Delete([Value]) => EmptyString
        
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Events|`OnEvent()`} assigns a {@link https://www.autohotkey.com/docs/v2/Functions.htm|`Function`}, 
         * {@link https://www.autohotkey.com/docs/v2/Concepts.htm#methods|`Method`},  
         * or {@link https://www.autohotkey.com/docs/v2/lib/Object.htm|`Object`} to be called when a specified event happens.  
         * @method
         * @param {(String)} EventName - One of the following event(s):  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Change|`Change`} - The ComboBox's value changes.  
         * 
         *       ComboBox_Change(GuiCtrlObj, Info)
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#DoubleClick|`DoubleClick`} - The ComboBox is double-clicked.  
         * 
         *       ComboBox_DoubleClick(GuiCtrlObj, Info)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Ctrl-ContextMenu|`ContextMenu`} - The user right-clicks the ComboBox or presses  
         * Menu or Shift+F10 while the ComboBox has the keyboard focus.  
         * The context menu does not work with the edit portion of the control.
         * 
         *       ComboBox_ContextMenu(GuiCtrlObj, Info, RightClicked, X, Y)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Focus|`Focus`} - The ComboBox gains the keyboard focus.  
         * 
         *       ComboBox_Focus(GuiCtrlObj, Reserved)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#LoseFocus|`LoseFocus`} - The ComboBox loses the keyboard focus.  
         * 
         *       ComboBox_LoseFocus(GuiCtrlObj, Reserved)  
         * - Callback Params:
         *     - `GuiCtrlObj`: Reference to the ComboBox's object  
         *     - `Info`: Not used with ComboBox controls  
         *     - `RightClicked`:  
         *       `1` = Mouse right click was used  
         *       `0` = `AppsKey` or `Shift+F10` was used  
         *     - `X` and `Y`: Right click dependant (Check `RightClicked` param)  
         *       Right Clicked = Coords of mouse click  
         *       Keyboard = Coords of the control's upper left corner  
         * @param {(String|FuncObj)} Callback - A function, method,  
         * or object that is called when the event is raised.  
         * A callback's first parameter is always the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm|`GuiControl`} that raised the event.  
         * @param {(Integer)} [AddRemove] - Adjust callback order or delete callback.  
         * - `1` = Add the callback after any previously registered callbacks.  
         * - `-1` = Add the callback before any previously registered callbacks.  
         * - `0` = Remove the callback.  
         * 
         * If multiple callbacks are registered, a callback that returns  
         * a non-empty string will stop all remaining callbacks from running.  
         * @returns {(String)} An empty string is always returned.  
         * @example <caption>  
         * </caption>
         */
        OnEvent(EventName, Callback [, AddRemove:=1]) => EmptyString
    }
    
    /**
     * @class
     */
    class DDL extends Gui.List {
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Value|`Value`} retrieves or sets position number  
         * of the currently selected item.  
         * 0 means nothing is selected.  
         * Setting Value to 0 clears any selected item.  
         * Use the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Text|`Text property`} to set/get the control text.
         * @property
         * @type {(Integer)}
         */
        Value => Integer
        
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Add|`Add()`} appends the specified entries to the DropDownList.  
         * @method
         * @param {(Array)} Items - An array of strings to appened to the list.  
         * To replace the list with a new one, use the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Delete|`Delete() method`} first and then add the list.  
         * To pre-select an item, use the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Choose|`Choose() method`}.  
         * @returns {(String)} An empty string is always returned.  
         * @example <caption>  
         * </caption>
         * goo := Gui()
         * goo.letter_ddl := goo.AddDDL('xm ym', ['a', 'b', 'c'])
         * goo.Show('y300 AutoSize')
         * MsgBox('Click OK to add "e", "f", "g" to DropDownList')
         * goo.letter_ddl.Add(['e', 'f', 'g'])
         */
        Add(Items) => EmptyString
        
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Choose|`Choose()`} sets a value from the DropDownList to selected.  
         * @method
         * @param {(Integer|String)} Value - Specify the number of the item. 1 for first item, 2 for second.  
         * If value is a `0` or `EmptyString`, any selected value is deselected.  
         * If Value is a string (including a numeric string), the list item that matches the most leading characters is selected. This search is not case sensitive.  
         * @returns {(String)} An empty string is always returned.  
         * @example <caption>  
         * </caption>
         * goo := Gui()
         * goo.combo := goo.AddComboBox('xm ym', ['a', 'b', 'c'])
         * goo.combo.Choose(2)
         * goo.Show('y300 AutoSize')
         */
        Choose(Value) => EmptyString
        
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Delete|`Delete()`} removes the specified entry or all entries from the DropDownList.  
         * @method
         * @param {(Integer)} [Value] - The index number of the item to delete or all items if value is omitted.  
         * @returns {(String)} An empty string is always returned.  
         * @example <caption>  
         * </caption>
         *  
         */
        Delete([Value]) => EmptyString
        
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Events|`OnEvent()`} assigns a {@link https://www.autohotkey.com/docs/v2/Functions.htm|`Function`}, 
         * {@link https://www.autohotkey.com/docs/v2/Concepts.htm#methods|`Method`},  
         * or {@link https://www.autohotkey.com/docs/v2/lib/Object.htm|`Object`} to be called when a specified event happens.  
         * @method
         * @param {(String)} EventName - One of the following event(s):  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Change|`Change`} - The DropDownList's value changes.  
         * 
         *       DDL_Change(GuiCtrlObj, Info)
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Ctrl-ContextMenu|`ContextMenu`} - The user right-clicks the DropDownList or presses  
         * Menu or Shift+F10 while the DropDownList has the keyboard focus.  
         * 
         *       DDL_ContextMenu(GuiCtrlObj, Info, RightClicked, X, Y)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Focus|`Focus`} - The DropDownList gains the keyboard focus.  
         * 
         *       DDL_Focus(GuiCtrlObj, Reserved)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#LoseFocus|`LoseFocus`} - The DropDownList loses the keyboard focus.  
         * 
         *       DDL_LoseFocus(GuiCtrlObj, Reserved)  
         * - Callback Params:
         *     - `GuiCtrlObj`: Reference to the DropDownList's object  
         *     - `Info`: Not used with DropDownList controls  
         *     - `RightClicked`:  
         *       `1` = Mouse right click was used  
         *       `0` = `AppsKey` or `Shift+F10` was used  
         *     - `X` and `Y`: Right click dependant (Check `RightClicked` param)  
         *       Right Clicked = Coords of mouse click  
         *       Keyboard = Coords of the control's upper left corner  
         * @param {(String|FuncObj)} Callback - A function, method,  
         * or object that is called when the event is raised.  
         * A callback's first parameter is always the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm|`GuiControl`} that raised the event.  
         * @param {(Integer)} [AddRemove] - Adjust callback order or delete callback.  
         * - `1` = Add the callback after any previously registered callbacks.  
         * - `-1` = Add the callback before any previously registered callbacks.  
         * - `0` = Remove the callback.  
         * 
         * If multiple callbacks are registered, a callback that returns  
         * a non-empty string will stop all remaining callbacks from running.  
         * @returns {(String)} An empty string is always returned.  
         * @example <caption>  
         * </caption>
         */
        OnEvent(EventName, Callback [, AddRemove:=1]) => EmptyString
    }
    
    /**
     * @class
     */
    class DropDownList extends Gui.List {
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Value|`Value`} retrieves or sets position number  
         * of the currently selected item.  
         * 0 means nothing is selected.  
         * Setting Value to 0 clears any selected item.  
         * Use the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Text|`Text property`} to set/get the control text.
         * @property
         * @type {(Integer)}
         */
        Value => Integer
        
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Add|`Add()`} appends the specified entries to the DropDownList.  
         * @method
         * @param {(Array)} Items - An array of strings to appened to the list.  
         * To replace the list with a new one, use the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Delete|`Delete() method`} first and then add the list.  
         * To pre-select an item, use the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Choose|`Choose() method`}.  
         * @returns {(String)} An empty string is always returned.  
         * @example <caption>  
         * </caption>
         * goo := Gui()
         * goo.letter_ddl := goo.AddDDL('xm ym', ['a', 'b', 'c'])
         * goo.Show('y300 AutoSize')
         * MsgBox('Click OK to add "e", "f", "g" to DropDownList')
         * goo.letter_ddl.Add(['e', 'f', 'g'])
         */
        Add(Items) => EmptyString
        
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Choose|`Choose()`} sets a value from the DropDownList to selected.  
         * @method
         * @param {(Integer|String)} Value - Specify the number of the item. 1 for first item, 2 for second.  
         * If value is a `0` or `EmptyString`, any selected value is deselected.  
         * If Value is a string (including a numeric string), the list item that matches the most leading characters is selected. This search is not case sensitive.  
         * @returns {(String)} An empty string is always returned.  
         * @example <caption>  
         * </caption>
         * goo := Gui()
         * goo.combo := goo.AddComboBox('xm ym', ['a', 'b', 'c'])
         * goo.combo.Choose(2)
         * goo.Show('y300 AutoSize')
         */
        Choose(Value) => EmptyString
        
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Delete|`Delete()`} removes the specified entry or all entries from the DropDownList.  
         * @method
         * @param {(Integer)} [Value] - The index number of the item to delete or all items if value is omitted.  
         * @returns {(String)} An empty string is always returned.  
         * @example <caption>  
         * </caption>
         *  
         */
        Delete([Value]) => EmptyString
        
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Events|`OnEvent()`} assigns a {@link https://www.autohotkey.com/docs/v2/Functions.htm|`Function`}, 
         * {@link https://www.autohotkey.com/docs/v2/Concepts.htm#methods|`Method`},  
         * or {@link https://www.autohotkey.com/docs/v2/lib/Object.htm|`Object`} to be called when a specified event happens.  
         * @method
         * @param {(String)} EventName - One of the following event(s):  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Change|`Change`} - The DropDownList's value changes.  
         * 
         *       DDL_Change(GuiCtrlObj, Info)
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Ctrl-ContextMenu|`ContextMenu`} - The user right-clicks the DropDownList or presses  
         * Menu or Shift+F10 while the DropDownList has the keyboard focus.  
         * 
         *       DDL_ContextMenu(GuiCtrlObj, Info, RightClicked, X, Y)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Focus|`Focus`} - The DropDownList gains the keyboard focus.  
         * 
         *       DDL_Focus(GuiCtrlObj, Reserved)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#LoseFocus|`LoseFocus`} - The DropDownList loses the keyboard focus.  
         * 
         *       DDL_LoseFocus(GuiCtrlObj, Reserved)  
         * - Callback Params:
         *     - `GuiCtrlObj`: Reference to the DropDownList's object  
         *     - `Info`: Not used with DropDownList controls  
         *     - `RightClicked`:  
         *       `1` = Mouse right click was used  
         *       `0` = `AppsKey` or `Shift+F10` was used  
         *     - `X` and `Y`: Right click dependant (Check `RightClicked` param)  
         *       Right Clicked = Coords of mouse click  
         *       Keyboard = Coords of the control's upper left corner  
         * @param {(String|FuncObj)} Callback - A function, method,  
         * or object that is called when the event is raised.  
         * A callback's first parameter is always the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm|`GuiControl`} that raised the event.  
         * @param {(Integer)} [AddRemove] - Adjust callback order or delete callback.  
         * - `1` = Add the callback after any previously registered callbacks.  
         * - `-1` = Add the callback before any previously registered callbacks.  
         * - `0` = Remove the callback.  
         * 
         * If multiple callbacks are registered, a callback that returns  
         * a non-empty string will stop all remaining callbacks from running.  
         * @returns {(String)} An empty string is always returned.  
         * @example <caption>  
         * </caption>
         */
        OnEvent(EventName, Callback [, AddRemove:=1]) => EmptyString
    }
    
    /**
     * @class
     */
    class ListBox extends Gui.List {
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Value|`Value`} retrieves or sets the index of the  
         * currently selected items. 0 indicates nothing was selected.  
         * If the {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#ListBoxMulti|`Multi` option} is enabled, an array is returned  
         * and contains the index of all selected item.  
         * If array is empty `array.length = 0`, nothing was selected.  
         * When setting Value, only integers can be used.  
         * To set multiple items, loop through them and use the  
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Choose|`Choose()` method} to select each item.  
         * @property
         * @type {(Integer|Array)}
         */
        Value => Array
        
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Add|`Add()`} appends the specified entries to the control.  
         * @method
         * @param {(Array)} Items - An array of strings to appened to the list.  
         * To replace the list with a new one, use the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Delete|`Delete() method`} first and then add the list.  
         * To pre-select an item, use the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Choose|`Choose() method`}.  
         * @returns {(String)} An empty string is always returned.  
         * @example <caption>  
         * </caption>
         * goo := Gui()
         * goo.lb := goo.AddListBox('xm ym +Multi', ['a', 'b', 'c'])
         * goo.lb.Choose(2)
         * goo.Show('y300 AutoSize')
         *  
         * LB_SETSEL := 0x0185
         * MsgBox('Press OK to select all')
         * PostMessage(LB_SETSEL, 1, -1, goo.lb)
         *  
         * MsgBox('Press OK to deselect all')
         * PostMessage(LB_SETSEL, 0, -1, goo.lb)
         */
        Add(Items) => EmptyString
    
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Choose|`Choose()`} selects an item in a multi-item control.
         * @method
         * @param {(Integer|String)} Value - Specify the number of the item. 1 for first item, 2 for second.  
         * If value is a `0` or `EmptyString`, any selected value is deselected.  
         * If Value is a string (including a numeric string), the list item that matches the most leading characters is selected. This search is not case sensitive.  
         * If the ListBox is multi-select, all matching items are selected.  
         * {@link https://www.autohotkey.com/docs/v2/lib/PostMessage.htm|`PostMessage()`} can be used to select or deselect all items. See {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Choose_Remarks|`example`}.  
         * @returns {(String)} An empty string is always returned.  
         * @example <caption>  
         * A searchable ListBox</caption>
         * goo := Gui()
         * lb_arr := ['apple', 'apricot', 'avocado', 'banana']
         * goo.listbox := goo.AddListBox('xm ym w300 +Multi r' lb_arr.Length , lb_arr)
         * goo.listbox.Choose(2)
         * goo.AddText('xm w40 h20 +0x200', 'Search:')
         * goo.edit := goo.AddEdit('x+0 w260 h20')
         * goo.edit.OnEvent('Change', search_list)
         * goo.edit.Focus()
         * goo.Show('y300 AutoSize')
         * 
         * search_list(con, info) {
         *     con.gui.listbox.choose(0)
         *     try
         *         con.gui.listbox.Choose(con.value)
         *     catch
         *         ToolTip('Invalid character')
         *         ,SetTimer(Tooltip, -1500)
         * }
         */
        Choose(Value) => EmptyString
    
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Delete|`Delete()`} removes the specified entry or all entries from the ListBox.  
         * @method
         * @param {(Integer)} [Value] - The index number of the item to delete or all items if value is omitted.  
         * @returns {(String)} An empty string is always returned.  
         * @example <caption>  
         * </caption>
         *  
         */
        Delete([Value]) => EmptyString
        
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Events|`OnEvent()`} assigns a {@link https://www.autohotkey.com/docs/v2/Functions.htm|`Function`}, 
         * {@link https://www.autohotkey.com/docs/v2/Concepts.htm#methods|`Method`},  
         * or {@link https://www.autohotkey.com/docs/v2/lib/Object.htm|`Object`} to be called when a specified event happens.  
         * @method
         * @param {(String)} EventName - One of the following event(s):  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Change|`Change`} - The ListBox's value changes.  
         * 
         *       ListBox_Change(GuiCtrlObj, Info)
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#DoubleClick|`DoubleClick`} - The ListBox is double-clicked.  
         * 
         *       ListBox_DoubleClick(GuiCtrlObj, ItemPos)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Ctrl-ContextMenu|`ContextMenu`} - The user right-clicks the ListBox or presses  
         * Menu or Shift+F10 while the ListBox has the keyboard focus.  
         * 
         *       ListBox_ContextMenu(GuiCtrlObj, Item, RightClicked, X, Y)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Focus|`Focus`} - The ListBox gains the keyboard focus.  
         * 
         *       ListBox_Focus(GuiCtrlObj, Reserved)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#LoseFocus|`LoseFocus`} - The ListBox loses the keyboard focus.  
         * 
         *       ListBox_LoseFocus(GuiCtrlObj, Reserved)  
         * - Callback Params:
         *     - `GuiCtrlObj`: Reference to the ListBox's object  
         *     - `Info`: Position number of the focused item on double click  
         *     - `ItemPos`: Position number of the focused item  
         *     - `Item`: Position number of current focused item  
         *       Right clicking a standard ListBox does not focus an item  
         *       Meaning this may not be the clicked item  
         *     - `RightClicked`:  
         *       `1` = Mouse right click was used  
         *       `0` = `AppsKey` or `Shift+F10` was used  
         *     - `X` and `Y`: Right click dependant (Check `RightClicked` param)  
         *       Right Clicked = Coords of mouse click  
         *       Keyboard = Coords of the control's upper left corner  
         * @param {(String|FuncObj)} Callback - A function, method,  
         * or object that is called when the event is raised.  
         * A callback's first parameter is always the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm|`GuiControl`} that raised the event.  
         * @param {(Integer)} [AddRemove] - Adjust callback order or delete callback.  
         * - `1` = Add the callback after any previously registered callbacks.  
         * - `-1` = Add the callback before any previously registered callbacks.  
         * - `0` = Remove the callback.  
         * 
         * If multiple callbacks are registered, a callback that returns  
         * a non-empty string will stop all remaining callbacks from running.  
         * @returns {(String)} An empty string is always returned.  
         * @example <caption>  
         * </caption>
         */
        OnEvent(EventName, Callback [, AddRemove:=1]) => EmptyString
    }
    
    /**
     * @class
     */
    class Tab extends Gui.List {
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Value|`Value`} retrieves or sets  
         * position number of the currently selected tab.  
         * A Value of 0 means no tab is selected.  
         * A Value **can** be set to 0.  
         * Use the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Text|`Text property`} to set/get the control text.
         * @property
         * @type {(Integer)}
         */
        Value => Integer
        
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Add|`Add()`} appends the specified tabs to the control.  
         * @method
         * @param {(Array)} Items - An array of strings to appened to the tabs.  
         * To replace the list with a new one, use the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Delete|`Delete() method`} first and then add the list.  
         * To pre-select an item, use the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Choose|`Choose() method`}.  
         * @returns {(String)} An empty string is always returned.  
         * @example <caption>  
         * </caption>
         * goo := Gui()
         * goo.letter_tabs := goo.AddTab('xm ym', ['a', 'b', 'c'])
         * goo.Show('y300 AutoSize')
         * MsgBox('Click OK to add "e" and "f" tabs.')
         * goo.letter_tabs.Add(['e', 'f'])
         */
        Add(Items) => EmptyString
    
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Choose|`Choose()`} selects a tab.  
         * @method
         * @param {(Integer|String)} Value - Specify the number of the item. 1 for first item, 2 for second.  
         * If value is a `0` or `EmptyString`, any selected value is deselected.  
         * If Value is a string (including a numeric string), the list item that matches the most leading characters is selected. This search is not case sensitive.  
         * {@link https://www.autohotkey.com/docs/v2/lib/PostMessage.htm|`PostMessage()`} can be used to select or deselect all items. See example.  
         * @returns {(String)} An empty string is always returned.  
         * @example <caption>  
         * </caption>
         * goo := Gui()
         * tab_names := ['A','B','C','D']
         * goo.tabs := goo.AddTab3('xm ym w200', tab_names)
         * MsgBox('Press OK to select tab C')
         * goo.tabs.Choose(3)
         * goo.Show('w500 y300 AutoSize')
         */
        Choose(Value) => EmptyString
    
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Delete|`Delete()`} removes the specified tab or all tabs from the Tab control.  
         * Deleting a tab removes only the tab title and does not affect that tab's sub-controls. Instead, the tabs names are shifted left and the last tab's controls are deleted.  
         * Because of this behavior, if you need a deleteable tab, it should placed at the end of the tab list. Otherwise, the only way to rearrange tabs is to delete and rebuild the tab control.  
         * The example code below demonstrates this behavior. Tab B is removed, the remaining tabs are shifted left, and tab B's control are now under the C tab. The final tab's controls, tab D, are deleted.  
         * @method
         * @param {(Integer)} [Value] - The index number of the item to delete or all items if value is omitted.  
         * @returns {(String)} An empty string is always returned.  
         * @example <caption>  
         * </caption>
         * goo := Gui()
         * tab_names := ['A','B','C','D']
         * goo.tabs := goo.AddTab3('xm ym w200 r3 Section', tab_names)
         * for i, tname in tab_names
         *     goo.Tabs.UseTab(A_Index)
         *     ,goo.AddButton('xs+5 ys+25', '"Tab ' tname '" Button')
         * goo.Show('w500 y300 AutoSize')
         * MsgBox('Press OK to delete tab "B".')
         * goo.tabs.Delete(2)
         */
        Delete([Value]) => EmptyString
        
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Events|`OnEvent()`} assigns a {@link https://www.autohotkey.com/docs/v2/Functions.htm|`Function`}, 
         * {@link https://www.autohotkey.com/docs/v2/Concepts.htm#methods|`Method`},  
         * or {@link https://www.autohotkey.com/docs/v2/lib/Object.htm|`Object`} to be called when a specified event happens.  
         * @method
         * @param {(String)} EventName - One of the following event(s):  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Change|`Change`} - The Tab's value changes.  
         * 
         *       Tab_Change(GuiCtrlObj, Info)
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Ctrl-ContextMenu|`ContextMenu`} - The user right-clicks the Tab or presses  
         * Menu or Shift+F10 while the Tab has the keyboard focus.  
         * 
         *       Tab_ContextMenu(GuiCtrlObj, Info, RightClicked, X, Y)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Focus|`Focus`} - The Tab gains the keyboard focus.  
         * 
         *       Tab_Focus(GuiCtrlObj, Reserved)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#LoseFocus|`LoseFocus`} - The Tab loses the keyboard focus.  
         * 
         *       Tab_LoseFocus(GuiCtrlObj, Reserved)  
         * - Callback Params:
         *     - `GuiCtrlObj`: Reference to the Tab's object  
         *     - `Info`: Not used with Tab controls  
         *     - `RightClicked`:  
         *       `1` = Mouse right click was used  
         *       `0` = `AppsKey` or `Shift+F10` was used  
         *     - `X` and `Y`: Right click dependant (Check `RightClicked` param)  
         *       Right Clicked = Coords of mouse click  
         *       Keyboard = Coords of the control's upper left corner  
         * @param {(String|FuncObj)} Callback - A function, method,  
         * or object that is called when the event is raised.  
         * A callback's first parameter is always the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm|`GuiControl`} that raised the event.  
         * @param {(Integer)} [AddRemove] - Adjust callback order or delete callback.  
         * - `1` = Add the callback after any previously registered callbacks.  
         * - `-1` = Add the callback before any previously registered callbacks.  
         * - `0` = Remove the callback.  
         * 
         * If multiple callbacks are registered, a callback that returns  
         * a non-empty string will stop all remaining callbacks from running.  
         * @returns {(String)} An empty string is always returned.  
         * @example <caption>  
         * </caption>
         */
        OnEvent(EventName, Callback [, AddRemove:=1]) => EmptyString
    }
        
    /**
     * @class
     */
    class ListView extends Gui.Control {
        /**
         * [Add](): Adds a new row to the bottom of the list.  
         */
        Add([Options, Col1, ColN]) => String
        
        /**
         * [Delete](): Deletes the specified row or all rows.  
         */
        Delete() => String
        
        /**
         * [DeleteCol](): Deletes the specified column and all of the contents beneath it.  
         */
        
        DeleteCol() => String
        /**
         * [GetCount](): Returns the number of rows or columns in the control.  
         */
        
        GetCount() => String
        /**
         * [GetNext](): Returns the row number of the next selected, checked, or focused row.  
         */
        
        GetNext() => String
        
        /**
         * [GetText](): Retrieves the text at the specified row and column number.  
         */
        GetText() => String
        
        /**
         * [Insert](): Inserts a new row at the specified row number.  
         */
        Insert() => String
        
        /**
         * [InsertCol](): Inserts a new column at the specified column number.  
         */
        InsertCol() => String
        
        /**
         * [Modify](): Modifies the attributes and/or text of a row.  
         */
        Modify() => String
        
        /**
         * [ModifyCol](): Modifies the attributes and/or text of the specified column and its header.  
         */
        ModifyCol() => String
        
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Events|`OnEvent()`} assigns a {@link https://www.autohotkey.com/docs/v2/Functions.htm|`Function`}, 
         * {@link https://www.autohotkey.com/docs/v2/Concepts.htm#methods|`Method`},  
         * or {@link https://www.autohotkey.com/docs/v2/lib/Object.htm|`Object`} to be called when a specified event happens.  
         * @method
         * @param {(String)} EventName - One of the following event(s):  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Click|`Click`} - The Listview is clicked.  
         *   
         *       ListView_Click(GuiCtrlObj, Info)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#DoubleClick|`DoubleClick`} - The Listview is double-clicked.  
         * 
         *       ListView_DoubleClick(GuiCtrlObj, Info)
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#ColClick|`ColClick`} - A ListView's column header is clicked.  
         * 
         *       ListView_ColClick(GuiCtrlObj, ColNum)
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Ctrl-ContextMenu|`ContextMenu`} - The user right-clicks the ListView or presses  
         *   Menu or Shift+F10 while the ListView has the keyboard focus.  
         * 
         *       ListView_ContextMenu(GuiCtrlObj, Item, RightClicked, X, Y)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Focus|`Focus`} - The ListView gains the keyboard focus.  
         * 
         *       ListView_Focus(GuiCtrlObj, Reserved)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#LoseFocus|`LoseFocus`} - The ListView loses the keyboard focus.  
         * 
         *       ListView_LoseFocus(GuiCtrlObj, Reserved)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#ItemCheck|`ItemCheck`} - The ListView item is checked or unchecked.  
         * 
         *       ListView_ItemCheck(GuiCtrlObj, RowNum, RowChecked)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#ItemEdit|`ItemEdit`} - The ListView item's label is edited by the user.  
         *   The {@link https://www.autohotkey.com/docs/v2/lib/TreeView.htm#ReadOnly|`-ReadOnly` option} must be used to edit labels.  
         * 
         *       ListView_ItemEdit(GuiCtrlObj, RowNum)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#ItemFocus|`ItemFocus`} - The ListView item receives focus.  
         * 
         *       ListView_ItemFocus(GuiCtrlObj, RowNum)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#ItemSelect|`ItemSelect`} - A ListView item is selected or deselected.  
         *   During multiple selections (like click+drag) the event is fired once for each item.  
         * 
         *       ListView_ItemSelect(GuiCtrlObj, RowNum, IsSelected)  
         * - Callback Params:
         *     - `GuiCtrlObj`: Reference to the ListView's object  
         *     - `Info`: Row number of clicked item or 0 if not over an item  
         *     - `ColNum`: Column number of item  
         *       Column numbers do not change when columns are rearranged  
         *     - `RowNum`: The row number of the item  
         *     - `IsSelected`:
         *       - `1` = Item selected  
         *       - `0` = Item deselected  
         *     - `RowChecked`:
         *       - `1` = Row is checked  
         *       - `0` = Row is unchecked  
         *     - `Item`: Item's row or ID number  
         *       0 if the user clicked somewhere other than an item  
         *     - `RightClicked`: Context menu activation  
         *       - `1` = Activated by right click  
         *       - `0` = Activated by `AppsKey` or `Shift+F10`  
         *     - `X` and `Y`: Check `RightClicked` param  
         *       - Right Clicked = Coords of mouse click  
         *       - Keyboard = Coords of the control's upper left corner  
         * @param {(String|FuncObj)} Callback - A function, method,  
         * or object that is called when the event is raised.  
         * A callback's first parameter is always the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm|`GuiControl`} that raised the event.  
         * @param {(Integer)} [AddRemove] - Adjust callback order or delete callback.  
         * - `1` = Add the callback after any previously registered callbacks.  
         * - `-1` = Add the callback before any previously registered callbacks.  
         * - `0` = Remove the callback.  
         * 
         * If multiple callbacks are registered, a callback that returns  
         * a non-empty string will stop all remaining callbacks from running.  
         * @returns {(String)} An empty string is always returned.  
         * @example <caption>  
         * </caption>
         */
        OnEvent(EventName, Callback [, AddRemove:=1]) => EmptyString
        
        /**
         * [SetImageList](): Sets or replaces an ImageList for displaying icons.  
         */
        SetImageList() => String
    }
    
    /**
     * @class
     */
    class MonthCal extends Gui.Control {
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Events|`OnEvent()`} assigns a {@link https://www.autohotkey.com/docs/v2/Functions.htm|`Function`}, 
         * {@link https://www.autohotkey.com/docs/v2/Concepts.htm#methods|`Method`},  
         * or {@link https://www.autohotkey.com/docs/v2/lib/Object.htm|`Object`} to be called when a specified event happens.  
         * @method
         * @param {(String)} EventName - One of the following event(s):  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Change|`Change`} - The MonthCal's value changes.  
         *   
         *       MonthCal_Click(GuiCtrlObj, Info)  
         * - Callback Params:
         *     - `GuiCtrlObj`: Reference to the MonthCal's object  
         *     - `Info`: Not used with MonthCal controls  
         * @param {(String|FuncObj)} Callback - A function, method,  
         * or object that is called when the event is raised.  
         * A callback's first parameter is always the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm|`GuiControl`} that raised the event.  
         * @param {(Integer)} [AddRemove] - Adjust callback order or delete callback.  
         * - `1` = Add the callback after any previously registered callbacks.  
         * - `-1` = Add the callback before any previously registered callbacks.  
         * - `0` = Remove the callback.  
         * 
         * If multiple callbacks are registered, a callback that returns  
         * a non-empty string will stop all remaining callbacks from running.  
         * @returns {(String)} An empty string is always returned.  
         * @example <caption>  
         * </caption>
         */
        OnEvent(EventName, Callback [, AddRemove:=1]) => EmptyString
    }
    
    /**
     * @class
     */
    class Pic extends Gui.Control {
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Events|`OnEvent()`} assigns a {@link https://www.autohotkey.com/docs/v2/Functions.htm|`Function`}
         * , {@link https://www.autohotkey.com/docs/v2/Concepts.htm#methods|`Method`}, {@link https://www.autohotkey.com/docs/v2/lib/Object.htm|`Object`}
         * , or {@link https://www.autohotkey.com/docs/v2/misc/Functor.htm#BoundFunc|`BoundFunc`}  
         * to be called when the specified event is raised.    
         * @method
         * @param {(String)} EventName - One of the following event(s):  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Click|`Click`} - The Picture is clicked.  
         * 
         *       Pic_Click(GuiCtrlObj, Info)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#DoubleClick|`DoubleClick`} - The Picture is double-clicked.  
         * 
         *       Pic_DoubleClick(GuiCtrlObj, Info)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Ctrl-ContextMenu|`ContextMenu`} - The user right-clicks the Picture or presses  
         * Menu or Shift+F10 while the Picture has the keyboard focus.  
         * 
         *       Pic_ContextMenu(GuiCtrlObj, Info, RightClicked, X, Y)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Focus|`Focus`} - The Picture gains the keyboard focus.  
         * 
         *       Pic_Focus(GuiCtrlObj, Reserved)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#LoseFocus|`LoseFocus`} - The Picture loses the keyboard focus.  
         * 
         *       Pic_LoseFocus(GuiCtrlObj, Reserved)  
         * - Callback Params:
         *     - `GuiCtrlObj`: Reference to the Picture's object  
         *     - `Info`: Not used with Picture controls  
         *     - `RightClicked`: Context menu activation  
         *       - `1` = Activated by right click  
         *       - `0` = Activated by `AppsKey` or `Shift+F10`  
         *     - `X` and `Y`: Check `RightClicked` param  
         *       - Right Clicked = Coords of mouse click  
         *       - Keyboard = Coords of the Picture's upper left corner  
         * @param {(String|FuncObj)} Callback - A function, method,  
         * or object that is called when the event is raised.  
         * A callback's first parameter is always the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm|`GuiControl`} that raised the event.  
         * @param {(Integer)} [AddRemove] - Adjust callback order or delete callback.  
         * - `1` = Add the callback after any previously registered callbacks.  
         * - `-1` = Add the callback before any previously registered callbacks.  
         * - `0` = Remove the callback.  
         * 
         * If multiple callbacks are registered, a callback that returns  
         * a non-empty string will stop all remaining callbacks from running.  
         * @returns {(String)} An empty string is always returned.  
         * @example <caption>  
         * </caption>
         */
        OnEvent(EventName, Callback [, AddRemove:=1]) => EmptyString
    }
    
    /**
     * @class
     */
    class Picture extends Gui.Control {
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Events|`OnEvent()`} assigns a {@link https://www.autohotkey.com/docs/v2/Functions.htm|`Function`}
         * , {@link https://www.autohotkey.com/docs/v2/Concepts.htm#methods|`Method`}, {@link https://www.autohotkey.com/docs/v2/lib/Object.htm|`Object`}
         * , or {@link https://www.autohotkey.com/docs/v2/misc/Functor.htm#BoundFunc|`BoundFunc`}  
         * to be called when the specified event is raised.    
         * @method
         * @param {(String)} EventName - One of the following event(s):  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Click|`Click`} - The Picture is clicked.  
         * 
         *       Pic_Click(GuiCtrlObj, Info)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#DoubleClick|`DoubleClick`} - The Picture is double-clicked.  
         * 
         *       Pic_DoubleClick(GuiCtrlObj, Info)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Ctrl-ContextMenu|`ContextMenu`} - The user right-clicks the Picture or presses  
         * Menu or Shift+F10 while the Picture has the keyboard focus.  
         * 
         *       Pic_ContextMenu(GuiCtrlObj, Info, RightClicked, X, Y)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Focus|`Focus`} - The Picture gains the keyboard focus.  
         * 
         *       Pic_Focus(GuiCtrlObj, Reserved)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#LoseFocus|`LoseFocus`} - The Picture loses the keyboard focus.  
         * 
         *       Pic_LoseFocus(GuiCtrlObj, Reserved)  
         * - Callback Params:
         *     - `GuiCtrlObj`: Reference to the Picture's object  
         *     - `Info`: Not used with Picture controls  
         *     - `RightClicked`: Context menu activation  
         *       - `1` = Activated by right click  
         *       - `0` = Activated by `AppsKey` or `Shift+F10`  
         *     - `X` and `Y`: Check `RightClicked` param  
         *       - Right Clicked = Coords of mouse click  
         *       - Keyboard = Coords of the Picture's upper left corner  
         * @param {(String|FuncObj)} Callback - A function, method,  
         * or object that is called when the event is raised.  
         * A callback's first parameter is always the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm|`GuiControl`} that raised the event.  
         * @param {(Integer)} [AddRemove] - Adjust callback order or delete callback.  
         * - `1` = Add the callback after any previously registered callbacks.  
         * - `-1` = Add the callback before any previously registered callbacks.  
         * - `0` = Remove the callback.  
         * 
         * If multiple callbacks are registered, a callback that returns  
         * a non-empty string will stop all remaining callbacks from running.  
         * @returns {(String)} An empty string is always returned.  
         * @example <caption>  
         * </caption>
         */
        OnEvent(EventName, Callback [, AddRemove:=1]) => EmptyString
    }
    
    /**
     * @class
     */
    class Progress extends Gui.Control {
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Events|`OnEvent()`} assigns a {@link https://www.autohotkey.com/docs/v2/Functions.htm|`Function`}
         * , {@link https://www.autohotkey.com/docs/v2/Concepts.htm#methods|`Method`}, {@link https://www.autohotkey.com/docs/v2/lib/Object.htm|`Object`}
         * , or {@link https://www.autohotkey.com/docs/v2/misc/Functor.htm#BoundFunc|`BoundFunc`}  
         * to be called when the specified event is raised.    
         * @method
         * @param {(String)} EventName - One of the following event(s):  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Ctrl-ContextMenu|`ContextMenu`} - The user right-clicks the Progress bar or presses  
         * Menu or Shift+F10 while the Progress bar has the keyboard focus.  
         * 
         *       Pic_ContextMenu(GuiCtrlObj, Info, RightClicked, X, Y)  
         * - Callback Params:
         *     - `GuiCtrlObj`: Reference to the Progress object  
         *     - `Info`: Not used with Progress bar controls  
         *     - `RightClicked`: Context menu activation  
         *       - `1` = Activated by right click  
         *       - `0` = Activated by `AppsKey` or `Shift+F10`  
         *     - `X` and `Y`: Check `RightClicked` param  
         *       - Right Clicked = Coords of mouse click  
         *       - Keyboard = Coords of the Progress bar's upper left corner  
         * @param {(String|FuncObj)} Callback - A function, method,  
         * or object that is called when the event is raised.  
         * A callback's first parameter is always the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm|`GuiControl`} that raised the event.  
         * @param {(Integer)} [AddRemove] - Adjust callback order or delete callback.  
         * - `1` = Add the callback after any previously registered callbacks.  
         * - `-1` = Add the callback before any previously registered callbacks.  
         * - `0` = Remove the callback.  
         * 
         * If multiple callbacks are registered, a callback that returns  
         * a non-empty string will stop all remaining callbacks from running.  
         * @returns {(String)} An empty string is always returned.  
         * @example <caption>  
         * </caption>
         */
        OnEvent(EventName, Callback [, AddRemove:=1]) => EmptyString
    }
    
    /**
     * @class
     */
    class Radio extends Gui.Control {
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Value|`Value`} retrieves or sets the checked state.  
         * Values can be:  
         * `1`: Checked  
         * `0`: Unchecked  
         * Use the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Text|`Text property`} to set/get the control text.
         * @property
         * @type {(Integer)}
         */
        Value => Integer
        
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Events|`OnEvent()`} assigns a {@link https://www.autohotkey.com/docs/v2/Functions.htm|`Function`}
         * , {@link https://www.autohotkey.com/docs/v2/Concepts.htm#methods|`Method`}, {@link https://www.autohotkey.com/docs/v2/lib/Object.htm|`Object`}
         * , or {@link https://www.autohotkey.com/docs/v2/misc/Functor.htm#BoundFunc|`BoundFunc`}  
         * to be called when the specified event is raised.    
         * @method
         * @param {(String)} EventName - One of the following events:  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Click|`Click`} - The Radio button is clicked.  
         * 
         *       Radio_Click(GuiCtrlObj, Info)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#DoubleClick|`DoubleClick`} - The Radio button is double-clicked.  
         * 
         *       Radio_DoubleClick(GuiCtrlObj, Info)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Ctrl-ContextMenu|`ContextMenu`} - The user right-clicks the Progress bar or presses  
         * Menu or Shift+F10 while the Progress bar has the keyboard focus.  
         * 
         *       Radio_ContextMenu(GuiCtrlObj, Info, RightClicked, X, Y)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Focus|`Focus`} - The Radio button gains the keyboard focus.  
         * 
         *       Radio_Focus(GuiCtrlObj, Reserved)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#LoseFocus|`LoseFocus`} - The Radio button loses the keyboard focus.  
         * 
         *       Radio_LoseFocus(GuiCtrlObj, Reserved)  
         * - Callback Params:
         *     - `GuiCtrlObj`: Reference to the Radio's object  
         *     - `Info`: Not used with Radio button controls  
         *     - `RightClicked`: Context menu activation  
         *       - `1` = Activated by right click  
         *       - `0` = Activated by `AppsKey` or `Shift+F10`  
         *     - `X` and `Y`: Check `RightClicked` param  
         *       - Right Clicked = Coords of mouse click  
         *       - Keyboard = Coords of the Radio button's upper left corner  
         * @param {(String|FuncObj)} Callback - A function, method,  
         * or object that is called when the event is raised.  
         * A callback's first parameter is always the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm|`GuiControl`} that raised the event.  
         * @param {(Integer)} [AddRemove] - Adjust callback order or delete callback.  
         * - `1` = Add the callback after any previously registered callbacks.  
         * - `-1` = Add the callback before any previously registered callbacks.  
         * - `0` = Remove the callback.  
         * 
         * If multiple callbacks are registered, a callback that returns  
         * a non-empty string will stop all remaining callbacks from running.  
         * @returns {(String)} An empty string is always returned.  
         * @example <caption>  
         * </caption>
         */
        OnEvent(EventName, Callback [, AddRemove:=1]) => EmptyString
    }
    
    /**
     * @class
     */
    class Slider extends Gui.Control {
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Events|`OnEvent()`} assigns a {@link https://www.autohotkey.com/docs/v2/Functions.htm|`Function`}
         * , {@link https://www.autohotkey.com/docs/v2/Concepts.htm#methods|`Method`}, {@link https://www.autohotkey.com/docs/v2/lib/Object.htm|`Object`}
         * , or {@link https://www.autohotkey.com/docs/v2/misc/Functor.htm#BoundFunc|`BoundFunc`}  
         * to be called when the specified event is raised.    
         * @method
         * @param {(String)} EventName - One of the following events:  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Change|`Change`} - The Slider's value changes.  
         * 
         *       Slider_Change(GuiCtrlObj, Info)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Ctrl-ContextMenu|`ContextMenu`} - The user right-clicks the Progress bar or presses  
         * Menu or Shift+F10 while the Progress bar has the keyboard focus.  
         * 
         *       Slider_ContextMenu(GuiCtrlObj, Item, RightClicked, X, Y)  
         * - Callback Params:
         *     - `GuiCtrlObj`: Reference to the Slider's object  
         *     - `Info`: Amount slider has changed between starting and stopping  
         *       If the {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#AltSubmit|`AltSubmit`} option is used the event is raised  
         *       after any type of value change is detected.  
         *     - `Item`: Not used with Slider controls.  
         *     - `RightClicked`: Context menu activation  
         *       - `1` = Activated by right click  
         *       - `0` = Activated by `AppsKey` or `Shift+F10`  
         *     - `X` and `Y`: Check `RightClicked` param  
         *       - Right Clicked = Coords of mouse click  
         *       - Keyboard = Coords of the Slider's upper left corner  
         * @param {(String|FuncObj)} Callback - A function, method,  
         * or object that is called when the event is raised.  
         * A callback's first parameter is always the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm|`GuiControl`} that raised the event.  
         * @param {(Integer)} [AddRemove] - Adjust callback order or delete callback.  
         * - `1` = Add the callback after any previously registered callbacks.  
         * - `-1` = Add the callback before any previously registered callbacks.  
         * - `0` = Remove the callback.  
         * 
         * If multiple callbacks are registered, a callback that returns  
         * a non-empty string will stop all remaining callbacks from running.  
         * @returns {(String)} An empty string is always returned.  
         * @example <caption>  
         * </caption>
         */
        OnEvent(EventName, Callback [, AddRemove:=1]) => EmptyString
    }
    
    /**
     * @class
     */
    class StatusBar extends Gui.Control {
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Events|`OnEvent()`} assigns a {@link https://www.autohotkey.com/docs/v2/Functions.htm|`Function`}
         * , {@link https://www.autohotkey.com/docs/v2/Concepts.htm#methods|`Method`}, {@link https://www.autohotkey.com/docs/v2/lib/Object.htm|`Object`}
         * , or {@link https://www.autohotkey.com/docs/v2/misc/Functor.htm#BoundFunc|`BoundFunc`}  
         * to be called when the specified event is raised.    
         * @method
         * @param {(String)} EventName - One of the following events:  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Click|`Click`} - The StatusBar is clicked.  
         * 
         *       Ctrl_Click(GuiCtrlObj, Info)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#DoubleClick|`DoubleClick`} - The StatusBar is double-clicked.  
         * 
         *       Ctrl_DoubleClick(GuiCtrlObj, Info)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Ctrl-ContextMenu|`ContextMenu`} - The user right-clicks the StatusBar or presses  
         * Menu or Shift+F10 while the StatusBar has the keyboard focus.  
         * 
         *       Ctrl_ContextMenu(GuiCtrlObj, Item, RightClicked, X, Y)  
         * - Callback Params:
         *     - `GuiCtrlObj`: Reference to the StatusBar's object  
         *     - `Info`: The section number of the status bar clicked  
         *     - `Item`:   
         *     - `RightClicked`: Context menu activation  
         *       - `1` = Activated by right click  
         *       - `0` = Activated by `AppsKey` or `Shift+F10`  
         *     - `X` and `Y`: Check `RightClicked` param  
         *       - Right Clicked = Coords of mouse click  
         *       - Keyboard = Coords of the StatusBar's upper left corner  
         * @param {(String|FuncObj)} Callback - A function, method,  
         * or object that is called when the event is raised.  
         * A callback's first parameter is always the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm|`GuiControl`} that raised the event.  
         * @param {(Integer)} [AddRemove] - Adjust callback order or delete callback.  
         * - `1` = Add the callback after any previously registered callbacks.  
         * - `-1` = Add the callback before any previously registered callbacks.  
         * - `0` = Remove the callback.  
         * 
         * If multiple callbacks are registered, a callback that returns  
         * a non-empty string will stop all remaining callbacks from running.  
         * @returns {(String)} An empty string is always returned.  
         * @example <caption>  
         * </caption>
         */
        OnEvent(EventName, Callback [, AddRemove:=1]) => EmptyString
    }
    
    /**
     * @class
     */
    class Text extends Gui.Control {
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Events|`OnEvent()`} assigns a {@link https://www.autohotkey.com/docs/v2/Functions.htm|`Function`}
         * , {@link https://www.autohotkey.com/docs/v2/Concepts.htm#methods|`Method`}, {@link https://www.autohotkey.com/docs/v2/lib/Object.htm|`Object`}
         * , or {@link https://www.autohotkey.com/docs/v2/misc/Functor.htm#BoundFunc|`BoundFunc`}  
         * to be called when the specified event is raised.    
         * @method
         * @param {(String)} EventName - One of the following events:  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Click|`Click`} - The Text is clicked.  
         * 
         *       Ctrl_Click(GuiCtrlObj, Info)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#DoubleClick|`DoubleClick`} - The Text is double-clicked.  
         * 
         *       Ctrl_DoubleClick(GuiCtrlObj, Info)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Ctrl-ContextMenu|`ContextMenu`} - The user right-clicks the Text or presses  
         * Menu or Shift+F10 while the Text has the keyboard focus.  
         * 
         *       Ctrl_ContextMenu(GuiCtrlObj, Info, RightClicked, X, Y)  
         * - Callback Params:
         *     - `GuiCtrlObj`: Reference to the Text's object  
         *     - `Info`: Not used with Text controls  
         *     - `RightClicked`: Context menu activation  
         *       - `1` = Activated by right click  
         *       - `0` = Activated by `AppsKey` or `Shift+F10`  
         *     - `X` and `Y`: Check `RightClicked` param  
         *       - Right Clicked = Coords of mouse click  
         *       - Keyboard = Coords of the Text's upper left corner  
         * @param {(String|FuncObj)} Callback - A function, method,  
         * or object that is called when the event is raised.  
         * A callback's first parameter is always the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm|`GuiControl`} that raised the event.  
         * @param {(Integer)} [AddRemove] - Adjust callback order or delete callback.  
         * - `1` = Add the callback after any previously registered callbacks.  
         * - `-1` = Add the callback before any previously registered callbacks.  
         * - `0` = Remove the callback.  
         * 
         * If multiple callbacks are registered, a callback that returns  
         * a non-empty string will stop all remaining callbacks from running.  
         * @returns {(String)} An empty string is always returned.  
         * @example <caption>  
         * </caption>
         */
        OnEvent(EventName, Callback [, AddRemove:=1]) => EmptyString
    }
    
    /**
     * @class
     */
    class TreeView extends Gui.Control {
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Events|`OnEvent()`} assigns a {@link https://www.autohotkey.com/docs/v2/Functions.htm|`Function`}, 
         * {@link https://www.autohotkey.com/docs/v2/Concepts.htm#methods|`Method`},  
         * or {@link https://www.autohotkey.com/docs/v2/lib/Object.htm|`Object`} to be called when a specified event happens.  
         * @method
         * @param {(String)} EventName - One of the following event(s):  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Click|`Click`} - The TreeView is clicked.  
         *   
         *       TreeView_Click(GuiCtrlObj, ItemID)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#DoubleClick|`DoubleClick`} - The TreeView is double-clicked.  
         * 
         *       TreeView_DoubleClick(GuiCtrlObj, ItemID)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Ctrl-ContextMenu|`ContextMenu`} - The user right-clicks the TreeView or presses  
         *   Menu or Shift+F10 while the TreeView has the keyboard focus.  
         * 
         *       TreeView_ContextMenu(GuiCtrlObj, Item, RightClicked, X, Y)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Focus|`Focus`} - The TreeView gains the keyboard focus.  
         * 
         *       TreeView_Focus(GuiCtrlObj, Reserved)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#LoseFocus|`LoseFocus`} - The TreeView loses the keyboard focus.  
         * 
         *       TreeView_LoseFocus(GuiCtrlObj, Reserved)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#ItemCheck|`ItemCheck`} - The TreeView item is checked or unchecked.  
         * 
         *       TreeView_ItemCheck(GuiCtrlObj, ItemID, IsChecked)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#ItemEdit|`ItemEdit`} - The TreeView item's label is edited by the user.  
         *   The {@link https://www.autohotkey.com/docs/v2/lib/TreeView.htm#ReadOnly|`-ReadOnly` option} must be used to edit labels.  
         * 
         *       TreeView_ItemEdit(GuiCtrlObj, ItemID)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#ItemExpand|`ItemExpand`} - The TreeView item becomes expanded or collapsed.  
         * 
         *       TreeView_ItemExpand(GuiCtrlObj, ItemID, IsExpanded)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#ItemSelect|`ItemSelect`} - A TreeView item is selected or deselected.  
         * 
         *       TreeView_ItemSelect(GuiCtrlObj, ItemID)  
         * - Callback Params:  
         *     - `GuiCtrlObj`: Reference to the TreeView's object  
         *     - `ItemID`: Unique ID of that TreeView item  
         *     - `Item`: Item ID of clicked item or 0 if not over an item  
         *     - `IsChecked`:  
         *       - `1` = Item is checked  
         *       - `0` = Item is unchecked  
         *     _ `IsExpanded`:  
         *       - `1` = Item is set to expanded  
         *       - `0` = Item is set to collapsed  
         *     - `RightClicked`: Context menu activation  
         *       - `1` = Activated by right click  
         *       - `0` = Activated by `AppsKey` or `Shift+F10`  
         *     - `X` and `Y`: Check `RightClicked` param  
         *       - Right Clicked = Coords of mouse click  
         *       - Keyboard = Coords of the control's upper left corner  
         * @param {(String|FuncObj)} Callback - A function, method,  
         * or object that is called when the event is raised.  
         * A callback's first parameter is always the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm|`GuiControl`} that raised the event.  
         * @param {(Integer)} [AddRemove] - Adjust callback order or delete callback.  
         * - `1` = Add the callback after any previously registered callbacks.  
         * - `-1` = Add the callback before any previously registered callbacks.  
         * - `0` = Remove the callback.  
         * 
         * If multiple callbacks are registered, a callback that returns  
         * a non-empty string will stop all remaining callbacks from running.  
         * @returns {(String)} An empty string is always returned.  
         * @example <caption>  
         * </caption>
         */
        OnEvent(EventName, Callback [, AddRemove:=1]) => EmptyString

    }
    
    /**
     * @class
     */
    class UpDown extends Gui.Control {
        /**
         * {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Events|`OnEvent()`} assigns a {@link https://www.autohotkey.com/docs/v2/Functions.htm|`Function`}
         * , {@link https://www.autohotkey.com/docs/v2/Concepts.htm#methods|`Method`}, {@link https://www.autohotkey.com/docs/v2/lib/Object.htm|`Object`}
         * , or {@link https://www.autohotkey.com/docs/v2/misc/Functor.htm#BoundFunc|`BoundFunc`}  
         * to be called when the specified event is raised.    
         * @method
         * @param {(String)} EventName - One of the following events:  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Change|`Change`} - The UpDown's value changes.  
         * 
         *       Ctrl_Change(GuiCtrlObj, Info)  
         * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Ctrl-ContextMenu|`ContextMenu`} - The user right-clicks the UpDown or presses  
         * Menu or Shift+F10 while the UpDown has the keyboard focus.  
         * 
         *       Ctrl_ContextMenu(GuiCtrlObj, Info, RightClicked, X, Y)  
         * - Callback Params:
         *     - `GuiCtrlObj`: Reference to the ListView's object  
         *     - `Info`: Not used with UpDown controls  
         *     - `RightClicked`: Context menu activation  
         *       - `1` = Activated by right click  
         *       - `0` = Activated by `AppsKey` or `Shift+F10`  
         *     - `X` and `Y`: Check `RightClicked` param  
         *       - Right Clicked = Coords of mouse click  
         *       - Keyboard = Coords of the UpDown's upper left corner  
         * @param {(String|FuncObj)} Callback - A function, method,  
         * or object that is called when the event is raised.  
         * A callback's first parameter is always the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm|`GuiControl`} that raised the event.  
         * @param {(Integer)} [AddRemove] - Adjust callback order or delete callback.  
         * - `1` = Add the callback after any previously registered callbacks.  
         * - `-1` = Add the callback before any previously registered callbacks.  
         * - `0` = Remove the callback.  
         * 
         * If multiple callbacks are registered, a callback that returns  
         * a non-empty string will stop all remaining callbacks from running.  
         * @returns {(String)} An empty string is always returned.  
         * @example <caption>  
         * </caption>
         */
        OnEvent(EventName, Callback [, AddRemove:=1]) => EmptyString
    }
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#BackColor|`BackColor`} retrieves or sets the background color of the window.  
     * When setting backcolor, a string or number can be used:
     *   - Hex value: String or number. `0x000000` to `0xFFFFFF`.  
     *     If value is a string, the 0x prefix is optional.  
     *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Color name`}: `Black`, `Silver`, `Gray`, `White`, `Maroon`, `Red`, `Purple`, `Fuchsia`, `Green`, `Lime`, `Olive`, `Yellow`, `Navy`, `Blue`, `Teal`, `Aqua`
     *   - Default color: The word `default` or an empty string.  
     * When retrieving backcolor, a string containing the hex value of the current color is returned.  
     * To set the color of a {@link https://www.autohotkey.com/docs/v2/lib/Menu.htm|`menu bars`}, use its {@link https://www.autohotkey.com/docs/v2/lib/Menu.htm#SetColor|`SetColor()`} method.  
     * @property
     * @type {(Number|String)}
     * @example <caption>  
     * Changing background color with Drop Down List of colors.</caption>
     * color_list := ['Default', 'Red','Yellow','Green','Cyan','Blue','Magenta']
     * goo := Gui()
     * goo.ddl := goo.AddDDL('xm ym Choose1', color_list)
     * goo.ddl.OnEvent('Change', color_change)
     * goo.Show('w200 h100')
     * 
     * color_change(con, info) {
     *     color_map := Map('Red' ,0xFF0000 ,'Yellow',0xFFFF00 ,'Green',0xFF00
     *                     ,'Cyan',0xFFFF   ,'Magenta',0xFF00FF,'Blue',0xFF )
     *     color_map.Default := 'Default'
     *     con.gui.BackColor := color_map[con.Text]
     * }
     */
    BackColor => String
        
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#FocusedCtrl|`FocusedCtrl`} retrieves the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm|`GuiControl object`} of the Gui's focused control.  
     * If the window is minimized or hidden, this property may not be effective.  
     * @property
     * @type {(GuiControl)}
     * @example <caption>  
     * Focusing a specific control.</caption>
     * goo := Gui()
     * goo.btn_exit := goo.AddButton('xm ym w100', 'Exit Script')
     * goo.btn_exit.OnEvent('Click', (*) => ExitApp())
     * goo.btn_msg := goo.AddButton('xm w100', 'PopUp Msg')
     * goo.btn_msg.OnEvent('Click', (*) => MsgBox('Pop Up!'))
     * goo.btn_exit.Focus()
     * txt := 'Even though "PopUp Msg" was added last, the '
     *     . '`nFocused button was set to "' goo.FocusedCtrl.Text '"'
     * goo.AddText('xm', txt)
     * goo.Show('y200')
     */
    FocusedCtrl => Integer
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Hwnd|`Hwnd`} retrieves the window handle (HWND) of the GUI window.  
     * @property
     * @type {(Integer)}
     * @example <caption>  
     * A GUI that can be hidden and shown with F1.</caption>
     * *F1::toggle_gui()
     * 
     * toggle_gui()
     * 
     * toggle_gui() {
     *     static gu := make_gui()
     *     if WinExist('ahk_id ' goo.hwnd)
     *         goo.Hide()
     *     else goo.Show()
     *     return
     *     
     *     make_gui() {
     *         goo := Gui()
     *         goo.AddText('xm ym w150', 'Press F1 to hide/show GUI.')
     *         goo.btn_exit := goo.AddButton('xm w150', 'Click to close Script')
     *         goo.btn_exit.OnEvent('Click', (*) => ExitApp())
     *         return gu
     *     }
     * }
     */
    Hwnd => Integer
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginX|`MarginX`} retrieves or sets the size of horizontal margins between sides and subsequently created controls.  
     * @property
     * @type {(Integer)}
     * @example <caption>  
     * Showing how margin settings affect padding.</caption>
     * goo := Gui()
     * goo.MarginX := 20
     * goo.MarginY := 20
     * loop 9
     *     if Mod(A_Index-1, 3)
     *         goo.AddButton('x+m w100', 'Button ' A_Index)
     *     else goo.AddButton('xm y+m w100', 'Button ' A_Index)
     * goo.Show()
     */
    MarginX => Integer
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginY|`MarginY`} retrieves or sets the size of vertical margins between sides and subsequently created controls.  
     * @property
     * @type {(Integer)}
     * @example <caption>  
     * Showing how margin settings affect padding.</caption>
     * goo := Gui()
     * goo.MarginX := 20
     * goo.MarginY := 20
     * loop 9
     *     if Mod(A_Index-1, 3)
     *         goo.AddButton('x+m w100', 'Button ' A_Index)
     *     else goo.AddButton('xm y+m w100', 'Button ' A_Index)
     * goo.Show()
     */
    MarginY => Integer
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MenuBar|`MenuBar`} retrieves or sets the window's menu bar.  
     * @property
     * @type {(MenuBar)}
     * @example <caption>  
     * Creating a custom GUI menu.</caption>
     * make_gui()
     * 
     * make_gui() {
     *     static goo := Gui()
     *     goo.edit := goo.AddEdit('xm ym r50 w500 -Wrap +HScroll')
     *     
     *     m_file := Menu()
     *     m_file.Add('&Open', get_file)
     *     m_file.Add()
     *     m_file.Add('E&xit', (*) => ExitApp())
     *     
     *     m_about := Menu()
     *     m_about.Add('&Website', (*) => Run('https://www.autohotkey.com'))
     *     m_about.Add('&Docs', (*) => Run('https://www.autohotkey.com/docs/v2/'))
     *     m_about.Add('&Version', (*) => MsgBox('AHK Version ' A_AhkVersion))
     *     
     *     gu_menu := MenuBar()
     *     gu_menu.Add('&File', m_file)
     *     gu_menu.Add('&About', m_about)
     *     
     *     goo.MenuBar := gu_menu
     *     
     *     goo.Show('AutoSize')
     *     return
     *     
     *     get_file(name, pos, control) {
     *         path := FileSelect(,,,'*.txt')
     *         if FileExist(path)
     *             goo.edit.Value := FileRead(path)
     *     }
     * }
     */
    MenuBar => MenuBar
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Name|`Name`} retrieves or sets a custom name for the GUI window.  
     * @property
     * @type {(String)}
     * @example <caption>  
     * Setting and retrieving a GUI name.</caption>
     * goo := Gui()
     * goo.Name := 'Main'
     * goo.Show('w500 h200')
     * MsgBox('Gui name is: ' goo.Name)
     */
    Name => String
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Title|`Title`} retrieves or sets the GUI's title.  
     * @property
     * @type {(String)}
     * @example <caption>  
     * Make an edit box that lets you change the GUI title.</caption>
     * goo := Gui()
     * goo.AddText('xm ym w400', 'Enter text to change window title:')
     * goo.Edit := goo.AddEdit('xm w400 r1 +BackgroundBlack')
     * goo.Edit.SetFont('s10 cWhite' ,'Courier New')
     * goo.Edit.OnEvent('Change', update_title)
     * goo.Show('AutoSize')
     *
     * update_title(con, info) {
     *     if (con.Value = '')
     *         con.gui.title := A_ScriptName
     *     else con.gui.title := con.Value
     * }
     */
    Title => String
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#__Item|`__Item`} is the name of  the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm|`GuiControl object`} associated with the specified {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Name|`name`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Text|`text`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#ClassNN|`ClassNN`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Hwnd|`HWND`}.  
     * @property
     * @type {(GuiControl)}
     */
    __Item[Name] => Gui.Control
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm|`GUI`} creates a new Gui object.  
     * @method
     * @param {(String)} [Options] - Zero or more Gui options, separated by spaces and/or tabs.  
     * For best performance, set all options in 1 call and do so before the window is created.  
     * Use `-` before an option to remove it or `+` to add it. Using no sign is the same as using `+`.  
     * - `AlwaysOnTop`: Makes the window stay on top of all other windows. Same effect as {@link https://www.autohotkey.com/docs/v2/lib/WinSetAlwaysOnTop.htm|`WinSetAlwaysOnTop`}.  
     * - `Border`: Provides a thin-line border around the window.  
     * - `Caption`: Include the standard title bar and a thick window border/edge. If using {@link https://www.autohotkey.com/docs/v2/lib/WinSetTransColor.htm|`WinSetTransColor`}, remove Caption only after setting the TransColor.  
     * - `Disabled`: Disables the window, which prevents the user from interacting with its controls. This is often used on a window that owns other windows (see {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Owner|`Owner`}).  
     * - `DPIScale`: If DPI scaling is enabled, coordinates and sizes passed to or retrieved from the Gui and GuiControl methods/properties are automatically scaled based on screen DPI.  
     *   {@link https://www.autohotkey.com/docs/v2/Variables.htm#ScreenDPI|`A_ScreenDPI`} contains the system's current DPI.  
     *   DPI scaling only applies to the Gui and GuiControl methods/properties, so coordinates coming directly from other sources such as ControlGetPos or WinGetPos will not work.  
     * - `LastFound`: Sets the window to {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#LastFoundWindow|`last found window`}. This is done automatically in a GUI thread to allow functions such as {@link https://www.autohotkey.com/docs/v2/lib/WinGetStyle.htm|`WinGetStyle`} and {@link https://www.autohotkey.com/docs/v2/lib/WinSetTransparent.htm|`WinSetTransparent`} to operate on it even if it is hidden.  
     * - `MaximizeBox`: Enables the maximize button in the title bar. This is included when the Resize option is used.  
     * - `MinimizeBox`: Enables the minimize button in the title bar.  
     * - `MaxSize` or `MinSize`: Set, adjust, or remove the minimum/maximum size of the client area of the window, such as when the user drags its edges to resize it.  
     *   `+MaxSize`/`+MinSize` uses the current window size as the maximum/minimum.  
     *   Alternatively, `+MaxSize640x480`/`+MinSize640x480` would set the max/min size to 640 pixels wide by 480 pixels tall and the width or height may be omitted, though the `x` separator must always be present.  
     * - `OwnDialogs`: Should be specified in each thread for which subsequently displayed MsgBox, InputBox, FileSelect, and DirSelect dialogs should be owned by the window.  
     *   These dialogs become modal, meaning that the user cannot interact with the Gui until the dialog box is dismissed.  
     *   ToolTip cannot become modal even though they become owned. Instead, they wilstay always on top of the owner.  
     * - `Owner`: Causes the window to be owned by another. Include the handle (HWND) to another window after the word owner to make the Gui owned by that Window.  
     *   Omitting a handle (HWND) will make the Gui owned by the script's main window.  
     * - `Parent`: Use `+Parent` immediately followed by the handle (HWND) of any window or control to use it as the parent of this window while `-Parent` will revert it back to a top-level window.  
     * - `Resize`: Makes the window resizable and enables its maximize button in the title bar. The maximize button can be removed with `-MaximizeBox`.  
     * - `SysMenu`: Adds or removes the system menu and icon in the window's upper left corner. This includes the minimize, maximize, and close buttons in the title bar.  
     * - `Theme`: If `-Theme` is used, all subsequently created controls in the window will have the Classic Theme appearance.  
     *   Theme can also be used in a control's options during its creation such as `g.AddButton('-Theme')`.  
     * - `ToolWindow`: Provides a narrower title bar, removes the taskbar button, and hides both the maximize and minimize buttons.  
     * - `0x0` Unnamed Style: Specify a plus or minus sign followed immediately by a decimal or hexadecimal style number.  
     * - `E0x0` Unnamed ExStyle: Specify a plus or minus sign followed immediately by the letter E and a decimal or hexadecimal extended style number. For styles not {@link https://www.autohotkey.com/docs/v2/misc/Styles.htm|`documented here`}, see {@link https://learn.microsoft.com/windows/win32/winmsg/extended-window-styles|`Extended Window Styles | Microsoft Docs`} for a complete list.  
     * @param {(String)} [Title] - The window title. If omitted, it defaults to the current value of {@link https://www.autohotkey.com/docs/v2/Variables.htm#ScriptName|`A_ScriptName`}.  
     * @param {(Object)} [EventObj] - An "event sink", or object to bind events to.  
     * If EventObj is specified, {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm|`OnEvent()`}
     * , {@link https://www.autohotkey.com/docs/v2/lib/GuiOnNotify.htm|`OnNotify`}
     * , and {@link https://www.autohotkey.com/docs/v2/lib/GuiOnCommand.htm|`OnCommand`}
     * can be used to register methods of EventObj to be called when an event is raised.  
     * If omitted or empty, any string passed to OnEvent's Function parameter is interpreted as a function name.
     * @returns {(Gui)} New gui object  
     * @example <caption>  
     * Basic GUI example.</caption>
     * goo := Gui()
     * goo.btn_exit := goo.AddButton('xm ym w100', 'Exit Script')
     * goo.btn_exit.OnEvent('Click', (*) => ExitApp())
     * goo.Show('AutoSize')
     */
    Static Call([Options:='', Title:=A_ScriptName, EventObj:=Unset]) => Gui
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Add|`Add()`} creates and adds a control to the Gui, such as text, a button, or a checkbox.  
     * Each control type has it's own `AddType()` function such as `AddButton()` or `AddText()`.
     * @method
     * @param {(String)} ControlType - One of the following control types:  
     * - {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#ActiveX|`ActiveX`}
     * - {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Button|`Button`}
     * - {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Checkbox|`Checkbox`}
     * - {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#ComboBox|`ComboBox`}
     * - {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Custom|`Custom`}  
     * - {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#DateTime|`DateTime`}
     * - {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#DropDownList|`DDL`} / {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#DropDownList|`DropDownList`}
     * - {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Edit|`Edit`}
     * - {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#GroupBox|`GroupBox`}  
     * - {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Hotkey|`Hotkey`}
     * - {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Link|`Link`}
     * - {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#ListBox|`ListBox`}
     * - {@link https://www.autohotkey.com/docs/v2/lib/ListView.htm|`ListView`}
     * - {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#MonthCal|`MonthCal`}  
     * - {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Picture|`Pic`} / {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Picture|`Picture`}
     * - {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Progress|`Progress`}
     * - {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Radio|`Radio`}
     * - {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Slider|`Slider`}  
     * - {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#StatusBar|`StatusBar`}
     * - {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Tab|`Tab`} / {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Tab|`Tab2`} / {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Tab|`Tab3`}
     * - {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Text|`Text`}  
     * - {@link https://www.autohotkey.com/docs/v2/lib/TreeView.htm|`TreeView`}  
     * - {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#UpDown|`UpDown`}  
     * @param {(String)} Options - Any {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#OtherOptions|`general`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm|`control-specific`} options, separated by spaces/tabs.  
     * **Positioning and Sizing of Controls**  
     * - `R#`: Rows of text where `#` is the number of rows. This number can be a float.  
     *   `R` takes precedence over `H`.  
     *   For a {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#GroupBox|`GroupBox`}, this is the number of controls to reserve space for inside the box.  
     *   For a {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#DropDownList|`DropDownList`}  
     *   , {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#ComboBox|`ComboBox`}
     *   , and {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#ListBox|`ListBox`}
     *   , R sets number of items visible in control's list portion.  
     * - `W#`: Width of control where `#` is a number of pixels.  
     *   If omitted, default values are:  
     *   - Tab: Current font size x30 plus the current {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginX|`MarginX`} x3.  
     *   - Progress Bar (vertical): Current font size x2
     *   - Progress Bar (horizontal), Sliders (horizontal), DropDownLists/DDls,  
     *     ComboBoxes, ListBoxes, GroupBoxes, Edits, and Hotkeys: Current font size x15
     *   - GroupBoxes: Current font size x18
     *   - All others: Width is calculated automatically.  
     * - `H#`: Height of control where `#` is a number of pixels.  
     *   Defaults if `H` and `R` are omitted:  
     *   - DropDownList/DDL, ComboBoxes, ListBoxes, and Edit (multi-line and empty): 3 rows
     *   - GroupBoxes: 2 rows
     *   - Sliders (vertical), Progress Bars: 5 rows
     *   - Sliders (horizontal): 30px
     *   - Progress Bars (horizontal): Current font size x2
     *   - Hotkey: 1 row
     *   - Tab1/2/3: 10 rows
     *   - All others:  Height is calculated automatically.  
     * - `WP+#` or `HP+#`: Use previous control's width `WP` or height `HP`.  
     *   Width or height can be adjusted by adding `+#` or `-#` where `#` is a number of pixels.  
     * - `X#` or `Y#`: Static `X` or `Y` coordinates where `#` is the pixel location on the Gui.  
     * - `X+#` or `Y+#`: Use the right edge `X+#` or bottom edge `Y+#` of the previous control as a start point.  
     *   The position can be offset with `+#` or `-#` where `#` is a number of pixels.  
     * - `XP+#` or `YP+#`: Use the left edge `XP+#` or top edge `YP+#` of the previous control as a start point.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     *   Useful for aligning controls in a {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#GroupBox|`GroupBox`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Tab|`Tab`}.  
     * - `XM+#` or `YM+#`: Use Gui {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginX|`left margin (MarginX)`} or {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginY|`top margin (MarginY)`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     * - `XS+#` or `YS+#`: Use the left edge `XS` or top edge `YS` of the last control marked as a {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Section|`Section`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     * 
     * **Common Styles and Other Options**  
     * Prefix with `-` to disable an option and `+` (or no sign) to add an option.  
     * - `Vstring`: Assign a {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Name|`Name`} to a control where `string` is the new name.  
     *   A control's name can be used to get a reference to that control from a GUI object.  
     *
     *         GuiControl.Opt('+VMyControl')  
     *         GuiControl := Gui['MyControl']  
     * - `Events`: Handled by the control's {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm|`OnEvent()` method}.  
     * - `AltSubmit`: Use control's alternate submit method.  
     *   DropDownList, ComboBox, ListBox, Tab: {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Submit|`Gui.Submit`} uses selected item's position instead of its text.  
     *   ComboBox: If no item is selected, the text of the edit field is stored.  
     * - `C#`: Set text color where `#` is one of the following:  
     *   - RGB hex value (0x prefix is optional): `C0x000000` to `CFFffFF`  
     *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}: `CBlack`, `CSilver`, `CGray`, `CWhite`, `CMaroon`, `CRed`, `CPurple`  
     *     `CFuchsia`, `CGreen`, `CLime`, `COlive`, `CYellow`, `CNavy`, `CBlue`, `CTeal`, `CAqua`  
     *   - Reset/Default: `CDefault` or `C`  
     *   The color option does not affect {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Button|`buttons`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#StatusBar|`status bars`}.  
     * - `Disabled`: Disables the control preventing user focus or modifications of the contents.  
     *   Control can be enabled using `-Disabled` or setting {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Enabled`} to true.  
     *   A `0` for enabled or `1` for disabled can immediately follow `Disabled`.  
     *
     *       con.Opt('+Disabled0')
     *       var := 1, con.Opt('+Disabled' var)
     * - `Hidden`: The control is initially invisible.  
     *   Use `-Hidden` or {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Visible`} to unhide it.  
     *   A `0` for visible or `1` for hidden can immediately follow `Hidden`.  
     * 
     *       con.Opt('+Hidden0')
     *       var := 1, con.Opt('+Hidden' var)
     * - `Left`: Left-justifies the control's text within its available width.  
     *   Applies to: {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Button|`Button`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Checkbox|`Checkbox`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#DateTime|`DateTime`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Edit|`Edit`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#GroupBox|`GroupBox`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Radio|`Radio`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Slider|`Slider`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Tab|`Tab`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Tab|`Tab2`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Text|`Text`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#UpDown|`UpDown`}
     * - `Right`: Right-justifies the control's text within its available width.  
     *   For {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Checkbox|`Checkbox`} and {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Radio|`Radio Buttons`}, this also moves the box from the left side to the right.  
     *   Applies to: {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Button|`Button`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Checkbox|`Checkbox`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#DateTime|`DateTime`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Edit|`Edit`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#GroupBox|`GroupBox`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Link|`Link`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Radio|`Radio`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Slider|`Slider`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Tab|`Tab`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Tab|`Tab2`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Text|`Text`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#UpDown|`UpDown`}
     * - `Center`: Centers the control's text within its available width.  
     *   Applies to: {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Button|`Button`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Checkbox|`Checkbox`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Edit|`Edit`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#GroupBox|`GroupBox`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Radio|`Radio`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Slider|`Slider`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Text|`Text`}
     * - `Section`: Sets current control as the new Section for use with the {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#xs|`XS` and `YS`} positioning options.  
     * - `Tabstop`: Disabling Tabstop of a control prevents the user from tabbing to that control.  
     * - `Wrap`: Enables word-wrapping of the control's contents within its available width.  
     *   This is enabled by default for almost all controls.  
     * - `VScroll`: Provide or remove a vertical scroll bar if appropriate for this type of control.  
     * - `HScroll`: Provide or remove a horizontal scroll bar if appropriate for this type of control.  
     *   Note about {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#ListBox|`ListBoxes`}: Horizontal scrolling width defaults to 3 times the ListBox's width.  
     *   To specify a different scrolling width, include a number immediately after the word HScroll.  
     *  
     * **Uncommon Styles and Options**
     * - `BackgroundTrans`: Uses a transparent background, which allows any control that lies behind  
     *   a Text, Picture, or GroupBox control to show through.  
     *   Use GuiCtrl.Opt("+Background") to remove this option later.  
     *   An error is thrown if a control type does not support this option.  
     *   Known limitation: BackgroundTrans might not work in a Tab control that contains a ListView.  
     * - `Background#`: Sets control background color where `#` is one of the following:  
     *   - RGB hex value (0x prefix is optional): `000000` to `0xFFffFf`
     *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}: `Black`, `Silver`, `Gray`, `White`, `Maroon`, `Red`, `Purple`  
     *   `Fuchsia`, `Green`, `Lime`, `Olive`, `Yellow`, `Navy`, `Blue`, `Teal`, `Aqua`  
     *   - Reset/Default: `BackgroundDefault` or `-Background`  
     * - `Border`: Provides a thin-line border around the control. Adding a border to an  
     *   existing control might require increasing the control's width and height by 1 pixel.  
     * - `Redraw`: Enable/disable redrawing (visual updates) of a control (Uses: {@link https://learn.microsoft.com/en-us/windows/win32/gdi/wm-setredraw|`WM_SETREDRAW`}).  
     *   Disabling redraw `-Redraw` prior to adding multiple controls/elements can increase performance.  
     *   Enable redraw `+Redraw` after all changes have been made.  
     * - `Theme`: Used to override the window's current theme setting for the newly created control.  
     *   This setting has no effect when used on an existing control. See {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Theme|`GUI's +/-Theme option`} for details.  
     * - {@link https://www.autohotkey.com/docs/v2/misc/Styles.htm|`Style Number`} `+0x0`: Specify a plus or minus sign  
     *   followed immediately by a decimal or hexadecimal style number.  
     * - {@link https://learn.microsoft.com/en-us/windows/win32/winmsg/extended-window-styles|`ExStyle Number`} `+E0x0`: Specify a plus or minus sign  
     *   followed immediately by the letter E and a decimal or hexadecimal extended style number.  
     * @param {(String|Number|Array)} [ControlSpecific] - Control specific setting.  
     * @returns {(GuiControl)} GuiControl Object
     * @example <caption>  
     * Adding an exit button to a GUI.</caption>
     * goo := Gui()
     * btn := goo.Add('Button', 'xm ym w100', 'Exit Script')
     * btn.OnEvent('Click', (*) => ExitApp())
     * goo.Show('AutoSize')
     */
    Add(ControlType [, Options:='', ControlSpecific:=Unset]) => Gui.Control
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Add|`AddActiveX()`} adds an ActiveX control to the Gui.  
     * When the control is created, the ActiveX object can be retrieved via GuiCtrl.Value
     * @method
     * @param {(String)} Options - Any {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#OtherOptions|`general`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm|`control-specific`} options, separated by spaces/tabs.  
     * **Positioning and Sizing of Controls**  
     * - `R#`: Rows of text where `#` is the number of rows. This number can be a float.  
     *   `R` takes precedence over `H`.  
     * - `W#`: Width of control where `#` is a number of pixels.  
     * - `H#`: Height of control where `#` is a number of pixels.  
     * - `WP+#` or `HP+#`: Use previous control's width `WP` or height `HP`.  
     *   Width or height can be adjusted by adding `+#` or `-#` where `#` is a number of pixels.  
     * - `X#` or `Y#`: Static `X` or `Y` coordinates where `#` is the pixel location on the Gui.  
     * - `X+#` or `Y+#`: Use the right edge `X+#` or bottom edge `Y+#` of the previous control as a start point.  
     *   The position can be offset with `+#` or `-#` where `#` is a number of pixels.  
     * - `XP+#` or `YP+#`: Use the left edge `XP+#` or top edge `YP+#` of the previous control as a start point.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     *   Useful for aligning controls in a {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#GroupBox|`GroupBox`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Tab|`Tab`}.  
     * - `XM+#` or `YM+#`: Use Gui {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginX|`left margin (MarginX)`} or {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginY|`top margin (MarginY)`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     * - `XS+#` or `YS+#`: Use the left edge `XS` or top edge `YS` of the last control marked as a {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Section|`Section`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     * 
     * **Common Styles and Other Options**  
     * Prefix with `-` to disable an option and `+` (or no sign) to add an option.  
     * - `Vstring`: Assign a {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Name|`Name`} to a control where `string` is the new name.  
     *   A control's name can be used to get a reference to that control from a GUI object.  
     *
     *         GuiControl.Opt('+VMyControl')  
     *         GuiControl := Gui['MyControl']  
     * - `Events`: Handled by the control's {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm|`OnEvent()` method}.  
     * - `Disabled`: Disables the control preventing user focus or modifications of the contents.  
     *   Control can be enabled using `-Disabled` or setting {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Enabled`} to true.  
     *   A `0` for enabled or `1` for disabled can immediately follow `Disabled`.  
     *
     *       con.Opt('+Disabled0')
     *       var := 1, con.Opt('+Disabled' var)
     * - `Hidden`: The control is initially invisible.  
     *   Use `-Hidden` or {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Visible`} to unhide it.  
     *   A `0` for visible or `1` for hidden can immediately follow `Hidden`.  
     * 
     *       con.Opt('+Hidden0')
     *       var := 1, con.Opt('+Hidden' var)
     * - `Section`: Sets current control as the new Section for use with the {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#xs|`XS` and `YS`} positioning options.  
     * - `Tabstop`: Disabling Tabstop of a control prevents the user from tabbing to that control.  
     * - `VScroll`: Provide or remove a vertical scroll bar if appropriate for this type of control.  
     * - `HScroll`: Provide or remove a horizontal scroll bar if appropriate for this type of control.  
     *  
     * **Uncommon Styles and Options**
     * - `Border`: Provides a thin-line border around the control. Adding a border to an  
     *   existing control might require increasing the control's width and height by 1 pixel.  
     * - `Redraw`: Enable/disable redrawing (visual updates) of a control (Uses: {@link https://learn.microsoft.com/en-us/windows/win32/gdi/wm-setredraw|`WM_SETREDRAW`}).  
     *   Disabling redraw `-Redraw` prior to adding multiple controls/elements can increase performance.  
     *   Enable redraw `+Redraw` after all changes have been made.  
     * - `Theme`: Used to override the window's current theme setting for the newly created control.  
     *   This setting has no effect when used on an existing control. See {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Theme|`GUI's +/-Theme option`} for details.  
     * - {@link https://www.autohotkey.com/docs/v2/misc/Styles.htm|`Style Number`} `+0x0`: Specify a plus or minus sign  
     *   followed immediately by a decimal or hexadecimal style number.  
     * - {@link https://learn.microsoft.com/en-us/windows/win32/winmsg/extended-window-styles|`ExStyle Number`} `+E0x0`: Specify a plus or minus sign  
     *   followed immediately by the letter E and a decimal or hexadecimal extended style number.  
     * @param {(String)} [ActiveXName] - The ActiveX component name to add.
     * @returns {(Gui.ActiveX)} ActiveX Control Object
     * @see {@link https://learn.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa752085(v=vs.85)|`WebBrowser Object`}
     * @example <caption>  
     * Adding an ActiveX control to a GUI.</caption>
     * goo := Gui()
     * goo.MarginX := goo.MarginY := 0
     * goo.web := goo.AddActiveX("x0 y0 w1024 h768", "Shell.Explorer")
     * ; The ActiveX object is stored in the 'value' property
     * goo.web.value.Navigate("https://www.autohotkey.com/docs/v2/index.htm")
     * goo.Show()
     */
    AddActiveX([Options:='', ActiveXName:=Unset]) => Gui.ActiveX
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Add|`AddButton()`} adds a push button, which can be pressed to trigger an action.  
     * @method
     * @param {(String)} Options - Any {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#OtherOptions|`general`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm|`control-specific`} options, separated by spaces or tabs.  
     * **Positioning and Sizing of Controls**  
     * - `R#`: Rows of text where `#` is the number of rows. This number can be a float.  
     *   `R` takes precedence over `H`.  
     * - `W#`: Width of control where `#` is a number of pixels.  
     * - `H#`: Height of control where `#` is a number of pixels.  
     * - `WP+#` or `HP+#`: Use previous control's width `WP` or height `HP`.  
     *   Width or height can be adjusted by adding `+#` or `-#` where `#` is a number of pixels.  
     * - `X#` or `Y#`: Static `X` or `Y` coordinates where `#` is the pixel location on the Gui.  
     * - `X+#` or `Y+#`: Use the right edge `X+#` or bottom edge `Y+#` of the previous control as a start point.  
     *   The position can be offset with `+#` or `-#` where `#` is a number of pixels.  
     * - `XP+#` or `YP+#`: Use the left edge `XP+#` or top edge `YP+#` of the previous control as a start point.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     *   Useful for aligning controls in a {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#GroupBox|`GroupBox`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Tab|`Tab`}.  
     * - `XM+#` or `YM+#`: Use Gui {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginX|`left margin (MarginX)`} or {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginY|`top margin (MarginY)`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     * - `XS+#` or `YS+#`: Use the left edge `XS` or top edge `YS` of the last control marked as a {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Section|`Section`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     * 
     * **Common Styles and Other Options**  
     * Prefix with `-` to disable an option and `+` (or no sign) to add an option.  
     * - `Vstring`: Assign a {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Name|`Name`} to a control where `string` is the new name.  
     *   A control's name can be used to get a reference to that control from a GUI object.  
     *
     *         GuiControl.Opt('+VMyControl')  
     *         GuiControl := Gui['MyControl']  
     * - `Events`: Handled by the control's {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm|`OnEvent()` method}.  
     * - `Disabled`: Disables the control preventing user focus or modifications of the contents.  
     *   Control can be enabled using `-Disabled` or setting {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Enabled`} to true.  
     *   A `0` for enabled or `1` for disabled can immediately follow `Disabled`.  
     *
     *       con.Opt('+Disabled0')
     *       var := 1, con.Opt('+Disabled' var)
     * - `Hidden`: The control is initially invisible.  
     *   Use `-Hidden` or {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Visible`} to unhide it.  
     *   A `0` for visible or `1` for hidden can immediately follow `Hidden`.  
     * 
     *       con.Opt('+Hidden0')
     *       var := 1, con.Opt('+Hidden' var)
     * - `Left`: Left-justifies the control's text within its available width.  
     * - `Right`: Right-justifies the control's text within its available width.  
     * - `Center`: Centers the control's text within its available width.  
     * - `Section`: Sets current control as the new Section for use with the {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#xs|`XS` and `YS`} positioning options.  
     * - `Tabstop`: Disabling Tabstop of a control prevents the user from tabbing to that control.  
     * - `Wrap`: Enables word-wrapping of the control's contents within its available width.  
     * - `VScroll`: Provide or remove a vertical scroll bar if appropriate for this type of control.  
     * - `HScroll`: Provide or remove a horizontal scroll bar if appropriate for this type of control.  
     *  
     * **Uncommon Styles and Options**
     * - `Background#`: Sets control background color where `#` is one of the following:  
     *   - RGB hex value (0x prefix is optional): `000000` to `0xFFffFf`
     *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}: `Black`, `Silver`, `Gray`, `White`, `Maroon`, `Red`, `Purple`  
     *   `Fuchsia`, `Green`, `Lime`, `Olive`, `Yellow`, `Navy`, `Blue`, `Teal`, `Aqua`  
     *   - Reset/Default: `BackgroundDefault` or `-Background`  
     * - `Border`: Provides a thin-line border around the control. Adding a border to an  
     *   existing control might require increasing the control's width and height by 1 pixel.  
     * - `Redraw`: Enable/disable redrawing (visual updates) of a control (Uses: {@link https://learn.microsoft.com/en-us/windows/win32/gdi/wm-setredraw|`WM_SETREDRAW`}).  
     *   Disabling redraw `-Redraw` prior to adding multiple controls/elements can increase performance.  
     *   Enable redraw `+Redraw` after all changes have been made.  
     * - `Theme`: Used to override the window's current theme setting for the newly created control.  
     *   This setting has no effect when used on an existing control. See {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Theme|`GUI's +/-Theme option`} for details.  
     * - {@link https://www.autohotkey.com/docs/v2/misc/Styles.htm|`Style Number`} `+0x0`: Specify a plus or minus sign  
     *   followed immediately by a decimal or hexadecimal style number.  
     * - {@link https://learn.microsoft.com/en-us/windows/win32/winmsg/extended-window-styles|`ExStyle Number`} `+E0x0`: Specify a plus or minus sign  
     *   followed immediately by the letter E and a decimal or hexadecimal extended style number.  
     * @param {(String)} [BtnText] - Text on buttons can include new lines `` `n ``.  
     * An ampersand `&` before a letter in the text causes `Alt` plus that letter to become a shortcut.  
     * To include a literal ampersand, use 2 ampersands in a row `&&`.
     * @returns {(Gui.Button)} Button Control Object
     * @example <caption>  
     * Adding an exit button to a GUI.</caption>
     * goo := Gui()
     * goo.btn_exit := goo.AddButton('xm ym w100 h40', 'Exit`nScript')
     * goo.btn_exit.OnEvent('Click', (*) => ExitApp())
     * goo.Show('AutoSize')
     */
    AddButton([Options:='', BtnText:='']) => Gui.Button
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Add|`AddCheckbox()`} adds a Checkbox control that can be  
     * checked or unchecked to represent a toggleable state.  
     * If the {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#CheckBox|`Check3`} option is used, checkboxes have a 3rd "graycheck" state.
     * @method
     * @param {(String)} Options - Any {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#OtherOptions|`general`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm|`control-specific`} options, separated by spaces/tabs.  
     * **Control Specific Options**  
     * - `Check3`: Adds a 3rd "indeterminate" gray checkmark state to the checkbox.  
     *   This can be used to indidcate the checkbox has neither been checked or unchecked.  
     * - `Checked` or `CheckedGray`: Starts the checkbox checked or checked grey/indeterminate.  
     *   `Checked` may also be followed by a 0 (unchecked), 1 (checked), or -1 (gray checked).  
     *  
     *       goo.AddCheckBox('+Checked0')
     *       var := 1, goo.AddCheckBox('+Checked' var)
     * **Positioning and Sizing of Controls**  
     * - `R#`: Rows of text where `#` is the number of rows. This number can be a float.  
     *   `R` takes precedence over `H`.  
     * - `W#`: Width of control where `#` is a number of pixels.  
     * - `H#`: Height of control where `#` is a number of pixels.  
     * - `WP+#` or `HP+#`: Use previous control's width `WP` or height `HP`.  
     *   Width or height can be adjusted by adding `+#` or `-#` where `#` is a number of pixels.  
     * - `X#` or `Y#`: Static `X` or `Y` coordinates where `#` is the pixel location on the Gui.  
     * - `X+#` or `Y+#`: Use the right edge `X+#` or bottom edge `Y+#` of the previous control as a start point.  
     *   The position can be offset with `+#` or `-#` where `#` is a number of pixels.  
     * - `XP+#` or `YP+#`: Use the left edge `XP+#` or top edge `YP+#` of the previous control as a start point.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     *   Useful for aligning controls in a {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#GroupBox|`GroupBox`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Tab|`Tab`}.  
     * - `XM+#` or `YM+#`: Use Gui {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginX|`left margin (MarginX)`} or {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginY|`top margin (MarginY)`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     * - `XS+#` or `YS+#`: Use the left edge `XS` or top edge `YS` of the last control marked as a {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Section|`Section`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     * 
     * **Common Styles and Other Options**  
     * Prefix with `-` to disable an option and `+` (or no sign) to add an option.  
     * - `Vstring`: Assign a {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Name|`Name`} to a control where `string` is the new name.  
     *   A control's name can be used to get a reference to that control from a GUI object.  
     *
     *         GuiControl.Opt('+VMyControl')  
     *         GuiControl := Gui['MyControl']  
     * - `Events`: Handled by the control's {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm|`OnEvent()` method}.  
     * - `C#`: Set text color where `#` is one of the following:  
     *   - RGB hex value (0x prefix is optional): `C0x000000` to `CFFffFF`  
     *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}: `CBlack`, `CSilver`, `CGray`, `CWhite`, `CMaroon`, `CRed`, `CPurple`  
     *     `CFuchsia`, `CGreen`, `CLime`, `COlive`, `CYellow`, `CNavy`, `CBlue`, `CTeal`, `CAqua`  
     *   - Reset/Default: `CDefault` or `C`  
     * - `Disabled`: Disables the control preventing user focus or modifications of the contents.  
     *   Control can be enabled using `-Disabled` or setting {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Enabled`} to true.  
     *   A `0` for enabled or `1` for disabled can immediately follow `Disabled`.  
     *
     *       con.Opt('+Disabled0')
     *       var := 1, con.Opt('+Disabled' var)
     * - `Hidden`: The control is initially invisible.  
     *   Use `-Hidden` or {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Visible`} to unhide it.  
     *   A `0` for visible or `1` for hidden can immediately follow `Hidden`.  
     * 
     *       con.Opt('+Hidden0')
     *       var := 1, con.Opt('+Hidden' var)
     * - `Left`: Left-justifies the control's text within its available width.  
     * - `Right`: Right-justifies the control's text within its available width.  
     *   This also moves the box from the left to the right side of the control.  
     * - `Center`: Centers the control's text within its available width.  
     * - `Section`: Sets current control as the new Section for use with the {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#xs|`XS` and `YS`} positioning options.  
     * - `Tabstop`: Disabling Tabstop of a control prevents the user from tabbing to that control.  
     * - `Wrap`: Enables word-wrapping of the control's contents within its available width.  
     * - `VScroll`: Provide or remove a vertical scroll bar if appropriate for this type of control.  
     * - `HScroll`: Provide or remove a horizontal scroll bar if appropriate for this type of control.  
     *  
     * **Uncommon Styles and Options**
     * - `Background#`: Sets control background color where `#` is one of the following:  
     *   - RGB hex value (0x prefix is optional): `000000` to `0xFFffFf`
     *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}: `Black`, `Silver`, `Gray`, `White`, `Maroon`, `Red`, `Purple`  
     *   `Fuchsia`, `Green`, `Lime`, `Olive`, `Yellow`, `Navy`, `Blue`, `Teal`, `Aqua`  
     *   - Reset/Default: `BackgroundDefault` or `-Background`  
     * - `Border`: Provides a thin-line border around the control. Adding a border to an  
     *   existing control might require increasing the control's width and height by 1 pixel.  
     * - `Redraw`: Enable/disable redrawing (visual updates) of a control (Uses: {@link https://learn.microsoft.com/en-us/windows/win32/gdi/wm-setredraw|`WM_SETREDRAW`}).  
     *   Disabling redraw `-Redraw` prior to adding multiple controls/elements can increase performance.  
     *   Enable redraw `+Redraw` after all changes have been made.  
     * - `Theme`: Used to override the window's current theme setting for the newly created control.  
     *   This setting has no effect when used on an existing control. See {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Theme|`GUI's +/-Theme option`} for details.  
     * - {@link https://www.autohotkey.com/docs/v2/misc/Styles.htm|`Style Number`} `+0x0`: Specify a plus or minus sign  
     *   followed immediately by a decimal or hexadecimal style number.  
     * - {@link https://learn.microsoft.com/en-us/windows/win32/winmsg/extended-window-styles|`ExStyle Number`} `+E0x0`: Specify a plus or minus sign  
     *   followed immediately by the letter E and a decimal or hexadecimal extended style number.  
     * @param {(String)} [Label] - Label to display next to the checkbox. Can include linefeeds `` `n ``.  
     * @returns {(Gui.Checkbox)} Checkbox Control Object
     * @example <caption>  
     * Make a checkbox to enable/disable a control.</caption>
     * goo := Gui()
     * goo.cb_lock := goo.AddCheckbox('xm ym w200 Checked', 'Disable close button')
     * goo.cb_lock.OnEvent('Click', toggle_lock)
     * goo.btn_exit := goo.AddButton('xm w200 Disabled', 'Close')
     * goo.btn_exit.OnEvent('Click', (*) => ExitApp())
     * goo.Show('AutoSize')
     * 
     * toggle_lock(ctrl, info) {
     *     ctrl.gui.btn_exit.Enabled := !ctrl.Value
     * }
     */
    AddCheckbox([Options:='', Label:='']) => Gui.Checkbox
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Add|`AddCustom()`} add a custom control that is not directly supported by AutoHotkey. To do so, include the word "Class" followed by the {@link https://learn.microsoft.com/en-us/windows/win32/controls/individual-control-info|`Win32 class name`} of the desired control in the options field.  
     *  
     * @method
     * @param {(String)} Options - Any {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#OtherOptions|`general`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm|`control-specific`} options, separated by spaces/tabs.  
     * **Positioning and Sizing of Controls**  
     * - `R#`: Rows of text where `#` is the number of rows. This number can be a float.  
     *   `R` takes precedence over `H`.  
     * - `W#`: Width of control where `#` is a number of pixels.  
     * - `H#`: Height of control where `#` is a number of pixels.  
     * - `WP+#` or `HP+#`: Use previous control's width `WP` or height `HP`.  
     *   Width or height can be adjusted by adding `+#` or `-#` where `#` is a number of pixels.  
     * - `X#` or `Y#`: Static `X` or `Y` coordinates where `#` is the pixel location on the Gui.  
     * - `X+#` or `Y+#`: Use the right edge `X+#` or bottom edge `Y+#` of the previous control as a start point.  
     *   The position can be offset with `+#` or `-#` where `#` is a number of pixels.  
     * - `XP+#` or `YP+#`: Use the left edge `XP+#` or top edge `YP+#` of the previous control as a start point.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     *   Useful for aligning controls in a {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#GroupBox|`GroupBox`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Tab|`Tab`}.  
     * - `XM+#` or `YM+#`: Use Gui {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginX|`left margin (MarginX)`} or {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginY|`top margin (MarginY)`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     * - `XS+#` or `YS+#`: Use the left edge `XS` or top edge `YS` of the last control marked as a {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Section|`Section`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     * 
     * **Common Styles and Other Options**  
     * Prefix with `-` to disable an option and `+` (or no sign) to add an option.  
     * - `Vstring`: Assign a {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Name|`Name`} to a control where `string` is the new name.  
     *   A control's name can be used to get a reference to that control from a GUI object.  
     *
     *         GuiControl.Opt('+VMyControl')  
     *         GuiControl := Gui['MyControl']  
     * - `Events`: Handled by the control's {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm|`OnEvent()` method}.  
     * - `Disabled`: Disables the control preventing user focus or modifications of the contents.  
     *   Control can be enabled using `-Disabled` or setting {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Enabled`} to true.  
     *   A `0` for enabled or `1` for disabled can immediately follow `Disabled`.  
     *
     *       con.Opt('+Disabled0')
     *       var := 1, con.Opt('+Disabled' var)
     * - `Hidden`: The control is initially invisible.  
     *   Use `-Hidden` or {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Visible`} to unhide it.  
     *   A `0` for visible or `1` for hidden can immediately follow `Hidden`.  
     * 
     *       con.Opt('+Hidden0')
     *       var := 1, con.Opt('+Hidden' var)
     * - `Section`: Sets current control as the new Section for use with the {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#xs|`XS` and `YS`} positioning options.  
     * - `Tabstop`: Disabling Tabstop of a control prevents the user from tabbing to that control.  
     * - `VScroll`: Provide or remove a vertical scroll bar if appropriate for this type of control.  
     * - `HScroll`: Provide or remove a horizontal scroll bar if appropriate for this type of control.  
     *  
     * **Uncommon Styles and Options**
     * - `Background#`: Sets control background color where `#` is one of the following:  
     *   - RGB hex value (0x prefix is optional): `000000` to `0xFFffFf`
     *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}: `Black`, `Silver`, `Gray`, `White`, `Maroon`, `Red`, `Purple`  
     *   `Fuchsia`, `Green`, `Lime`, `Olive`, `Yellow`, `Navy`, `Blue`, `Teal`, `Aqua`  
     *   - Reset/Default: `BackgroundDefault` or `-Background`  
     * - `Border`: Provides a thin-line border around the control. Adding a border to an  
     *   existing control might require increasing the control's width and height by 1 pixel.  
     * - `Redraw`: Enable/disable redrawing (visual updates) of a control (Uses: {@link https://learn.microsoft.com/en-us/windows/win32/gdi/wm-setredraw|`WM_SETREDRAW`}).  
     *   Disabling redraw `-Redraw` prior to adding multiple controls/elements can increase performance.  
     *   Enable redraw `+Redraw` after all changes have been made.  
     * - `Theme`: Used to override the window's current theme setting for the newly created control.  
     *   This setting has no effect when used on an existing control. See {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Theme|`GUI's +/-Theme option`} for details.  
     * - {@link https://www.autohotkey.com/docs/v2/misc/Styles.htm|`Style Number`} `+0x0`: Specify a plus or minus sign  
     *   followed immediately by a decimal or hexadecimal style number.  
     * - {@link https://learn.microsoft.com/en-us/windows/win32/winmsg/extended-window-styles|`ExStyle Number`} `+E0x0`: Specify a plus or minus sign  
     *   followed immediately by the letter E and a decimal or hexadecimal extended style number.  
     * @param {(String)} [ControlSpecific]
     * @returns {(Gui.Custom)} Custom Control Object
     * @example <caption>  
     * Adding a ComboBoxEx to a GUI.</caption>
     * goo := Gui()
     * goo.ComboBoxEx := goo.AddCustom('ClassComboBoxEx32')
     * goo.Show('AutoSize')
     */
    AddCustom([Options:='', ControlSpecific:='']) => Gui.Custom
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Add|`AddDateTime()`} adds a DateTime control to the Gui that provides a single-lined   
     * control for the date and/or time along with a calander dropdown button.  
     * @method
     * @param {(String)} Options - Any {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#OtherOptions|`general`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm|`control-specific`} options separated by spaces/tabs.  
     * **Control Specific Options**  
     * - `Choose`: Pre-selects a date or time other than the current date/time.  
     *   Choose should be followed by a DTS in {@link https://www.autohotkey.com/docs/v2/lib/FileSetTime.htm#YYYYMMDD|`YYYYMMDDHHMISS` format}.  
     *   When setting the time, the full date and time must be provided.  
     *   `ChooseNone` adds a checkbox to toggle usable state (similar to a checkbox greycheck).  
     * - `RangeMIN-MAX`: Sets how far back or forward you can set the DateTime control.  
     *   MIN and MAX should be dates. Omitting one leaves that side of the range unrestricted.  
     * 
     *       goo.AddDateTime('Range20220101-20221231')
     *       goo.AddDateTime('Range-20250101115959')
     * - `Right`: Right edge of drop-down calendar aligns with the right side of the control.  
     * - `Left`: Left edge of drop-down calendar aligns with the left side of the control.  
     * - `1`: Provide an up-down control to the right of the control to modify date-time values.  
     *   This replaces the button of the drop-down month calendar. Does not work with the `LongDate` option.  
     * - `2`: Provide a checkbox inside the control, similar to `CheckNone`.  
     *   When unchecked, the control is greyed out and indicates no date/time is selected.  
     *   This option cannot be added or removed after the control is created.  
     * - `Colors`: Day number colors inside the drop-down calendar obey {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#SetFont|`Gui.SetFont()`} or the {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#OtherOptions|`C` option'}.  
     *  
     * **Positioning and Sizing of Controls**  
     * - `R#`: Rows of text where `#` is the number of rows. This number can be a float.  
     *   `R` takes precedence over `H`.  
     * - `W#`: Width of control where `#` is a number of pixels.  
     * - `H#`: Height of control where `#` is a number of pixels.  
     * - `WP+#` or `HP+#`: Use previous control's width `WP` or height `HP`.  
     *   Width or height can be adjusted by adding `+#` or `-#` where `#` is a number of pixels.  
     * - `X#` or `Y#`: Static `X` or `Y` coordinates where `#` is the pixel location on the Gui.  
     * - `X+#` or `Y+#`: Use the right edge `X+#` or bottom edge `Y+#` of the previous control as a start point.  
     *   The position can be offset with `+#` or `-#` where `#` is a number of pixels.  
     * - `XP+#` or `YP+#`: Use the left edge `XP+#` or top edge `YP+#` of the previous control as a start point.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     *   Useful for aligning controls in a {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#GroupBox|`GroupBox`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Tab|`Tab`}.  
     * - `XM+#` or `YM+#`: Use Gui {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginX|`left margin (MarginX)`} or {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginY|`top margin (MarginY)`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     * - `XS+#` or `YS+#`: Use the left edge `XS` or top edge `YS` of the last control marked as a {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Section|`Section`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     * 
     * **Common Styles and Other Options**  
     * Prefix with `-` to disable an option and `+` (or no sign) to add an option.  
     * - `Vstring`: Assign a {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Name|`Name`} to a control where `string` is the new name.  
     *   A control's name can be used to get a reference to that control from a GUI object.  
     *
     *         GuiControl.Opt('+VMyControl')  
     *         GuiControl := Gui['MyControl']  
     * - `Events`: Handled by the control's {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm|`OnEvent()` method}.  
     * - `C#`: Set text color where `#` is one of the following:  
     *   - RGB hex value (0x prefix is optional): `C0x000000` to `CFFffFF`  
     *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}: `CBlack`, `CSilver`, `CGray`, `CWhite`, `CMaroon`, `CRed`, `CPurple`  
     *     `CFuchsia`, `CGreen`, `CLime`, `COlive`, `CYellow`, `CNavy`, `CBlue`, `CTeal`, `CAqua`  
     *   - Reset/Default: `CDefault` or `C`  
     * - `Disabled`: Disables the control preventing user focus or modifications of the contents.  
     *   Control can be enabled using `-Disabled` or setting {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Enabled`} to true.  
     *   A `0` for enabled or `1` for disabled can immediately follow `Disabled`.  
     *
     *       con.Opt('+Disabled0')
     *       var := 1, con.Opt('+Disabled' var)
     * - `Hidden`: The control is initially invisible.  
     *   Use `-Hidden` or {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Visible`} to unhide it.  
     *   A `0` for visible or `1` for hidden can immediately follow `Hidden`.  
     * 
     *       con.Opt('+Hidden0')
     *       var := 1, con.Opt('+Hidden' var)
     * - `Left`: Left-justifies the control's text within its available width.  
     * - `Right`: Right-justifies the control's text within its available width.  
     * - `Section`: Sets current control as the new Section for use with the {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#xs|`XS` and `YS`} positioning options.  
     * - `Tabstop`: Disabling Tabstop of a control prevents the user from tabbing to that control.  
     * - `VScroll`: Provide or remove a vertical scroll bar if appropriate for this type of control.  
     * - `HScroll`: Provide or remove a horizontal scroll bar if appropriate for this type of control.  
     *  
     * **Uncommon Styles and Options**
     * - `Background#`: Sets control background color where `#` is one of the following:  
     *   - RGB hex value (0x prefix is optional):  
     *     `C0x000000` to `CFFffFF`  
     *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}:  
     *     `CBlack`, `CSilver`, `CGray`, `CWhite`, `CMaroon`, `CRed`, `CPurple`, `CFuchsia`  
     *     `CGreen`, `CLime`, `COlive`, `CYellow`, `CNavy`, `CBlue`, `CTeal`, `CAqua`  
     *     Reset color to default.  
     * - `Border`: Provides a thin-line border around the control. Adding a border to an  
     *   existing control might require increasing the control's width and height by 1 pixel.  
     * - `Redraw`: Enable/disable redrawing (visual updates) of a control (Uses: {@link https://learn.microsoft.com/en-us/windows/win32/gdi/wm-setredraw|`WM_SETREDRAW`}).  
     *   Disabling redraw `-Redraw` prior to adding multiple controls/elements can increase performance.  
     *   Enable redraw `+Redraw` after all changes have been made.  
     * - `Theme`: Used to override the window's current theme setting for the newly created control.  
     *   This setting has no effect when used on an existing control. See {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Theme|`GUI's +/-Theme option`} for details.  
     * - {@link https://www.autohotkey.com/docs/v2/misc/Styles.htm|`Style Number`} `+0x0`: Specify a plus or minus sign  
     *   followed immediately by a decimal or hexadecimal style number.  
     * - {@link https://learn.microsoft.com/en-us/windows/win32/winmsg/extended-window-styles|`ExStyle Number`} `+E0x0`: Specify a plus or minus sign  
     *   followed immediately by the letter E and a decimal or hexadecimal extended style number.  
     * @param {(String)} [DateFormat] - Sets the desired {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#DateTimeFormat|`display format`} of a DateTime control.
     * - `ShortDate`: Locale short date format. Example: 6/1/2005  
     * - `LongDate`: Locale long date format. Example: Wednesday, June 01, 2005  
     * - `Time`: Shows locale time only. Example: 9:37:45 PM  
     *   The date is still present in the control even thought it's not shown.  
     *   It  will be retrieved along with the time in the YYYYMMDDHH24MISS format.  
     * - `Custom`: Any combination of {@link https://www.autohotkey.com/docs/v2/lib/FormatTime.htm|`date and time formats`}.  
     * @returns {(Gui.DateTime)} DateTime Control Object
     * @example <caption>  
     * Adding a DateTime control set to v2's release date.</caption>
     * goo := Gui()
     * goo.date := goo.AddDateTime('xm ym choose20221220021600', 'LongDate')
     * goo.date := goo.AddDateTime('xm', "'Date:' MM/dd/yy 'Time:' hh:mm:ss tt")
     * goo.Show('AutoSize')
     */
    AddDateTime([Options:='', DateFormat:='ShortDate']) => Gui.DateTime
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Add|`AddEdit()`} adds a control that provides a free-form text area for the user to type in.  
     * @method
     * @param {(String)} Options - Any {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#OtherOptions|`general`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm|`control-specific`} options, separated by spaces/tabs.  
     * **Control Specific Options**  
     * - `Limit`: Restricts input to the visible width of the edit field.  
     * - `Limit#`: Set the character limit of the control where `#` is the limit number.  
     * - `Lowercase`: The characters typed by the user are automatically converted to lowercase.  
     * - `Multi`: Allows more than one line of text.  
     * - `Number`: Allows only digits to be typed into the edit field. Non-digits can still be pasted in.  
     *   Attaching an {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#UpDown|`UpDown`} control also forces +Number.  
     * - `Password`: Hides the user input of a non-multilined edit control.  
     *   The masking character can be set by including it immediately after `Password`.  
     *   
     *        goo.AddEdit('+Password*'), goo.AddButton('+Password#')
     * - `ReadOnly`: Prevent the user from changing the control's contents, but text can still be copied.  
     * - `T#`: Set tab stop distance where `#` is the amount of {@link https://learn.microsoft.com/en-us/previous-versions/windows/desktop/bb226789(v=vs.85)|`dialog units`} to use (a unit determined by the OS).  
     *   A single tab stop sets the default tab distance. Default value is 32.  
     *   Multiple tab stops (up to 50) can be set to define where each tab should go to.  
     *   
     *        goo.AddEdit('T5'), goo.AddEdit('T10 T20 T50 T100')
     * - `Uppercase`: Convert all characters in the control to uppercase.  
     * - `WantCtrlA`: Allow Ctrl+A to highlight all text or `-WantCtrlA` to disable it.  
     * - `WantReturn`: Allows Enter to create a new line.  
     *   `-WantReturn` causes Enter will activate the Gui's default control.  
     *   New lines can still be added by using Ctrl+Enter.  
     * - `WantTab`: If enabled, Tab produces a tab character otherwise tab navigates to the next control.  
     *   In a multiline tab, a tab can still be produced with Ctrl+Tab.  
     * - `Wrap`: Enables word-wrapping in a multi-line edit control.  
     *   This style cannot be changed after the control has been created.  
     *  
     * **Positioning and Sizing of Controls**  
     * - `R#`: Rows of text where `#` is the number of rows. This number can be a float.  
     *   `R` takes precedence over `H`.  
     * - `W#`: Width of control where `#` is a number of pixels.  
     * - `H#`: Height of control where `#` is a number of pixels.  
     * - `WP+#` or `HP+#`: Use previous control's width `WP` or height `HP`.  
     *   Width or height can be adjusted by adding `+#` or `-#` where `#` is a number of pixels.  
     * - `X#` or `Y#`: Static `X` or `Y` coordinates where `#` is the pixel location on the Gui.  
     * - `X+#` or `Y+#`: Use the right edge `X+#` or bottom edge `Y+#` of the previous control as a start point.  
     *   The position can be offset with `+#` or `-#` where `#` is a number of pixels.  
     * - `XP+#` or `YP+#`: Use the left edge `XP+#` or top edge `YP+#` of the previous control as a start point.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     *   Useful for aligning controls in a {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#GroupBox|`GroupBox`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Tab|`Tab`}.  
     * - `XM+#` or `YM+#`: Use Gui {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginX|`left margin (MarginX)`} or {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginY|`top margin (MarginY)`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     * - `XS+#` or `YS+#`: Use the left edge `XS` or top edge `YS` of the last control marked as a {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Section|`Section`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     * 
     * **Common Styles and Other Options**  
     * Prefix with `-` to disable an option and `+` (or no sign) to add an option.  
     * - `Vstring`: Assign a {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Name|`Name`} to a control where `string` is the new name.  
     *   A control's name can be used to get a reference to that control from a GUI object.  
     *
     *         GuiControl.Opt('+VMyControl')  
     *         GuiControl := Gui['MyControl']  
     * - `Events`: Handled by the control's {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm|`OnEvent()` method}.  
     * - `C#`: Set text color where `#` is one of the following:  
     *   - RGB hex value (0x prefix is optional): `C0x000000` to `CFFffFF`  
     *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}: `CBlack`, `CSilver`, `CGray`, `CWhite`, `CMaroon`, `CRed`, `CPurple`  
     *     `CFuchsia`, `CGreen`, `CLime`, `COlive`, `CYellow`, `CNavy`, `CBlue`, `CTeal`, `CAqua`  
     *   - Reset/Default: `CDefault` or `C`  
     * - `Disabled`: Disables the control preventing user focus or modifications of the contents.  
     *   Control can be enabled using `-Disabled` or setting {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Enabled`} to true.  
     *   A `0` for enabled or `1` for disabled can immediately follow `Disabled`.  
     *
     *       con.Opt('+Disabled0')
     *       var := 1, con.Opt('+Disabled' var)
     * - `Hidden`: The control is initially invisible.  
     *   Use `-Hidden` or {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Visible`} to unhide it.  
     *   A `0` for visible or `1` for hidden can immediately follow `Hidden`.  
     * 
     *       con.Opt('+Hidden0')
     *       var := 1, con.Opt('+Hidden' var)
     * - `Left`: Left-justifies the control's text within its available width.  
     * - `Right`: Right-justifies the control's text within its available width.  
     * - `Center`: Centers the control's text within its available width.  
     * - `Section`: Sets current control as the new Section for use with the {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#xs|`XS` and `YS`} positioning options.  
     * - `VScroll`: Provide or remove a vertical scroll bar if appropriate for this type of control.  
     * - `HScroll`: Provide or remove a horizontal scroll bar if appropriate for this type of control.  
     *  
     * **Uncommon Styles and Options**
     * - `Background#`: Sets control background color where `#` is one of the following:  
     *   - RGB hex value (0x prefix is optional): `000000` to `0xFFffFf`
     *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}: `Black`, `Silver`, `Gray`, `White`, `Maroon`, `Red`, `Purple`  
     *   `Fuchsia`, `Green`, `Lime`, `Olive`, `Yellow`, `Navy`, `Blue`, `Teal`, `Aqua`  
     *   - Reset/Default: `BackgroundDefault` or `-Background`  
     * - `Border`: Provides a thin-line border around the control. Adding a border to an  
     *   existing control might require increasing the control's width and height by 1 pixel.  
     * - `Redraw`: Enable/disable redrawing (visual updates) of a control (Uses: {@link https://learn.microsoft.com/en-us/windows/win32/gdi/wm-setredraw|`WM_SETREDRAW`}).  
     *   Disabling redraw `-Redraw` prior to adding multiple controls/elements can increase performance.  
     *   Enable redraw `+Redraw` after all changes have been made.  
     * - `Theme`: Used to override the window's current theme setting for the newly created control.  
     *   This setting has no effect when used on an existing control. See {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Theme|`GUI's +/-Theme option`} for details.  
     * - {@link https://www.autohotkey.com/docs/v2/misc/Styles.htm|`Style Number`} `+0x0`: Specify a plus or minus sign  
     *   followed immediately by a decimal or hexadecimal style number.  
     * - {@link https://learn.microsoft.com/en-us/windows/win32/winmsg/extended-window-styles|`ExStyle Number`} `+E0x0`: Specify a plus or minus sign  
     *   followed immediately by the letter E and a decimal or hexadecimal extended style number.  
     * @param {(String)} [Text] - The initial text of the control.  
     * @returns {(Gui.Edit)} Edit Control Object
     * @example <caption>  
     * Make an edit box that lets you change the GUI title.</caption>
     * goo := Gui()
     * goo.AddText('xm ym w400', 'Enter text to change window title:')
     * goo.Edit := goo.AddEdit('xm w400 r1 +BackgroundBlack')
     * goo.Edit.SetFont('s10 cWhite' ,'Courier New')
     * goo.Edit.OnEvent('Change', update_title)
     * goo.Show('AutoSize')
     *
     * update_title(con, info) {
     *     if (con.Value = '')
     *         con.gui.title := A_ScriptName
     *     else con.gui.title := con.Value
     * }
     */
    AddEdit([Options:='', Text:='']) => Gui.Edit
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Add|`AddGroupBox()`} adds a rectangular border/frame control that can  
     * be labeled and used to group related controls.  
     * @method
     * @param {(String)} Options - Any {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#OtherOptions|`general`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm|`control-specific`} options, separated by spaces/tabs.  
     * **Positioning and Sizing of Controls**  
     * - `R#`: The number of controls to reserve space for. 
     *   This number can be a float. Default: 2 rows
     * - `W#`: Width of control where `#` is a number of pixels. Default: Current font size x18  
     * - `H#`: Height of control where `#` is a number of pixels.  
     * - `WP+#` or `HP+#`: Use previous control's width `WP` or height `HP`.  
     *   Width or height can be adjusted by adding `+#` or `-#` where `#` is a number of pixels.  
     * - `X#` or `Y#`: Static `X` or `Y` coordinates where `#` is the pixel location on the Gui.  
     * - `X+#` or `Y+#`: Use the right edge `X+#` or bottom edge `Y+#` of the previous control as a start point.  
     *   The position can be offset with `+#` or `-#` where `#` is a number of pixels.  
     * - `XP+#` or `YP+#`: Use the left edge `XP+#` or top edge `YP+#` of the previous control as a start point.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     *   Useful for aligning controls in a {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#GroupBox|`GroupBox`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Tab|`Tab`}.  
     * - `XM+#` or `YM+#`: Use Gui {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginX|`left margin (MarginX)`} or {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginY|`top margin (MarginY)`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     * - `XS+#` or `YS+#`: Use the left edge `XS` or top edge `YS` of the last control marked as a {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Section|`Section`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     * 
     * **Common Styles and Other Options**  
     * Prefix with `-` to disable an option and `+` (or no sign) to add an option.  
     * - `Vstring`: Assign a {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Name|`Name`} to a control where `string` is the new name.  
     *   A control's name can be used to get a reference to that control from a GUI object.  
     *
     *         GuiControl.Opt('+VMyControl')  
     *         GuiControl := Gui['MyControl']  
     * - `Events`: Handled by the control's {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm|`OnEvent()` method}.  
     * - `C#`: Set text color where `#` is one of the following:  
     *   - RGB hex value (0x prefix is optional): `C0x000000` to `CFFffFF`  
     *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}: `CBlack`, `CSilver`, `CGray`, `CWhite`, `CMaroon`, `CRed`, `CPurple`  
     *     `CFuchsia`, `CGreen`, `CLime`, `COlive`, `CYellow`, `CNavy`, `CBlue`, `CTeal`, `CAqua`  
     *   - Reset/Default: `CDefault` or `C`  
     * - `Disabled`: Disables the control preventing user focus or modifications of the contents.  
     *   Control can be enabled using `-Disabled` or setting {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Enabled`} to true.  
     *   A `0` for enabled or `1` for disabled can immediately follow `Disabled`.  
     *
     *       con.Opt('+Disabled0')
     *       var := 1, con.Opt('+Disabled' var)
     * - `Hidden`: The control is initially invisible.  
     *   Use `-Hidden` or {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Visible`} to unhide it.  
     *   A `0` for visible or `1` for hidden can immediately follow `Hidden`.  
     * 
     *       con.Opt('+Hidden0')
     *       var := 1, con.Opt('+Hidden' var)
     * - `Left`: Left-justifies the control's text within its available width.  
     * - `Right`: Right-justifies the control's text within its available width.  
     * - `Center`: Centers the control's text within its available width.  
     * - `Section`: Sets current control as the new Section for use with the {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#xs|`XS` and `YS`} positioning options.  
     * - `Tabstop`: Disabling Tabstop of a control prevents the user from tabbing to that control.  
     * - `Wrap`: Enables word-wrapping of the control's contents within its available width.  
     * - `VScroll`: Provide or remove a vertical scroll bar if appropriate for this type of control.  
     * - `HScroll`: Provide or remove a horizontal scroll bar if appropriate for this type of control.  
     *  
     * **Uncommon Styles and Options**
     * - `BackgroundTrans`: Applies a transparent background, allowing controls behind  
     *   the GroupBox to show through. Use `+Background` to remove this option later.  
     *   Known limitation: BackgroundTrans might not work in a Tab control that contains a ListView.  
     * - `Background#`: Sets control background color where `#` is one of the following:  
     *   - RGB hex value (0x prefix is optional): `000000` to `0xFFffFf`
     *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}: `Black`, `Silver`, `Gray`, `White`, `Maroon`, `Red`, `Purple`  
     *   `Fuchsia`, `Green`, `Lime`, `Olive`, `Yellow`, `Navy`, `Blue`, `Teal`, `Aqua`  
     *   - Reset/Default: `BackgroundDefault` or `-Background`  
     * - `Border`: Provides a thin-line border around the control. Adding a border to an  
     *   existing control might require increasing the control's width and height by 1 pixel.  
     * - `Redraw`: Enable/disable redrawing (visual updates) of a control (Uses: {@link https://learn.microsoft.com/en-us/windows/win32/gdi/wm-setredraw|`WM_SETREDRAW`}).  
     *   Disabling redraw `-Redraw` prior to adding multiple controls/elements can increase performance.  
     *   Enable redraw `+Redraw` after all changes have been made.  
     * - `Theme`: Used to override the window's current theme setting for the newly created control.  
     *   This setting has no effect when used on an existing control. See {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Theme|`GUI's +/-Theme option`} for details.  
     * - {@link https://www.autohotkey.com/docs/v2/misc/Styles.htm|`Style Number`} `+0x0`: Specify a plus or minus sign  
     *   followed immediately by a decimal or hexadecimal style number.  
     * - {@link https://learn.microsoft.com/en-us/windows/win32/winmsg/extended-window-styles|`ExStyle Number`} `+E0x0`: Specify a plus or minus sign  
     *   followed immediately by the letter E and a decimal or hexadecimal extended style number.  
     * @param {(String)} [Label] - The text label to display at the top of the GroupBox.  
     * @returns {(Gui.GroupBox)} GroupBox Control Object
     * @example <caption>  
     * Create a GUI that toggles AlwaysOnTop.</caption>
     * goo := Gui()
     * goo.gb_radio := goo.AddGroupBox('xm ym w160 Section Center', 'Set AlwaysOnTop:')
     * goo.rad_on := goo.AddRadio('xs+10 ys+25 w60', 'Enable')
     * goo.rad_on.OnEvent('Click', set_aot)
     * goo.rad_off := goo.AddRadio('x+20 w60 Right', 'Disable')
     * goo.rad_off.OnEvent('Click', set_aot)
     * goo.Show('AutoSize')
     * 
     * set_aot(control, info) {
     *     if (control.Text = 'Enable')
     *         control.gui.Opt('+AlwaysOnTop')
     *     else control.gui.Opt('-AlwaysOnTop')
     * }
     */
    AddGroupBox([Options:='', Label]) => Gui.GroupBox
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Add|`AddHotkey()`} adds a Hotkey control to the Gui that looks similar  
     * to an edit control but will detect and show what keys are being pressed.  
     * @method
     * @param {(String)} Options - Any {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#OtherOptions|`general`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm|`control-specific`} options, separated by spaces/tabs.  
     * **Control Specific Options**  
     * - `Limit#`: Restrict the types of hotkeys the user can enter where `#` is one of the following:
     *   - 1: Prevent unmodified keys  
     *   - 2: Prevent Shift-only keys  
     *   - 4: Prevent Ctrl-only keys  
     *   - 8: Prevent Alt-only keys  
     *   - 16: Prevent Shift+Ctrl keys  
     *   - 32: Prevent Shift+Alt keys  
     *   - 64: Not supported (will not behave correctly)  
     *   - 128: Prevent Shift+Ctrl+Alt keys  
     *  
     * **Positioning and Sizing of Controls**  
     * - `R#`: Rows of text where `#` is the number of rows. This number can be a float.  
     *   `R` takes precedence over `H`.  
     * - `W#`: Width of control where `#` is a number of pixels. Default is font size x15.  
     * - `H#`: Height of control where `#` is a number of pixels. Default is 1 row
     * - `WP+#` or `HP+#`: Use previous control's width `WP` or height `HP`.  
     *   Width or height can be adjusted by adding `+#` or `-#` where `#` is a number of pixels.  
     * - `X#` or `Y#`: Static `X` or `Y` coordinates where `#` is the pixel location on the Gui.  
     * - `X+#` or `Y+#`: Use the right edge `X+#` or bottom edge `Y+#` of the previous control as a start point.  
     *   The position can be offset with `+#` or `-#` where `#` is a number of pixels.  
     * - `XP+#` or `YP+#`: Use the left edge `XP+#` or top edge `YP+#` of the previous control as a start point.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     *   Useful for aligning controls in a {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#GroupBox|`GroupBox`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Tab|`Tab`}.  
     * - `XM+#` or `YM+#`: Use Gui {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginX|`left margin (MarginX)`} or {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginY|`top margin (MarginY)`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     * - `XS+#` or `YS+#`: Use the left edge `XS` or top edge `YS` of the last control marked as a {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Section|`Section`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     * 
     * **Common Styles and Other Options**  
     * Prefix with `-` to disable an option and `+` (or no sign) to add an option.  
     * - `Vstring`: Assign a {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Name|`Name`} to a control where `string` is the new name.  
     *   A control's name can be used to get a reference to that control from a GUI object.  
     *
     *         GuiControl.Opt('+VMyControl')  
     *         GuiControl := Gui['MyControl']  
     * - `Events`: Handled by the control's {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm|`OnEvent()` method}.  
     * - `C#`: Set text color where `#` is one of the following:  
     *   - RGB hex value (0x prefix is optional): `C0x000000` to `CFFffFF`  
     *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}: `CBlack`, `CSilver`, `CGray`, `CWhite`, `CMaroon`, `CRed`, `CPurple`  
     *     `CFuchsia`, `CGreen`, `CLime`, `COlive`, `CYellow`, `CNavy`, `CBlue`, `CTeal`, `CAqua`  
     *   - Reset/Default: `CDefault` or `C`  
     * - `Disabled`: Disables the control preventing user focus or modifications of the contents.  
     *   Control can be enabled using `-Disabled` or setting {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Enabled`} to true.  
     *   A `0` for enabled or `1` for disabled can immediately follow `Disabled`.  
     *
     *       con.Opt('+Disabled0')
     *       var := 1, con.Opt('+Disabled' var)
     * - `Hidden`: The control is initially invisible.  
     *   Use `-Hidden` or {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Visible`} to unhide it.  
     *   A `0` for visible or `1` for hidden can immediately follow `Hidden`.  
     * 
     *       con.Opt('+Hidden0')
     *       var := 1, con.Opt('+Hidden' var)
     * - `Section`: Sets current control as the new Section for use with the {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#xs|`XS` and `YS`} positioning options.  
     * - `Tabstop`: Disabling Tabstop of a control prevents the user from tabbing to that control.  
     * - `VScroll`: Provide or remove a vertical scroll bar if appropriate for this type of control.  
     * - `HScroll`: Provide or remove a horizontal scroll bar if appropriate for this type of control.  
     *  
     * **Uncommon Styles and Options**
     * - `Background#`: Sets control background color where `#` is one of the following:  
     *   - RGB hex value (0x prefix is optional): `000000` to `0xFFffFf`
     *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}: `Black`, `Silver`, `Gray`, `White`, `Maroon`, `Red`, `Purple`  
     *   `Fuchsia`, `Green`, `Lime`, `Olive`, `Yellow`, `Navy`, `Blue`, `Teal`, `Aqua`  
     *   - Reset/Default: `BackgroundDefault` or `-Background`  
     * - `Border`: Provides a thin-line border around the control. Adding a border to an  
     *   existing control might require increasing the control's width and height by 1 pixel.  
     * - `Redraw`: Enable/disable redrawing (visual updates) of a control (Uses: {@link https://learn.microsoft.com/en-us/windows/win32/gdi/wm-setredraw|`WM_SETREDRAW`}).  
     *   Disabling redraw `-Redraw` prior to adding multiple controls/elements can increase performance.  
     *   Enable redraw `+Redraw` after all changes have been made.  
     * - `Theme`: Used to override the window's current theme setting for the newly created control.  
     *   This setting has no effect when used on an existing control. See {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Theme|`GUI's +/-Theme option`} for details.  
     * - {@link https://www.autohotkey.com/docs/v2/misc/Styles.htm|`Style Number`} `+0x0`: Specify a plus or minus sign  
     *   followed immediately by a decimal or hexadecimal style number.  
     * - {@link https://learn.microsoft.com/en-us/windows/win32/winmsg/extended-window-styles|`ExStyle Number`} `+E0x0`: Specify a plus or minus sign  
     *   followed immediately by the letter E and a decimal or hexadecimal extended style number.  
     * @param {(String)} [DefaultKey] - A string in {@link https://www.autohotkey.com/docs/v2/Hotkeys.htm|`Hotkey Format`}. See {@link https://www.autohotkey.com/docs/v2/KeyList.htm|`key list`} for key names.  
     * The only supported modifiers are `+` Shift, `!` Alt, and `^` Control.  
     * 
     * @returns {(Gui.Hotkey)} Hotkey Control Object
     * @example <caption>  
     * Use Hotkey control to create a GUI close hotkey.</caption>
     * goo := Gui()
     * goo.AddText('xm ym', 'Set a hotkey to close script:')
     * goo.Hotkey_Close := goo.AddHotkey('xm', '^+F1')
     * goo.Button_Set := goo.AddButton('xm', 'Set')
     * goo.Button_Set.OnEvent('Click', create_hotkey)
     * goo.Show()
     *  
     * create_hotkey(*) => Hotkey(goo.Hotkey_Close.Value, (*) => Exitapp())
     */
    AddHotkey([Options:='', DefaultKey:='']) => Gui.Hotkey
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Add|`AddLink()`} adds a text control that accepts hyperlinks.  
     * Use {@link https://www.w3schools.com/tags/tag_a.asp|HTML anchor tags `<a></a>`} to create a hyperlink.  
     * `<a href="http://google.com">Google Search</a>`
     * @method
     * @param {(String)} Options - Any {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#OtherOptions|`general`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm|`control-specific`} options, separated by spaces/tabs.  
     * **Positioning and Sizing of Controls**  
     * - `R#`: Rows of text where `#` is the number of rows. This number can be a float.  
     *   `R` takes precedence over `H`.  
     * - `W#`: Width of control where `#` is a number of pixels.  
     * - `H#`: Height of control where `#` is a number of pixels.  
     * - `WP+#` or `HP+#`: Use previous control's width `WP` or height `HP`.  
     *   Width or height can be adjusted by adding `+#` or `-#` where `#` is a number of pixels.  
     * - `X#` or `Y#`: Static `X` or `Y` coordinates where `#` is the pixel location on the Gui.  
     * - `X+#` or `Y+#`: Use the right edge `X+#` or bottom edge `Y+#` of the previous control as a start point.  
     *   The position can be offset with `+#` or `-#` where `#` is a number of pixels.  
     * - `XP+#` or `YP+#`: Use the left edge `XP+#` or top edge `YP+#` of the previous control as a start point.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     *   Useful for aligning controls in a {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#GroupBox|`GroupBox`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Tab|`Tab`}.  
     * - `XM+#` or `YM+#`: Use Gui {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginX|`left margin (MarginX)`} or {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginY|`top margin (MarginY)`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     * - `XS+#` or `YS+#`: Use the left edge `XS` or top edge `YS` of the last control marked as a {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Section|`Section`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     * 
     * **Common Styles and Other Options**  
     * Prefix with `-` to disable an option and `+` (or no sign) to add an option.  
     * - `Vstring`: Assign a {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Name|`Name`} to a control where `string` is the new name.  
     *   A control's name can be used to get a reference to that control from a GUI object.  
     *
     *         GuiControl.Opt('+VMyControl')  
     *         GuiControl := Gui['MyControl']  
     * - `Events`: Handled by the control's {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm|`OnEvent()` method}.  
     * - `C#`: Set text color where `#` is one of the following:  
     *   - RGB hex value (0x prefix is optional): `C0x000000` to `CFFffFF`  
     *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}: `CBlack`, `CSilver`, `CGray`, `CWhite`, `CMaroon`, `CRed`, `CPurple`  
     *     `CFuchsia`, `CGreen`, `CLime`, `COlive`, `CYellow`, `CNavy`, `CBlue`, `CTeal`, `CAqua`  
     *   - Reset/Default: `CDefault` or `C`  
     * - `Disabled`: Disables the control preventing user focus or modifications of the contents.  
     *   Control can be enabled using `-Disabled` or setting {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Enabled`} to true.  
     *   A `0` for enabled or `1` for disabled can immediately follow `Disabled`.  
     *
     *       con.Opt('+Disabled0')
     *       var := 1, con.Opt('+Disabled' var)
     * - `Hidden`: The control is initially invisible.  
     *   Use `-Hidden` or {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Visible`} to unhide it.  
     *   A `0` for visible or `1` for hidden can immediately follow `Hidden`.  
     * 
     *       con.Opt('+Hidden0')
     *       var := 1, con.Opt('+Hidden' var)
     * - `Right`: Right-justifies the control's text within its available width.  
     * - `Section`: Sets current control as the new Section for use with the {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#xs|`XS` and `YS`} positioning options.  
     * - `Tabstop`: Disabling Tabstop of a control prevents the user from tabbing to that control.  
     * - `Wrap`: Enables word-wrapping of the control's contents within its available width.  
     * - `VScroll`: Provide or remove a vertical scroll bar if appropriate for this type of control.  
     * - `HScroll`: Provide or remove a horizontal scroll bar if appropriate for this type of control.  
     *  
     * **Uncommon Styles and Options**
     * - `Background#`: Sets control background color where `#` is one of the following:  
     *   - RGB hex value (0x prefix is optional): `000000` to `0xFFffFf`
     *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}: `Black`, `Silver`, `Gray`, `White`, `Maroon`, `Red`, `Purple`  
     *   `Fuchsia`, `Green`, `Lime`, `Olive`, `Yellow`, `Navy`, `Blue`, `Teal`, `Aqua`  
     *   - Reset/Default: `BackgroundDefault` or `-Background`  
     * - `Border`: Provides a thin-line border around the control. Adding a border to an  
     *   existing control might require increasing the control's width and height by 1 pixel.  
     * - `Redraw`: Enable/disable redrawing (visual updates) of a control (Uses: {@link https://learn.microsoft.com/en-us/windows/win32/gdi/wm-setredraw|`WM_SETREDRAW`}).  
     *   Disabling redraw `-Redraw` prior to adding multiple controls/elements can increase performance.  
     *   Enable redraw `+Redraw` after all changes have been made.  
     * - `Theme`: Used to override the window's current theme setting for the newly created control.  
     *   This setting has no effect when used on an existing control. See {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Theme|`GUI's +/-Theme option`} for details.  
     * - {@link https://www.autohotkey.com/docs/v2/misc/Styles.htm|`Style Number`} `+0x0`: Specify a plus or minus sign  
     *   followed immediately by a decimal or hexadecimal style number.  
     * - {@link https://learn.microsoft.com/en-us/windows/win32/winmsg/extended-window-styles|`ExStyle Number`} `+E0x0`: Specify a plus or minus sign  
     *   followed immediately by the letter E and a decimal or hexadecimal extended style number.  
     * @param {(String)} [Text] - Text to include along with any HTML anchor tags to create the link.  
     * @returns {(Gui.Link)} Link Control Object
     * @example <caption>  
     * Adding text with a hyperlink to a GUI.</caption>
     * goo := Gui()
     * urlv1 := 'https://www.autohotkey.com/docs/v1/'
     * urlv2 := 'https://www.autohotkey.com/docs/v2/'
     * goo.AddLink('xm ym', 'Link to ' make_url_tag(urlv1, 'v1 Docs')
     *     . '`nAnd the ' make_url_tag(urlv2, 'v2 Docs'))
     * goo.Show('w200 h100')
     * 
     * make_url_tag(url, text) => '<a href="' url '">' text '</a>'
     */
    AddLink([Options:='', Text:='']) => Gui.Link
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Add|`AddListView()`} adds an elbaorate control that handles  
     * rows and columns of information in a grid. Similar to Windows Explorer in Detail View mode.  
     * @method
     * @param {(String)} Options - Any {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#OtherOptions|`general`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm|`control-specific`} options, separated by spaces/tabs.  
     * **Control Specific Options**  
     * - `Background#`: Sets control background color where `#` is one of the following:  
     *   - RGB hex value (0x prefix is optional): `000000` to `0xFFffFf`
     *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}: `Black`, `Silver`, `Gray`, `White`, `Maroon`, `Red`, `Purple`  
     *   `Fuchsia`, `Green`, `Lime`, `Olive`, `Yellow`, `Navy`, `Blue`, `Teal`, `Aqua`  
     *   - Reset/Default: `BackgroundDefault` or `-Background`  
     * - `C#`: Set text color where `#` is one of the following:  
     *   - RGB hex value (0x prefix is optional): `C0x000000` to `CFFffFF`  
     *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}: `CBlack`, `CSilver`, `CGray`, `CWhite`, `CMaroon`, `CRed`, `CPurple`  
     *   `CFuchsia`, `CGreen`, `CLime`, `COlive`, `CYellow`, `CNavy`, `CBlue`, `CTeal`, `CAqua`  
     *   - Reset/Default: `CDefault` or `C`  
     * - `Checked`: Each row has a checkbox to the left side.  
     *   To add a row already checked, include the {@link https://www.autohotkey.com/docs/v2/lib/TreeView.htm#Check|`Check`} option.  
     * - `Count#`: Specify an inital amount of rows where `#` is the starting amount. `Count20`  
     *   Using this option increases performance by preventing multiple row addition calls.  
     * - `Grid`: Provides visual horizontal and vertical boundaries between rows and columns.  
     * - `Hdr`: To hide the header, use `-Hdr`.  
     *   To make the header visible hte '+Hdr' option.  
     * - `Multi`: Specify `-Multi` to prevent the user from selecting more than one row at a time.  
     * - `NoSortHdr`: Makes header unclickable and take on a flat appearance.  
     *   This cannot be changed after the ListView is created.  
     * - `NoSort`: Turns off automatic sorting on column header click.  
     *   The header still behaves like a button and allows the {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#ColClick|`ColClick event`}  
     *   to be raised and allowing for custom sorting or other actions.  
     * - `ReadOnly`: Using `-ReadOnly` allows the first column to be editable.  
     *   The label can be edited with F2 (see {@link https://www.autohotkey.com/docs/v2/lib/ListView.htm#WantF2|`WantF2`}) or by clicking the label,  
     *   waiting a brief moment, then clicking again.  
     * - `R#`: Rows of height at creation, where # is the the number of rows that should be inside the control.  
     *   If the ListView is created with a view mode other than report view, the control is sized to fit rows of icons instead of rows of text.  
     *   Adding icons to a ListView's rows will increase the height of each row, which will make this option inaccurate.  
     * - `Sort`: The control is sorted alphabetically by first column contents.  
     * - `SortDesc`: The control is sorted in reverse alphabetical order by first column contents.  
     * - `WantF2`: Specify `-WantF2` to prevent F2 from editing the current selected item. WantF2 only works if `-ReadOnly` is also in effect.  
     * 
     * **View Modes**  
     * ListView has five viewing modes, of which the most common is the default `Report` view.  
     * - `Icon`: Shows a large-icon view. In this view and all the others except Report, the text in columns other than the first is not visible. To display icons in this mode, the ListView must have a large-icon ImageList assigned to it.  
     * - `Tile`: Shows a large-icon view but with ergonomic differences such as displaying each item's text to the right of the icon rather than underneath it. Checkboxes do not function in this view.  
     * - `IconSmall`: Shows a small-icon view.  
     * - `List`: Shows a small-icon view in list format, which displays the icons in columns. The number of columns depends on the width of the control and the width of the widest text item in it.  
     * - `Report`: Switches back to report view, which is the initial default. For example: LV.Opt("+Report").  
     *
     * **Positioning and Sizing of Controls**  
     * - speical row info
     * - `W#` or `H#`: Width or Height where `#` is a number of pixels.  
     *    If omitted, width is calculated automatically.  
     * - `WP+#` or `HP+#`: Use previous control's width `WP` or height `HP`.  
     *   Width or height can be adjusted by adding `+#` or `-#` where `#` is a number of pixels.  
     * - `X#` or `Y#`: Static `X` or `Y` coordinates where `#` is the pixel location on the Gui.  
     * - `X+#` or `Y+#`: Use the right edge `X+#` or bottom edge `Y+#` of the previous control as this control's starting `x` or `y` point.  
     *   The position can be offset with `+#` or `-#` where `#` is a number of pixels.  
     * - `XP+#` or `YP+#`: Use the left edge `XP+#` or top edge `YP+#` of the previous control as this control's starting `x` or `y` point.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     * - `XM+#` or `YM+#`: Use Gui {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginX|`left margin (MarginX)`} or {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginY|`top margin (MarginY)`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     * - `XS+#` or `YS+#`: Use the left edge `XS` or top edge `YS` of the last control marked as a {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Section|`Section`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     *  
     * **Common Styles and Other Options**  
     * Prefixing with `+` adds/enables an option and `-` removes it. If no sign is provided, `+` is assumed.  
     * - `Vstring`: Assign a {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Name|`Name`} to a control where `string` is the new name.  
     *   A control's name can be used to get a reference to that control from a GUI object.  
     *
     *         GuiControl.Opt('+VMyControl')  
     *         GuiControl := Gui['MyControl']  
     * - `Events`: Handled by the control's {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm|`OnEvent()` method}.  
     * - `C#`: Set text color where `#` is an RGB hex number `c0x0` to `cFFFFFF` (0x prefix is optional) or a color string `cRed`.  
     *   {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Color word list`}: `Black`, `Silver`, `Gray`, `White`, `Maroon`, `Red`, `Purple`, `Fuchsia`, `Green`, `Lime`, `Olive`, `Yellow`, `Navy`, `Blue`, `Teal`, `Aqua`  
     * - `Disabled`: Applies a disabled state to the control preventing the user from focusing or modifying its contents.  
     *   Use {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Enabled`} to enable it later.  
     *   The word `Disabled` may optionally be followed immediately by a `0` for enabled or `1` for disabled to indicate starting state.  
     * - `Hidden`: The control is initially invisible.  
     *   Use {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Visible`} to show it later.  
     *   The word `Hidden` may optionally be followed immediately by a `0` for visible or `1` for hidden to indicate the starting state.  
     * - `Section`: Sets current control as the new section control. Used with the `XS` and `YS` positioning options.  
     * - `Tabstop`: Enable a control to be tabbed to. When tabbing to a control with `-Tabstop`, that control is skipped over.  
     * - `Wrap`: Enables word-wrapping of the control's contents within its available width.  
     * - `VScroll`: Provide or remove a vertical scroll bar.  
     * - `HScroll`: Provide or remove a horizontal scroll bar.  
     *  
     * **Uncommon Styles and Options**
     * - `Background#`: Sets control background color where `#` is an RGB hex number `c0x0` to `cFFFFFF` or a color string `cRed`.  
     *   Specifying `BackgroundDefault` or `-Background` applies the system's default background color.  
     *   {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Color word list`}: `Black`, `Silver`, `Gray`, `White`, `Maroon`, `Red`, `Purple`, `Fuchsia`, `Green`, `Lime`, `Olive`, `Yellow`, `Navy`, `Blue`, `Teal`, `Aqua`  
     * - `Redraw`: When used with {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Opt|`Opt`}, this option enables or disables redraw (visual updates) for a control by sending it a WM_SETREDRAW message.  
     *   When working with multiple controls or control elements, performance can be increased by disabling redraw: `-Redraw`  
     *   Don't forget to enable redraw when finished: `+Redraw` after all the changes are made.               
     * - `Theme`: Used to override the window's current theme setting for the newly created control.  
     *   It has no effect when used on an existing control; however, this may change in a future version.  
     *   See {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Theme|`GUI's +/-Theme option`} for details.  
     * - {@link https://www.autohotkey.com/docs/v2/misc/Styles.htm|`Style Number`} `+0x0`: Specify a plus or minus sign followed immediately by a decimal or hexadecimal style number.  
     * - {@link https://learn.microsoft.com/en-us/windows/win32/winmsg/extended-window-styles|`ExStyle Number`} `+E0x0`: Specify a plus or minus sign followed immediately by the letter E and a decimal or hexadecimal extended style number.  
     * @param {(Array)} [ColumnTitles] - An array of strings to use as the title/header for each column.  
     * @returns {(Gui.ListView)} ListView Control Object
     * @example <caption>  
     * Make a listview containing all files in script's directory.</caption>
     * goo := Gui()
     * col_titles := ['File Name', 'Extension', 'Path']
     * goo.BackColor := 0x0
     * goo.MarginX := goo.MarginY := 10
     * goo.LV := goo.AddListView('w500 r20 cWhite +BackgroundBlack +Grid', col_titles)
     * goo.LV.Opt('-Redraw')
     * loop files A_ScriptDir '\*.*'
     *     goo.LV.Add(, A_LoopFileName, A_LoopFileExt, A_LoopFileFullPath)
     * goo.LV.Opt('+Redraw')
     * goo.Show('AutoSize')
     */
    AddListView([Options:='', ColumnTitles:=[]]) => Gui.ListView
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Add|`AddMonthCal()`} adds a tall and wide control that displays all  
     * the days of the month in calendar format. The user may select a single date or a range of dates.  
     * @method
     * @param {(String)} Options - Any {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#OtherOptions|`general`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm|`control-specific`} options, separated by spaces/tabs.  
     * **Control Specific Options**  
     * - `Multi`: Allows multi-select range with shift-click or click-drag to select a range of adjacent dates.  
     *   This option is forced when the control is created with the `Range` opttion.  
     *   Once the control is created, this option cannot be altered.  
     * - `RangeMIN-MAX`: Sets how far back or forward you can set the DateTime control.  
     *   MIN and MAX should be dates. Omitting one leaves that side of the range unrestricted.  
     * 
     *       goo.AddMonthCal('Range20220101-20221231')
     *       goo.AddMonthCal('Range-20250101115959')
     * - `4`: Display week numbers (1-52) to the left of each row of days.  
     *   Week 1 is defined as the first week that contains at least four days.  
     * - `8`: Prevent the circling of today's date within the control.  
     * - `16`: Prevent the display of today's date at the bottom of the control.  
     *  
     * **Positioning and Sizing of Controls**  
     * - `R#`: Rows of text where `#` is the number of rows. This number can be a float.  
     * - `W#`: Width of control where `#` is a number of pixels.  
     * - `H#`: Height of control where `#` is a number of pixels.  
     * - `WP+#` or `HP+#`: Use previous control's width `WP` or height `HP`.  
     *   Width or height can be adjusted by adding `+#` or `-#` where `#` is a number of pixels.  
     * - `X#` or `Y#`: Static `X` or `Y` coordinates where `#` is the pixel location on the Gui.  
     * - `X+#` or `Y+#`: Use the right edge `X+#` or bottom edge `Y+#` of the previous control as a start point.  
     *   The position can be offset with `+#` or `-#` where `#` is a number of pixels.  
     * - `XP+#` or `YP+#`: Use the left edge `XP+#` or top edge `YP+#` of the previous control as a start point.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     *   Useful for aligning controls in a {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#GroupBox|`GroupBox`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Tab|`Tab`}.  
     * - `XM+#` or `YM+#`: Use Gui {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginX|`left margin (MarginX)`} or {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginY|`top margin (MarginY)`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     * - `XS+#` or `YS+#`: Use the left edge `XS` or top edge `YS` of the last control marked as a {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Section|`Section`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     * 
     * **Common Styles and Other Options**  
     * Prefix with `-` to disable an option and `+` (or no sign) to add an option.  
     * - `Vstring`: Assign a {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Name|`Name`} to a control where `string` is the new name.  
     *   A control's name can be used to get a reference to that control from a GUI object.  
     *
     *         GuiControl.Opt('+VMyControl')  
     *         GuiControl := Gui['MyControl']  
     * - `Events`: Handled by the control's {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm|`OnEvent()` method}.  
     * - `C#`: Set text color where `#` is one of the following:  
     *   - RGB hex value (0x prefix is optional): `C0x000000` to `CFFffFF`  
     *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}: `CBlack`, `CSilver`, `CGray`, `CWhite`, `CMaroon`, `CRed`, `CPurple`  
     *     `CFuchsia`, `CGreen`, `CLime`, `COlive`, `CYellow`, `CNavy`, `CBlue`, `CTeal`, `CAqua`  
     *   - Reset/Default: `CDefault` or `C`  
     *   This can also be set by the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#SetFont|`GuiCtrl.SetFont()`} method.
     * - `Disabled`: Disables the control preventing user focus or modifications of the contents.  
     *   Control can be enabled using `-Disabled` or setting {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Enabled`} to true.  
     *   A `0` for enabled or `1` for disabled can immediately follow `Disabled`.  
     *
     *       con.Opt('+Disabled0')
     *       var := 1, con.Opt('+Disabled' var)
     * - `Hidden`: The control is initially invisible.  
     *   Use `-Hidden` or {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Visible`} to unhide it.  
     *   A `0` for visible or `1` for hidden can immediately follow `Hidden`.  
     * 
     *       con.Opt('+Hidden0')
     *       var := 1, con.Opt('+Hidden' var)
     * - `Section`: Sets current control as the new Section for use with the {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#xs|`XS` and `YS`} positioning options.  
     * - `Tabstop`: Disabling Tabstop of a control prevents the user from tabbing to that control.  
     * - `VScroll`: Provide or remove a vertical scroll bar if appropriate for this type of control.  
     * - `HScroll`: Provide or remove a horizontal scroll bar if appropriate for this type of control.  
     *  
     * **Uncommon Styles and Options**
     * - `Background#`: Sets control background color where `#` is one of the following:  
     *   - RGB hex value (0x prefix is optional): `000000` to `0xFFffFf`
     *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}: `Black`, `Silver`, `Gray`, `White`, `Maroon`, `Red`, `Purple`  
     *   `Fuchsia`, `Green`, `Lime`, `Olive`, `Yellow`, `Navy`, `Blue`, `Teal`, `Aqua`  
     *   - Reset/Default: `BackgroundDefault` or `-Background`  
     * - `Border`: Provides a thin-line border around the control. Adding a border to an  
     *   existing control might require increasing the control's width and height by 1 pixel.  
     * - `Redraw`: Enable/disable redrawing (visual updates) of a control (Uses: {@link https://learn.microsoft.com/en-us/windows/win32/gdi/wm-setredraw|`WM_SETREDRAW`}).  
     *   Disabling redraw `-Redraw` prior to adding multiple controls/elements can increase performance.  
     *   Enable redraw `+Redraw` after all changes have been made.  
     * - `Theme`: Used to override the window's current theme setting for the newly created control.  
     *   This setting has no effect when used on an existing control. See {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Theme|`GUI's +/-Theme option`} for details.  
     * - {@link https://www.autohotkey.com/docs/v2/misc/Styles.htm|`Style Number`} `+0x0`: Specify a plus or minus sign  
     *   followed immediately by a decimal or hexadecimal style number.  
     * - {@link https://learn.microsoft.com/en-us/windows/win32/winmsg/extended-window-styles|`ExStyle Number`} `+E0x0`: Specify a plus or minus sign  
     *   followed immediately by the letter E and a decimal or hexadecimal extended style number.  
     * @param {(Integer)} [Date] - Set the highlighted date. 
     * @returns {(Gui.MonthCal)} MonthCal Control Object
     * @example <caption>  
     * Adding a Month Calendar to a GUI.</caption>
     * goo := Gui()
     * goo.txt := goo.AddText('xm ym', 'Hold shift or control to select a range of dates:')
     * goo.Cal := goo.AddMonthCal('xm Multi', 20221220)
     * goo.Show('AutoSize')
     */
    AddMonthCal([Options:='', Date:=A_Now]) => Gui.MonthCal
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Add|`AddPic()`} adds control containing an image.  
     * Types: `ICO`,`CUR`,`ANI`,`EXE`,`DLL`,`CPL`,`SCR`,`PNG`,`TIF`,`Exif`,`WMF`,`EMF`, Other Icon Resources  
     * GDIPlus (AltSubmit): `GIF`,`JPG`,`BMP`,`ICO`,`CUR`,`ANI`,`PNG`,`TIF`,`Exif`,`WMF`,`EMF`  
     * @method
     * @param {(String)} Options - Any {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#OtherOptions|`general`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm|`control-specific`} options, separated by spaces/tabs.  
     * **Control Specific Options**  
     * - `Icon#`: Use a specific icon from an icon group where # is the number of the icon.
     * 
     * **Positioning and Sizing of Controls**  
     * - `R#`: Rows of height where `#` is the number of rows. This number can be a float.  
     *   `R` takes precedence over `H`.  
     * - `W#`: Width of control where `#` is a number of pixels.  
     * - `H#`: Height of control where `#` is a number of pixels.  
     * - `WP+#` or `HP+#`: Use previous control's width `WP` or height `HP`.  
     *   Width or height can be adjusted by adding `+#` or `-#` where `#` is a number of pixels.  
     * - `X#` or `Y#`: Static `X` or `Y` coordinates where `#` is the pixel location on the Gui.  
     * - `X+#` or `Y+#`: Use the right edge `X+#` or bottom edge `Y+#` of the previous control as a start point.  
     *   The position can be offset with `+#` or `-#` where `#` is a number of pixels.  
     * - `XP+#` or `YP+#`: Use the left edge `XP+#` or top edge `YP+#` of the previous control as a start point.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     *   Useful for aligning controls in a {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#GroupBox|`GroupBox`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Tab|`Tab`}.  
     * - `XM+#` or `YM+#`: Use Gui {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginX|`left margin (MarginX)`} or {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginY|`top margin (MarginY)`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     * - `XS+#` or `YS+#`: Use the left edge `XS` or top edge `YS` of the last control marked as a {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Section|`Section`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     * 
     * **Common Styles and Other Options**  
     * - `Vstring`: Assign a {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Name|`Name`} to a control where `string` is the new name.  
     *   A control's name can be used to get a reference to that control from a GUI object.  
     *
     *         GuiControl.Opt('+VMyControl')  
     *         GuiControl := Gui['MyControl']  
     * - `Events`: Handled by the control's {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm|`OnEvent()` method}.  
     * Prefix with `-` to disable an option and `+` (or no sign) to add an option.  
     * - `AltSubmit`: Use Microsoft's GDIPlus.dll to load the image.  
     * This might result in a different appearance for GIF, BMP, and icon images.  
     * - `Disabled`: Disables the control preventing user focus or modifications of the contents.  
     *   Control can be enabled using `-Disabled` or setting {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Enabled`} to true.  
     *   A `0` for enabled or `1` for disabled can immediately follow `Disabled`.  
     *
     *       con.Opt('+Disabled0')
     *       var := 1, con.Opt('+Disabled' var)
     * - `Hidden`: The control is initially invisible.  
     *   Use `-Hidden` or {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Visible`} to unhide it.  
     *   A `0` for visible or `1` for hidden can immediately follow `Hidden`.  
     * 
     *       con.Opt('+Hidden0')
     *       var := 1, con.Opt('+Hidden' var)
     * - `Section`: Sets current control as the new Section for use with the {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#xs|`XS` and `YS`} positioning options.  
     * - `Tabstop`: Disabling Tabstop of a control prevents the user from tabbing to that control.  
     * - `VScroll`: Provide or remove a vertical scroll bar if appropriate for this type of control.  
     * - `HScroll`: Provide or remove a horizontal scroll bar if appropriate for this type of control.  
     *  
     * **Uncommon Styles and Options**
     * - `BackgroundTrans`: Applies a transparent background, allowing controls behind  
     *   the Picture to show through. Use `+Background` to remove this option later.  
     *   Known limitation: BackgroundTrans might not work in a Tab control that contains a ListView.  
     * - `Background#`: Sets control background color where `#` is one of the following:  
     *   - RGB hex value (0x prefix is optional): `000000` to `0xFFffFf`
     *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}: `Black`, `Silver`, `Gray`, `White`, `Maroon`, `Red`, `Purple`  
     *   `Fuchsia`, `Green`, `Lime`, `Olive`, `Yellow`, `Navy`, `Blue`, `Teal`, `Aqua`  
     *   - Reset/Default: `BackgroundDefault` or `-Background`  
     * - `Border`: Provides a thin-line border around the control. Adding a border to an  
     *   existing control might require increasing the control's width and height by 1 pixel.  
     * - `Redraw`: Enable/disable redrawing (visual updates) of a control (Uses: {@link https://learn.microsoft.com/en-us/windows/win32/gdi/wm-setredraw|`WM_SETREDRAW`}).  
     *   Disabling redraw `-Redraw` prior to adding multiple controls/elements can increase performance.  
     *   Enable redraw `+Redraw` after all changes have been made.  
     * - `Theme`: Used to override the window's current theme setting for the newly created control.  
     *   This setting has no effect when used on an existing control. See {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Theme|`GUI's +/-Theme option`} for details.  
     * - {@link https://www.autohotkey.com/docs/v2/misc/Styles.htm|`Style Number`} `+0x0`: Specify a plus or minus sign  
     *   followed immediately by a decimal or hexadecimal style number.  
     * - {@link https://learn.microsoft.com/en-us/windows/win32/winmsg/extended-window-styles|`ExStyle Number`} `+E0x0`: Specify a plus or minus sign  
     *   followed immediately by the letter E and a decimal or hexadecimal extended style number.  
     * @param {(String)} [Path] - Path to the image file.  
     * If a full path isn't provided, {@link https://www.autohotkey.com/docs/v2/Variables.htm#WorkingDir|`A_WorkingDir`} is used as the starting directory.  
     * @returns {(Gui.Pic)} Picture Control Object  
     * @example <caption>  
     * Using picture controls to view AHK's 5 built-in icons.</caption>
     * ; Adding AHK's tray icons to a GUI
     * goo := Gui()
     * loop 5
     *     goo.AddPic('ym Icon' A_Index, A_AhkPath)
     * goo.Show()
     */
    AddPic([Options:='', Path:=A_WorkingDir]) => Gui.Pic
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Add|`AddPicture()`} adds control containing an image.  
     * Types: `ICO`,`CUR`,`ANI`,`EXE`,`DLL`,`CPL`,`SCR`,`PNG`,`TIF`,`Exif`,`WMF`,`EMF`, Other Icon Resources  
     * GDIPlus (AltSubmit): `GIF`,`JPG`,`BMP`,`ICO`,`CUR`,`ANI`,`PNG`,`TIF`,`Exif`,`WMF`,`EMF`  
     * @method
     * @param {(String)} Options - Any {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#OtherOptions|`general`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm|`control-specific`} options, separated by spaces/tabs.  
     * **Control Specific Options**  
     * - `Icon#`: Use a specific icon from an icon group where # is the number of the icon.
     * 
     * **Positioning and Sizing of Controls**  
     * - `R#`: Rows of height where `#` is the number of rows. This number can be a float.  
     *   `R` takes precedence over `H`.  
     * - `W#`: Width of control where `#` is a number of pixels.  
     * - `H#`: Height of control where `#` is a number of pixels.  
     * - `WP+#` or `HP+#`: Use previous control's width `WP` or height `HP`.  
     *   Width or height can be adjusted by adding `+#` or `-#` where `#` is a number of pixels.  
     * - `X#` or `Y#`: Static `X` or `Y` coordinates where `#` is the pixel location on the Gui.  
     * - `X+#` or `Y+#`: Use the right edge `X+#` or bottom edge `Y+#` of the previous control as a start point.  
     *   The position can be offset with `+#` or `-#` where `#` is a number of pixels.  
     * - `XP+#` or `YP+#`: Use the left edge `XP+#` or top edge `YP+#` of the previous control as a start point.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     *   Useful for aligning controls in a {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#GroupBox|`GroupBox`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Tab|`Tab`}.  
     * - `XM+#` or `YM+#`: Use Gui {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginX|`left margin (MarginX)`} or {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginY|`top margin (MarginY)`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     * - `XS+#` or `YS+#`: Use the left edge `XS` or top edge `YS` of the last control marked as a {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Section|`Section`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     * 
     * **Common Styles and Other Options**  
     * - `Vstring`: Assign a {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Name|`Name`} to a control where `string` is the new name.  
     *   A control's name can be used to get a reference to that control from a GUI object.  
     *
     *         GuiControl.Opt('+VMyControl')  
     *         GuiControl := Gui['MyControl']  
     * - `Events`: Handled by the control's {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm|`OnEvent()` method}.  
     * Prefix with `-` to disable an option and `+` (or no sign) to add an option.  
     * - `AltSubmit`: Use Microsoft's GDIPlus.dll to load the image.  
     * This might result in a different appearance for GIF, BMP, and icon images.  
     * - `Disabled`: Disables the control preventing user focus or modifications of the contents.  
     *   Control can be enabled using `-Disabled` or setting {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Enabled`} to true.  
     *   A `0` for enabled or `1` for disabled can immediately follow `Disabled`.  
     *
     *       con.Opt('+Disabled0')
     *       var := 1, con.Opt('+Disabled' var)
     * - `Hidden`: The control is initially invisible.  
     *   Use `-Hidden` or {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Visible`} to unhide it.  
     *   A `0` for visible or `1` for hidden can immediately follow `Hidden`.  
     * 
     *       con.Opt('+Hidden0')
     *       var := 1, con.Opt('+Hidden' var)
     * - `Section`: Sets current control as the new Section for use with the {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#xs|`XS` and `YS`} positioning options.  
     * - `Tabstop`: Disabling Tabstop of a control prevents the user from tabbing to that control.  
     * - `VScroll`: Provide or remove a vertical scroll bar if appropriate for this type of control.  
     * - `HScroll`: Provide or remove a horizontal scroll bar if appropriate for this type of control.  
     *  
     * **Uncommon Styles and Options**
     * - `BackgroundTrans`: Applies a transparent background, allowing controls behind  
     *   the Picture to show through. Use `+Background` to remove this option later.  
     *   Known limitation: BackgroundTrans might not work in a Tab control that contains a ListView.  
     * - `Background#`: Sets control background color where `#` is one of the following:  
     *   - RGB hex value (0x prefix is optional): `000000` to `0xFFffFf`
     *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}: `Black`, `Silver`, `Gray`, `White`, `Maroon`, `Red`, `Purple`  
     *   `Fuchsia`, `Green`, `Lime`, `Olive`, `Yellow`, `Navy`, `Blue`, `Teal`, `Aqua`  
     *   - Reset/Default: `BackgroundDefault` or `-Background`  
     * - `Border`: Provides a thin-line border around the control. Adding a border to an  
     *   existing control might require increasing the control's width and height by 1 pixel.  
     * - `Redraw`: Enable/disable redrawing (visual updates) of a control (Uses: {@link https://learn.microsoft.com/en-us/windows/win32/gdi/wm-setredraw|`WM_SETREDRAW`}).  
     *   Disabling redraw `-Redraw` prior to adding multiple controls/elements can increase performance.  
     *   Enable redraw `+Redraw` after all changes have been made.  
     * - `Theme`: Used to override the window's current theme setting for the newly created control.  
     *   This setting has no effect when used on an existing control. See {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Theme|`GUI's +/-Theme option`} for details.  
     * - {@link https://www.autohotkey.com/docs/v2/misc/Styles.htm|`Style Number`} `+0x0`: Specify a plus or minus sign  
     *   followed immediately by a decimal or hexadecimal style number.  
     * - {@link https://learn.microsoft.com/en-us/windows/win32/winmsg/extended-window-styles|`ExStyle Number`} `+E0x0`: Specify a plus or minus sign  
     *   followed immediately by the letter E and a decimal or hexadecimal extended style number.  
     * @param {(String)} [Path] - Path to the image file.  
     * If a full path isn't provided, {@link https://www.autohotkey.com/docs/v2/Variables.htm#WorkingDir|`A_WorkingDir`} is used as the starting directory.  
     * @returns {(Gui.Pic)} Picture Control Object  
     * @example <caption>  
     * Using picture controls to view AHK's 5 built-in icons.</caption>
     * ; Adding AHK's tray icons to a GUI
     * goo := Gui()
     * loop 5
     *     goo.AddPicture('ym Icon' A_Index, A_AhkPath)
     * goo.Show()
     */
    AddPicture([Options:='', Path:=A_WorkingDir]) => Gui.Pic
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Add|`AddProgress()`} adds a dual-color bar that can progress from empty to full to indicate  
     * a filled range. Commonly used to show the completion status of an operation.  
     * @param {(String)} Options - Any {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#OtherOptions|`general`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm|`control-specific`} options, separated by spaces/tabs.  
     * **Control Specific Options**  
     * - `RangeMIN-MAX`: Sets the minimum and maximum ends of the progress bar. Default is `Range0-100`.  
     * - `Smooth`: Displays a simple, continuous bar.  
     * - `Vertical`: Makes the bar rise or fall vertically rather than horizontally.  
     * 
     * **Positioning and Sizing of Controls**  
     * - `R#`: Rows of text where `#` is the number of rows. This number can be a float.  
     *   `R` takes precedence over `H`.  
     * - `W#`: Width of control where `#` is a number of pixels.  
     *   Default size: Vertical - Current font size x2, Horizontal - Current font size x15
     * - `H#`: Height of control where `#` is a number of pixels.  
     *   Default size: Vertical - 5 rows, Horizontal - Current font size x2
     * - `WP+#` or `HP+#`: Use previous control's width `WP` or height `HP`.  
     *   Width or height can be adjusted by adding `+#` or `-#` where `#` is a number of pixels.  
     * - `X#` or `Y#`: Static `X` or `Y` coordinates where `#` is the pixel location on the Gui.  
     * - `X+#` or `Y+#`: Use the right edge `X+#` or bottom edge `Y+#` of the previous control as a start point.  
     *   The position can be offset with `+#` or `-#` where `#` is a number of pixels.  
     * - `XP+#` or `YP+#`: Use the left edge `XP+#` or top edge `YP+#` of the previous control as a start point.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     *   Useful for aligning controls in a {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#GroupBox|`GroupBox`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Tab|`Tab`}.  
     * - `XM+#` or `YM+#`: Use Gui {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginX|`left margin (MarginX)`} or {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginY|`top margin (MarginY)`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     * - `XS+#` or `YS+#`: Use the left edge `XS` or top edge `YS` of the last control marked as a {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Section|`Section`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     * 
     * **Common Styles and Other Options**  
     * Prefix with `-` to disable an option and `+` (or no sign) to add an option.  
     * - `Vstring`: Assign a {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Name|`Name`} to a control where `string` is the new name.  
     *   A control's name can be used to get a reference to that control from a GUI object.  
     *
     *         GuiControl.Opt('+VMyControl')  
     *         GuiControl := Gui['MyControl']  
     * - `Events`: Handled by the control's {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm|`OnEvent()` method}.  
     * - `C#`: Sets the color of the mian bar where `#` is one of the following:  
     *   - RGB hex value (0x prefix is optional): `C0x000000` to `CFFffFF`  
     *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}: `CBlack`, `CSilver`, `CGray`, `CWhite`, `CMaroon`, `CRed`, `CPurple`  
     *     `CFuchsia`, `CGreen`, `CLime`, `COlive`, `CYellow`, `CNavy`, `CBlue`, `CTeal`, `CAqua`  
     *   - Reset/Default: `CDefault` or `C`  
     * - `Disabled`: Disables the control preventing user focus or modifications of the contents.  
     *   Control can be enabled using `-Disabled` or setting {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Enabled`} to true.  
     *   A `0` for enabled or `1` for disabled can immediately follow `Disabled`.  
     *
     *       con.Opt('+Disabled0')
     *       var := 1, con.Opt('+Disabled' var)
     * - `Hidden`: The control is initially invisible.  
     *   Use `-Hidden` or {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Visible`} to unhide it.  
     *   A `0` for visible or `1` for hidden can immediately follow `Hidden`.  
     * 
     *       con.Opt('+Hidden0')
     *       var := 1, con.Opt('+Hidden' var)
     * - `Section`: Sets current control as the new Section for use with the {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#xs|`XS` and `YS`} positioning options.  
     * - `Tabstop`: Disabling Tabstop of a control prevents the user from tabbing to that control.  
     * - `VScroll`: Provide or remove a vertical scroll bar if appropriate for this type of control.  
     * - `HScroll`: Provide or remove a horizontal scroll bar if appropriate for this type of control.  
     *  
     * **Uncommon Styles and Options**
     * - `Background#`: Sets background color of the progress bar where `#` is one of the following:  
     *   - RGB hex value (0x prefix is optional): `000000` to `0xFFffFf`
     *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}: `Black`, `Silver`, `Gray`, `White`, `Maroon`, `Red`, `Purple`  
     *   `Fuchsia`, `Green`, `Lime`, `Olive`, `Yellow`, `Navy`, `Blue`, `Teal`, `Aqua`  
     *   - Reset/Default: `BackgroundDefault` or `-Background`  
     * - `Border`: Provides a thin-line border around the control. Adding a border to an  
     *   existing control might require increasing the control's width and height by 1 pixel.  
     * - `Redraw`: Enable/disable redrawing (visual updates) of a control (Uses: {@link https://learn.microsoft.com/en-us/windows/win32/gdi/wm-setredraw|`WM_SETREDRAW`}).  
     *   Disabling redraw `-Redraw` prior to adding multiple controls/elements can increase performance.  
     *   Enable redraw `+Redraw` after all changes have been made.  
     * - `Theme`: Used to override the window's current theme setting for the newly created control.  
     *   This setting has no effect when used on an existing control. See {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Theme|`GUI's +/-Theme option`} for details.  
     * - {@link https://www.autohotkey.com/docs/v2/misc/Styles.htm|`Style Number`} `+0x0`: Specify a plus or minus sign  
     *   followed immediately by a decimal or hexadecimal style number.  
     * - {@link https://learn.microsoft.com/en-us/windows/win32/winmsg/extended-window-styles|`ExStyle Number`} `+E0x0`: Specify a plus or minus sign  
     *   followed immediately by the letter E and a decimal or hexadecimal extended style number.  
     * @param {(String|Number)} [StartingPos] - Sets the starting position of the progress bar.  
     * If omitted, it starts as close to 0 as the control allows.  
     * @returns {(Gui.Progress)} Progress Control Object
     * @example <caption>  
     * Using a Progress Bar to simluate a loading bar.</caption>
     * goo := Gui()
     * goo.btn := goo.AddButton('xm ym w100 h30 Center', 'Start')
     * goo.btn.OnEvent('Click', btn_click)
     * goo.prog_bar := goo.AddProgress('x+5 w300 h30 cLime +BackgroundBlack Smooth')
     * goo.Show()
     * 
     * btn_click(btn, info) {
     *     switch btn.Text {
     *         case 'Finished!': ExitApp()
     *         case 'Start': fill_bar(btn.gui)
     *     }
     * }
     * 
     * fill_bar(gu) {
     *     goo.prog_bar.Value += Random(2, 10)
     *     if (goo.prog_bar.Value < 100)
     *         goo.btn.Text := goo.prog_bar.Value '%'
     *         ,callback := fill_bar.Bind(gu)
     *         ,SetTimer(callback, -400)
     *     else goo.btn.Text := 'Finished!'
     * }
     */
    AddProgress([Options:='', StartingPos:=0]) => Gui.Progress
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Add|`AddRadio()`} adds a small button that can be clicked.  
     * Radio buttons are added in groups and only 1 button in the group can be active at a time.  
     * @method
     * @param {(String)} Options - Any {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#OtherOptions|`general`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm|`control-specific`} options, separated by spaces/tabs.  
     * **Control Specific Options**  
     * - `Checked`: Starts the button in the checked/on state.
     * - `Group`: Starts a new radio group. A new group is automatically started when a non-radio control is added.  
     *  
     * **Positioning and Sizing of Controls**  
     * - `R#`: Rows of text where `#` is the number of rows. This number can be a float.  
     *   `R` takes precedence over `H`.  
     * - `W#`: Width of control where `#` is a number of pixels.  
     * - `H#`: Height of control where `#` is a number of pixels.  
     * - `WP+#` or `HP+#`: Use previous control's width `WP` or height `HP`.  
     *   Width or height can be adjusted by adding `+#` or `-#` where `#` is a number of pixels.  
     * - `X#` or `Y#`: Static `X` or `Y` coordinates where `#` is the pixel location on the Gui.  
     * - `X+#` or `Y+#`: Use the right edge `X+#` or bottom edge `Y+#` of the previous control as a start point.  
     *   The position can be offset with `+#` or `-#` where `#` is a number of pixels.  
     * - `XP+#` or `YP+#`: Use the left edge `XP+#` or top edge `YP+#` of the previous control as a start point.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     *   Useful for aligning controls in a {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#GroupBox|`GroupBox`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Tab|`Tab`}.  
     * - `XM+#` or `YM+#`: Use Gui {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginX|`left margin (MarginX)`} or {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginY|`top margin (MarginY)`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     * - `XS+#` or `YS+#`: Use the left edge `XS` or top edge `YS` of the last control marked as a {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Section|`Section`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     * 
     * **Common Styles and Other Options**  
     * Prefix with `-` to disable an option and `+` (or no sign) to add an option.  
     * - `Vstring`: Assign a {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Name|`Name`} to a control where `string` is the new name.  
     *   A control's name can be used to get a reference to that control from a GUI object.  
     *
     *         GuiControl.Opt('+VMyControl')  
     *         GuiControl := Gui['MyControl']  
     * - `Events`: Handled by the control's {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm|`OnEvent()` method}.  
     * - `C#`: Set text color where `#` is one of the following:  
     *   - RGB hex value (0x prefix is optional): `C0x000000` to `CFFffFF`  
     *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}: `CBlack`, `CSilver`, `CGray`, `CWhite`, `CMaroon`, `CRed`, `CPurple`  
     *     `CFuchsia`, `CGreen`, `CLime`, `COlive`, `CYellow`, `CNavy`, `CBlue`, `CTeal`, `CAqua`  
     *   - Reset/Default: `CDefault` or `C`  
     * - `Disabled`: Disables the control preventing user focus or modifications of the contents.  
     *   Control can be enabled using `-Disabled` or setting {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Enabled`} to true.  
     *   A `0` for enabled or `1` for disabled can immediately follow `Disabled`.  
     *
     *       con.Opt('+Disabled0')
     *       var := 1, con.Opt('+Disabled' var)
     * - `Hidden`: The control is initially invisible.  
     *   Use `-Hidden` or {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Visible`} to unhide it.  
     *   A `0` for visible or `1` for hidden can immediately follow `Hidden`.  
     * 
     *       con.Opt('+Hidden0')
     *       var := 1, con.Opt('+Hidden' var)
     * - `Left`: Left-justifies the control's text within its available width.  
     * - `Right`: Right-justifies the control's text within its available width.  
     *   This also moves the box from the left to the right side of the control.  
     * - `Center`: Centers the control's text within its available width.  
     * - `Section`: Sets current control as the new Section for use with the {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#xs|`XS` and `YS`} positioning options.  
     * - `Tabstop`: Disabling Tabstop of a control prevents the user from tabbing to that control.  
     * - `Wrap`: Enables word-wrapping of the control's contents within its available width.  
     * - `VScroll`: Provide or remove a vertical scroll bar if appropriate for this type of control.  
     * - `HScroll`: Provide or remove a horizontal scroll bar if appropriate for this type of control.  
     *  
     * **Uncommon Styles and Options**
     * - `Background#`: Sets control background color where `#` is one of the following:  
     *   - RGB hex value (0x prefix is optional): `000000` to `0xFFffFf`
     *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}: `Black`, `Silver`, `Gray`, `White`, `Maroon`, `Red`, `Purple`  
     *   `Fuchsia`, `Green`, `Lime`, `Olive`, `Yellow`, `Navy`, `Blue`, `Teal`, `Aqua`  
     *   - Reset/Default: `BackgroundDefault` or `-Background`  
     * - `Border`: Provides a thin-line border around the control. Adding a border to an  
     *   existing control might require increasing the control's width and height by 1 pixel.  
     * - `Redraw`: Enable/disable redrawing (visual updates) of a control (Uses: {@link https://learn.microsoft.com/en-us/windows/win32/gdi/wm-setredraw|`WM_SETREDRAW`}).  
     *   Disabling redraw `-Redraw` prior to adding multiple controls/elements can increase performance.  
     *   Enable redraw `+Redraw` after all changes have been made.  
     * - `Theme`: Used to override the window's current theme setting for the newly created control.  
     *   This setting has no effect when used on an existing control. See {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Theme|`GUI's +/-Theme option`} for details.  
     * - {@link https://www.autohotkey.com/docs/v2/misc/Styles.htm|`Style Number`} `+0x0`: Specify a plus or minus sign  
     *   followed immediately by a decimal or hexadecimal style number.  
     * - {@link https://learn.microsoft.com/en-us/windows/win32/winmsg/extended-window-styles|`ExStyle Number`} `+E0x0`: Specify a plus or minus sign  
     *   followed immediately by the letter E and a decimal or hexadecimal extended style number.  
     * @param {(String)} [Label] - Text label to show next to the button.  
     * Text appears left of the control when the `Right` option is being used.  
     * @returns {(Gui.Radio)} Radio Control Object
     * @example <caption>  
     * Add a radio button that switches background colors.</caption>
     * goo := Gui()
     * goo.BackColor := 0x40FF00
     * goo.rad_g := goo.AddRadio('xm w150 v0x40FF00', 'Green')
     * goo.rad_g.OnEvent('Click', color_change)
     * goo.rad_y := goo.AddRadio('xm w150 v0xFFFF00', 'Yellow')
     * goo.rad_y.OnEvent('Click', color_change)
     * goo.Show('AutoSize')
     * 
     * color_change(con, inf) => con.gui.BackColor := con.Name
     */
    AddRadio([Options:='', Label:='']) => Gui.Radio
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Add|`AddSlider()`} adds a sliding bar (Trackbar) the user can move  
     * along a vertical or horizontal track to adjust values between a defined range.  
     * Window's volume bar is an example of a commonly used slider.
     * @method
     * @param {(String)} Options - Any {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#OtherOptions|`general`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm|`control-specific`} options, separated by spaces/tabs.  
     * **Control Specific Options**  
     * - `Buddy1#` and `Buddy2#`: Specify controls to automatically reposition  
     *   at the ends of the slider, where `#` is the name or HWND of the control.  
     *   The {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Text|`control Text`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#ClassNN|`ClassNN`} can also be used, but only up to the first space or tab.  
     *   Buddy1 appears left/top of the slider and Buddy2 appears right/bottom of it.  
     * - `Invert`: Reverses the slider direction. Low goes on the right/bottom and high on the left/top.  
     *   This option will not work with the `ToolTip` option.  
     * - `Center`: The slider (thumb) is blunt on both ends instead of pointed at one end.  
     * - `Left`: The slider (thumb) will upward, or to the left if `Vertical`.  
     * - `NoTicks`: Omit tickmarks alongside the slider track.  
     * - `Line#`: Distance to move when an arrow key is pressed, where `#` is the number of positions.  
     * - `Page#`: Distance to move when PgUp\PgDn is pressed, where `#` is the number of positions.  
     * - `RangeMIN-MAX`: Set slider value range, where `MIN` is the minimum and `MAX` is the maximum.  
     *   Default is `Range0-100`.  
     * - `Thick#`: Set slider (thumb) thickenss where `#` is pixels.  
     * - `TickInterval#`: Add marks along the track where `#` is how often each tick should show.  
     * - `ToolTip`: When dragging the thumb, the current value is shown in a tooltip.  
     *   To adjust tooltip position, use `ToolTipTop`, `ToolTipBottom`.  
     *   `ToolTipLeft`, `ToolTipRight` are used with `Vertical` sliders.  
     *   This option does not work with the `Invert` option.  
     * 
     * **Positioning and Sizing of Controls**  
     * - `R#`: Rows of space, where `#` is the number of rows. This number can be a float.  
     *   `R` takes precedence over `H`.  
     * - `W#`: Width of control where `#` is a number of pixels.  
     *   Default: Sliders (horizontal): Current font size x15
     * - `H#`: Height of control where `#` is a number of pixels.  
     *   Defaults: Sliders (vertical): 5 rows, Sliders (horizontal): 30px  
     * - `WP+#` or `HP+#`: Use previous control's width `WP` or height `HP`.  
     *   Width or height can be adjusted by adding `+#` or `-#` where `#` is a number of pixels.  
     * - `X#` or `Y#`: Static `X` or `Y` coordinates where `#` is the pixel location on the Gui.  
     * - `X+#` or `Y+#`: Use the right edge `X+#` or bottom edge `Y+#` of the previous control as a start point.  
     *   The position can be offset with `+#` or `-#` where `#` is a number of pixels.  
     * - `XP+#` or `YP+#`: Use the left edge `XP+#` or top edge `YP+#` of the previous control as a start point.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     *   Useful for aligning controls in a {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#GroupBox|`GroupBox`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Tab|`Tab`}.  
     * - `XM+#` or `YM+#`: Use Gui {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginX|`left margin (MarginX)`} or {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginY|`top margin (MarginY)`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     * - `XS+#` or `YS+#`: Use the left edge `XS` or top edge `YS` of the last control marked as a {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Section|`Section`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     * 
     * **Common Styles and Other Options**  
     * Prefix with `-` to disable an option and `+` (or no sign) to add an option.  
     * - `Vstring`: Assign a {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Name|`Name`} to a control where `string` is the new name.  
     *   A control's name can be used to get a reference to that control from a GUI object.  
     *
     *         GuiControl.Opt('+VMyControl')  
     *         GuiControl := Gui['MyControl']  
     * - `Events`: Handled by the control's {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm|`OnEvent()` method}.  
     * - `AltSubmit`: While dragging the slider (thumb), the {@link |`change event`} fires continuously.  
     *   Normally, the change event only fires on mouse release.  
     * - `Disabled`: Disables the control preventing user focus or modifications of the contents.  
     *   Control can be enabled using `-Disabled` or setting {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Enabled`} to true.  
     *   A `0` for enabled or `1` for disabled can immediately follow `Disabled`.  
     *
     *       con.Opt('+Disabled0')
     *       var := 1, con.Opt('+Disabled' var)
     * - `Hidden`: The control is initially invisible.  
     *   Use `-Hidden` or {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Visible`} to unhide it.  
     *   A `0` for visible or `1` for hidden can immediately follow `Hidden`.  
     * 
     *       con.Opt('+Hidden0')
     *       var := 1, con.Opt('+Hidden' var)
     * - `Section`: Sets current control as the new Section for use with the {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#xs|`XS` and `YS`} positioning options.  
     * - `Tabstop`: Disabling Tabstop of a control prevents the user from tabbing to that control.  
     * - `VScroll`: Provide or remove a vertical scroll bar if appropriate for this type of control.  
     * - `HScroll`: Provide or remove a horizontal scroll bar if appropriate for this type of control.  
     *  
     * **Uncommon Styles and Options**
     * - `Background#`: Sets control background color where `#` is one of the following:  
     *   - RGB hex value (0x prefix is optional): `000000` to `0xFFffFf`
     *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}: `Black`, `Silver`, `Gray`, `White`, `Maroon`, `Red`, `Purple`  
     *   `Fuchsia`, `Green`, `Lime`, `Olive`, `Yellow`, `Navy`, `Blue`, `Teal`, `Aqua`  
     *   - Reset/Default: `BackgroundDefault` or `-Background`  
     * - `Border`: Provides a thin-line border around the control. Adding a border to an  
     *   existing control might require increasing the control's width and height by 1 pixel.  
     * - `Redraw`: Enable/disable redrawing (visual updates) of a control (Uses: {@link https://learn.microsoft.com/en-us/windows/win32/gdi/wm-setredraw|`WM_SETREDRAW`}).  
     *   Disabling redraw `-Redraw` prior to adding multiple controls/elements can increase performance.  
     *   Enable redraw `+Redraw` after all changes have been made.  
     * - `Theme`: Used to override the window's current theme setting for the newly created control.  
     *   This setting has no effect when used on an existing control. See {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Theme|`GUI's +/-Theme option`} for details.  
     * - {@link https://www.autohotkey.com/docs/v2/misc/Styles.htm|`Style Number`} `+0x0`: Specify a plus or minus sign  
     *   followed immediately by a decimal or hexadecimal style number.  
     * - {@link https://learn.microsoft.com/en-us/windows/win32/winmsg/extended-window-styles|`ExStyle Number`} `+E0x0`: Specify a plus or minus sign  
     *   followed immediately by the letter E and a decimal or hexadecimal extended style number.  
     * @param {(String)} [StartingPos] - Sets the starting position of the slider bar.  
     * @returns {(Gui.Slider)} Slider Control Object
     * @example <caption>  
     * Creating a volume slider GUI.</caption>
     * goo := Gui()
     * start_vol := SoundGetVolume()
     * goo.AddText('xm ym w100', 'Volume Slider:')
     * goo.txt_vol := goo.AddText('x+10', Round(start_vol))
     * goo.sld_vol := goo.AddSlider('xm w200 AltSubmit Range0-100 cRed', start_vol)
     * goo.sld_vol.OnEvent('Change', vol_adjust)
     * goo.Show('AutoSize')
     * 
     * vol_adjust(control, *) {
     *     SoundSetVolume(control.Value)
     *     control.gui.txt_vol.Value := control.Value
     * }
     */
    AddSlider([Options:='', StartingPos:=0]) => Gui.Slider
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Add|`AddStatusBar()`} adds a row of text and/or icons to the bottom  
     * of a window and typically reports conditions and information about the GUI.
     * @method
     * @param {(String)} Options - Any {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#OtherOptions|`general`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm|`control-specific`} options, separated by spaces/tabs.  
     * **Positioning and Sizing of Controls**  
     * - `R#`: Rows of text where `#` is the number of rows. This number can be a float.  
     *   `R` takes precedence over `H`.  
     * - `W#`: Width of control where `#` is a number of pixels.  
     * - `H#`: Height of control where `#` is a number of pixels.  
     * - `WP+#` or `HP+#`: Use previous control's width `WP` or height `HP`.  
     *   Width or height can be adjusted by adding `+#` or `-#` where `#` is a number of pixels.  
     * - `X#` or `Y#`: Static `X` or `Y` coordinates where `#` is the pixel location on the Gui.  
     * - `X+#` or `Y+#`: Use the right edge `X+#` or bottom edge `Y+#` of the previous control as a start point.  
     *   The position can be offset with `+#` or `-#` where `#` is a number of pixels.  
     * - `XP+#` or `YP+#`: Use the left edge `XP+#` or top edge `YP+#` of the previous control as a start point.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     *   Useful for aligning controls in a {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#GroupBox|`GroupBox`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Tab|`Tab`}.  
     * - `XM+#` or `YM+#`: Use Gui {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginX|`left margin (MarginX)`} or {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginY|`top margin (MarginY)`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     * - `XS+#` or `YS+#`: Use the left edge `XS` or top edge `YS` of the last control marked as a {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Section|`Section`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     * 
     * **Common Styles and Other Options**  
     * Prefix with `-` to disable an option and `+` (or no sign) to add an option.  
     * - `Vstring`: Assign a {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Name|`Name`} to a control where `string` is the new name.  
     *   A control's name can be used to get a reference to that control from a GUI object.  
     *
     *         GuiControl.Opt('+VMyControl')  
     *         GuiControl := Gui['MyControl']  
     * - `Events`: Handled by the control's {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm|`OnEvent()` method}.  
     * - `Disabled`: Disables the control preventing user focus or modifications of the contents.  
     *   Control can be enabled using `-Disabled` or setting {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Enabled`} to true.  
     *   A `0` for enabled or `1` for disabled can immediately follow `Disabled`.  
     *
     *       con.Opt('+Disabled0')
     *       var := 1, con.Opt('+Disabled' var)
     * - `Hidden`: The control is initially invisible.  
     *   Use `-Hidden` or {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Visible`} to unhide it.  
     *   A `0` for visible or `1` for hidden can immediately follow `Hidden`.  
     * 
     *       con.Opt('+Hidden0')
     *       var := 1, con.Opt('+Hidden' var)
     * - `Section`: Sets current control as the new Section for use with the {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#xs|`XS` and `YS`} positioning options.  
     *  
     * **Uncommon Styles and Options**
     * - `Background#`: Sets control background color where `#` is one of the following:  
     *   - RGB hex value (0x prefix is optional): `000000` to `0xFFffFf`
     *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}: `Black`, `Silver`, `Gray`, `White`, `Maroon`, `Red`, `Purple`  
     *   `Fuchsia`, `Green`, `Lime`, `Olive`, `Yellow`, `Navy`, `Blue`, `Teal`, `Aqua`  
     *   - Reset/Default: `BackgroundDefault` or `-Background`  
     *   The {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Theme|`-Theme`} option {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#StatusBar_Usage|`is required`} to change the StatusBar background.  
     * - `Border`: Provides a thin-line border around the control. Adding a border to an  
     *   existing control might require increasing the control's width and height by 1 pixel.  
     * - `Redraw`: Enable/disable redrawing (visual updates) of a control (Uses: {@link https://learn.microsoft.com/en-us/windows/win32/gdi/wm-setredraw|`WM_SETREDRAW`}).  
     *   Disabling redraw `-Redraw` prior to adding multiple controls/elements can increase performance.  
     *   Enable redraw `+Redraw` after all changes have been made.  
     * - `Theme`: Used to override the window's current theme setting for the newly created control.  
     *   This setting has no effect when used on an existing control. See {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Theme|`GUI's +/-Theme option`} for details.  
     * - {@link https://www.autohotkey.com/docs/v2/misc/Styles.htm|`Style Number`} `+0x0`: Specify a plus or minus sign  
     *   followed immediately by a decimal or hexadecimal style number.  
     * - {@link https://learn.microsoft.com/en-us/windows/win32/winmsg/extended-window-styles|`ExStyle Number`} `+E0x0`: Specify a plus or minus sign  
     *   followed immediately by the letter E and a decimal or hexadecimal extended style number.  
     * @param {(String)} [Label] - Sets the text for the first area of the status bar.
     * @returns {(Gui.StatusBar)} StatusBar Control Object
     * @example <caption>  
     * Creating a Status Bar to show Edit Control info.</caption>
     * goo := Gui()
     * goo.MarginX := goo.MarginY := 0
     * goo.edit := goo.AddEdit('x0 y0 w400 h400')
     * goo.edit.OnEvent('Change', update_sb)
     * goo.sb := goo.AddStatusBar('xm ym w100')
     * goo.sb.SetParts(100, 100)
     * update_sb(goo.sb)
     * goo.Show('AutoSize')
     * 
     * update_sb(control, *) {
     *     chars := control.gui.edit.Value
     *     StrReplace(chars, '`n', '`n', 1, &lines)
     *     control.gui.sb.SetText('Total Chars: ' StrLen(chars), 1)
     *     control.gui.sb.SetText('Lines: ' (lines+1), 2)
     * }
     */
    AddStatusBar([Options:='', Label:='']) => Gui.StatusBar
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Add|`AddText()`} adds a control for text that the user cannot edit.  
     * Often used to label other controls or give details/instructions.  
     * @method
     * @param {(String)} Options - Any {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#OtherOptions|`general`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm|`control-specific`} options, separated by spaces/tabs.  
     * **Positioning and Sizing of Controls**  
     * - `R#`: Rows of text where `#` is the number of rows. This number can be a float.  
     *   `R` takes precedence over `H`.  
     * - `W#`: Width of control where `#` is a number of pixels.  
     * - `H#`: Height of control where `#` is a number of pixels.  
     * - `WP+#` or `HP+#`: Use previous control's width `WP` or height `HP`.  
     *   Width or height can be adjusted by adding `+#` or `-#` where `#` is a number of pixels.  
     * - `X#` or `Y#`: Static `X` or `Y` coordinates where `#` is the pixel location on the Gui.  
     * - `X+#` or `Y+#`: Use the right edge `X+#` or bottom edge `Y+#` of the previous control as a start point.  
     *   The position can be offset with `+#` or `-#` where `#` is a number of pixels.  
     * - `XP+#` or `YP+#`: Use the left edge `XP+#` or top edge `YP+#` of the previous control as a start point.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     *   Useful for aligning controls in a {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#GroupBox|`GroupBox`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Tab|`Tab`}.  
     * - `XM+#` or `YM+#`: Use Gui {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginX|`left margin (MarginX)`} or {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginY|`top margin (MarginY)`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     * - `XS+#` or `YS+#`: Use the left edge `XS` or top edge `YS` of the last control marked as a {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Section|`Section`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     * 
     * **Common Styles and Other Options**  
     * Prefix with `-` to disable an option and `+` (or no sign) to add an option.  
     * - `Vstring`: Assign a {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Name|`Name`} to a control where `string` is the new name.  
     *   A control's name can be used to get a reference to that control from a GUI object.  
     *
     *         GuiControl.Opt('+VMyControl')  
     *         GuiControl := Gui['MyControl']  
     * - `Events`: Handled by the control's {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm|`OnEvent()` method}.  
     * - `C#`: Set text color where `#` is one of the following:  
     *   - RGB hex value (0x prefix is optional): `C0x000000` to `CFFffFF`  
     *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}: `CBlack`, `CSilver`, `CGray`, `CWhite`, `CMaroon`, `CRed`, `CPurple`  
     *     `CFuchsia`, `CGreen`, `CLime`, `COlive`, `CYellow`, `CNavy`, `CBlue`, `CTeal`, `CAqua`  
     *   - Reset/Default: `CDefault` or `C`  
     * - `Disabled`: Disables the control preventing user focus or modifications of the contents.  
     *   Control can be enabled using `-Disabled` or setting {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Enabled`} to true.  
     *   A `0` for enabled or `1` for disabled can immediately follow `Disabled`.  
     *
     *       con.Opt('+Disabled0')
     *       var := 1, con.Opt('+Disabled' var)
     * - `Hidden`: The control is initially invisible.  
     *   Use `-Hidden` or {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Visible`} to unhide it.  
     *   A `0` for visible or `1` for hidden can immediately follow `Hidden`.  
     * 
     *       con.Opt('+Hidden0')
     *       var := 1, con.Opt('+Hidden' var)
     * - `Left`: Left-justifies the control's text within its available width.  
     * - `Right`: Right-justifies the control's text within its available width.  
     * - `Center`: Centers the control's text within its available width.  
     * - `Section`: Sets current control as the new Section for use with the {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#xs|`XS` and `YS`} positioning options.  
     * - `Wrap`: Enables word-wrapping of the control's contents within its available width.  
     * - `VScroll`: Provide or remove a vertical scroll bar if appropriate for this type of control.  
     * - `HScroll`: Provide or remove a horizontal scroll bar if appropriate for this type of control.  
     *  
     * **Uncommon Styles and Options**
     * - `BackgroundTrans`: Applies a transparent background, allowing controls behind  
     *   the GroupBox to show through. Use `+Background` to remove this option later.  
     *   Known limitation: BackgroundTrans might not work in a Tab control that contains a ListView.  
     * - `Background#`: Sets control background color where `#` is one of the following:  
     *   - RGB hex value (0x prefix is optional): `000000` to `0xFFffFf`
     *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}: `Black`, `Silver`, `Gray`, `White`, `Maroon`, `Red`, `Purple`  
     *   `Fuchsia`, `Green`, `Lime`, `Olive`, `Yellow`, `Navy`, `Blue`, `Teal`, `Aqua`  
     *   - Reset/Default: `BackgroundDefault` or `-Background`  
     * - `Border`: Provides a thin-line border around the control. Adding a border to an  
     *   existing control might require increasing the control's width and height by 1 pixel.  
     * - `Redraw`: Enable/disable redrawing (visual updates) of a control (Uses: {@link https://learn.microsoft.com/en-us/windows/win32/gdi/wm-setredraw|`WM_SETREDRAW`}).  
     *   Disabling redraw `-Redraw` prior to adding multiple controls/elements can increase performance.  
     *   Enable redraw `+Redraw` after all changes have been made.  
     * - `Theme`: Used to override the window's current theme setting for the newly created control.  
     *   This setting has no effect when used on an existing control. See {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Theme|`GUI's +/-Theme option`} for details.  
     * - {@link https://www.autohotkey.com/docs/v2/misc/Styles.htm|`Style Number`} `+0x0`: Specify a plus or minus sign  
     *   followed immediately by a decimal or hexadecimal style number.  
     * - {@link https://learn.microsoft.com/en-us/windows/win32/winmsg/extended-window-styles|`ExStyle Number`} `+E0x0`: Specify a plus or minus sign  
     *   followed immediately by the letter E and a decimal or hexadecimal extended style number.  
     * @param {(String)} [Text] - The text to display in the control.
     * @returns {(Gui.Text)} Text Control Object
     * @example <caption>  
     * Making a scrolling ticker using a Text Control.</caption>
     * goo := Gui()
     * text := '      Creating scrolling text.      '
     * goo.txt := goo.AddText('xm ym w200 h20 -Wrap', text)
     * goo.txt.SetFont('S10', 'Consolas')
     * ticker(goo.txt)
     * goo.Show()
     * 
     * ticker(con) {
     *     con.Text := SubStr(con.Text, 2) SubStr(con.Text, 1, 1)
     *     callback := ticker.Bind(con)
     *     SetTimer(callback, -100)
     * }
     */
    AddText([Options:='', Text:='']) => Gui.Text
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Add|`AddTreeView()`} adds a TreeView display to represent a hierarchy of items  
     * by indenting child items beneath their parents.  
     * Window's Explorer drive/folder tree is a common example of a TreeView.  
     * @method
     * @param {(String)} Options - Any {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#OtherOptions|`general`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm|`control-specific`} options, separated by spaces/tabs.  
     * **Control Specific Options**  
     * - `Buttons`: Specify `-Buttons` to remove the `+` and `-` symbols from the left of each item.  
     * - `Checked`: Add a checkbox at left of each item.  
     *   When {@link https://www.autohotkey.com/docs/v2/lib/TreeView.htm#Add|`adding an item`}, use the {@link https://www.autohotkey.com/docs/v2/lib/TreeView.htm#Check|`Check` option} to start it checked.  
     * - `ImageList#`: Add icons to a TreeView where `#` is the {@link https://www.autohotkey.com/docs/v2/lib/ListView.htm#IL|`ImageListID`} returned from a previous call to {@link https://www.autohotkey.com/docs/v2/lib/ListView.htm#IL_Create|`IL_Create()`}.  
     *   This option can only be used when creating a TreeView. Use {@link https://www.autohotkey.com/docs/v2/lib/ListView.htm#SetImageList|`SetImageList()`}.  
     * - `Lines`: Specify `-Lines` disables the connecting lines between parents and children.  
     *   This also prevents the `+` and `-` buttons from being shown for top-level items.  zzz
     * - `ReadOnly`: Specify `-ReadOnly` to allow the editing of each item.  
     *   The items can be edited with F2 (see {@link https://www.autohotkey.com/docs/v2/lib/ListView.htm#WantF2|`WantF2`}) or by clicking the label,  
     *   waiting a brief moment, then clicking again.  
     * - `WantF2`: Specify `-WantF2` to prevent F2 from editing the current selected item.  
     *   WantF2 only works if `-ReadOnly` is also in effect.  
     *  
     * **Positioning and Sizing of Controls**  
     * - `R#`: Number of rows to display where `#` is the row number. This number can be a float.  
     *   `R` takes precedence over `H`.  
     * - `W#`: Width of control where `#` is a number of pixels.  
     * - `H#`: Height of control where `#` is a number of pixels.  
     * - `WP+#` or `HP+#`: Use previous control's width `WP` or height `HP`.  
     *   Width or height can be adjusted by adding `+#` or `-#` where `#` is a number of pixels.  
     * - `X#` or `Y#`: Static `X` or `Y` coordinates where `#` is the pixel location on the Gui.  
     * - `X+#` or `Y+#`: Use the right edge `X+#` or bottom edge `Y+#` of the previous control as a start point.  
     *   The position can be offset with `+#` or `-#` where `#` is a number of pixels.  
     * - `XP+#` or `YP+#`: Use the left edge `XP+#` or top edge `YP+#` of the previous control as a start point.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     *   Useful for aligning controls in a {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#GroupBox|`GroupBox`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Tab|`Tab`}.  
     * - `XM+#` or `YM+#`: Use Gui {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginX|`left margin (MarginX)`} or {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginY|`top margin (MarginY)`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     * - `XS+#` or `YS+#`: Use the left edge `XS` or top edge `YS` of the last control marked as a {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Section|`Section`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     * 
     * **Common Styles and Other Options**  
     * Prefix with `-` to disable an option and `+` (or no sign) to add an option.  
     * - `Vstring`: Assign a {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Name|`Name`} to a control where `string` is the new name.  
     *   A control's name can be used to get a reference to that control from a GUI object.  
     *
     *         GuiControl.Opt('+VMyControl')  
     *         GuiControl := Gui['MyControl']  
     * - `Events`: Handled by the control's {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm|`OnEvent()` method}.  
     * - `C#`: Set text color where `#` is one of the following:  
     *   - RGB hex value (0x prefix is optional): `C0x000000` to `CFFffFF`  
     *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}: `CBlack`, `CSilver`, `CGray`, `CWhite`, `CMaroon`, `CRed`, `CPurple`  
     *     `CFuchsia`, `CGreen`, `CLime`, `COlive`, `CYellow`, `CNavy`, `CBlue`, `CTeal`, `CAqua`  
     *   - Reset/Default: `CDefault` or `C`  
     * - `Disabled`: Disables the control preventing user focus or modifications of the contents.  
     *   Control can be enabled using `-Disabled` or setting {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Enabled`} to true.  
     *   A `0` for enabled or `1` for disabled can immediately follow `Disabled`.  
     *
     *       con.Opt('+Disabled0')
     *       var := 1, con.Opt('+Disabled' var)
     * - `Hidden`: The control is initially invisible.  
     *   Use `-Hidden` or {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Visible`} to unhide it.  
     *   A `0` for visible or `1` for hidden can immediately follow `Hidden`.  
     * 
     *       con.Opt('+Hidden0')
     *       var := 1, con.Opt('+Hidden' var)
     * - `Section`: Sets current control as the new Section for use with the {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#xs|`XS` and `YS`} positioning options.  
     * - `Tabstop`: Disabling Tabstop of a control prevents the user from tabbing to that control.  
     * - `VScroll`: Provide or remove a vertical scroll bar if appropriate for this type of control.  
     * - `HScroll`: Provide or remove a horizontal scroll bar if appropriate for this type of control.  
     *  
     * **Uncommon Styles and Options**
     * - `Background#`: Sets control background color where `#` is one of the following:  
     *   - RGB hex value (0x prefix is optional): `000000` to `0xFFffFf`
     *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}: `Black`, `Silver`, `Gray`, `White`, `Maroon`, `Red`, `Purple`  
     *   `Fuchsia`, `Green`, `Lime`, `Olive`, `Yellow`, `Navy`, `Blue`, `Teal`, `Aqua`  
     *   - Reset/Default: `BackgroundDefault` or `-Background`  
     * - `Border`: Provides a thin-line border around the control. Adding a border to an  
     *   existing control might require increasing the control's width and height by 1 pixel.  
     * - `Redraw`: Enable/disable redrawing (visual updates) of a control (Uses: {@link https://learn.microsoft.com/en-us/windows/win32/gdi/wm-setredraw|`WM_SETREDRAW`}).  
     *   Disabling redraw `-Redraw` prior to adding multiple controls/elements can increase performance.  
     *   Enable redraw `+Redraw` after all changes have been made.  
     * - `Theme`: Used to override the window's current theme setting for the newly created control.  
     *   This setting has no effect when used on an existing control. See {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Theme|`GUI's +/-Theme option`} for details.  
     * - {@link https://www.autohotkey.com/docs/v2/misc/Styles.htm|`Style Number`} `+0x0`: Specify a plus or minus sign  
     *   followed immediately by a decimal or hexadecimal style number.  
     * - {@link https://learn.microsoft.com/en-us/windows/win32/winmsg/extended-window-styles|`ExStyle Number`} `+E0x0`: Specify a plus or minus sign  
     *   followed immediately by the letter E and a decimal or hexadecimal extended style number.  
     * @param {(String)} [Text]  
     * @returns {(Gui.TreeView)} TreeView Control Object
     * @example <caption>  
     * Creating a TreeView with multiple parents and children.</caption>
     * goo := Gui()
     * goo.tree := goo.AddTreeView('xm ym w200 h200')
     * goo.tree.OnEvent('Click', lv_click)
     * loop 3 {
     *     p_num := A_Index
     *     parent := goo.tree.Add('Parent ' p_num, 0)
     *     loop 3
     *         child := goo.tree.Add('Child ' p_num '-' A_Index, parent)
     * }
     * goo.Show('AutoSize')
     * 
     * lv_click(con, info) {
     *     con.gui.Title := con.GetText(con.GetSelection())
     * }
     */
    AddTreeView([Options:='', Text:='']) => Gui.TreeView
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Add|`AddUpDown()`} attaches a pair of clickable arrow buttons to the  
     * previous control (called a `Buddy`) that can increase or decrease the Buddy's value.  
     * @method
     * @param {(String)} Options - Any {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#OtherOptions|`general`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm|`control-specific`} options, separated by spaces/tabs.  
     * **Control Specific Options**  
     * - `Horz`: Arrow buttons point left/right, become wider, and show under the Buddy.  
     *   Buttons are visually disconnected from the control.  
     *   Adding option `+16` forces the buttons to attach to their original position.
     * - `Left`/`Right`: The side of the Buddy the UpDown attaches to. Right is default.  
     *   This option cannot be changed after control creation.  
     * - `RangeMIN-MAX`: Set slider value range, where `MIN` is the minimum and `MAX` is the maximum.  
     *   Default is `Range0-100`.  
     * - `Wrap`: Going past the max range causes the number to start back at minimum.  
     *   Going below minimum wraps back around to max.  
     * - `16`: Specify `-16` to detach the UpDown from its Buddy.  
     *   It can now be positioned like a standard control with `W`, `H`, `X`, `Y` options.  
     * - `0x80`: Removes the 3 digit separator from being being displayed in the Buddy.  
     *    These seperators are removed automaticlaly when value is gotten from the UpDown control.  
     *    script retrieves it from the UpDown control itself rather than the buddy control.
     * - `Increments`: {@link https://www.autohotkey.com/docs/v2/scripts/index.htm#Custom_Increments_for_UpDown_Controls|`Guide to changing UpDown inc/decrementation`}
     * - `Hexadecimal Format`: To change display to hex, use this UpDown {@link https://www.autohotkey.com/docs/v2/lib/SendMessage.htm|`Message`}:  
     * 
     *       UDM_SETBASE := 0x046D, SendMessage(UDM_SETBASE, 16, 0, "msctls_updown321")
     * 
     * **Positioning and Sizing of Controls**  
     * - `R#`: Rows of text where `#` is the number of rows. This number can be a float.  
     *   `R` takes precedence over `H`.  
     * - `W#`: Width of control where `#` is a number of pixels.  
     * - `H#`: Height of control where `#` is a number of pixels.  
     * - `WP+#` or `HP+#`: Use previous control's width `WP` or height `HP`.  
     *   Width or height can be adjusted by adding `+#` or `-#` where `#` is a number of pixels.  
     * - `X#` or `Y#`: Static `X` or `Y` coordinates where `#` is the pixel location on the Gui.  
     * - `X+#` or `Y+#`: Use the right edge `X+#` or bottom edge `Y+#` of the previous control as a start point.  
     *   The position can be offset with `+#` or `-#` where `#` is a number of pixels.  
     * - `XP+#` or `YP+#`: Use the left edge `XP+#` or top edge `YP+#` of the previous control as a start point.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     *   Useful for aligning controls in a {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#GroupBox|`GroupBox`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Tab|`Tab`}.  
     * - `XM+#` or `YM+#`: Use Gui {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginX|`left margin (MarginX)`} or {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginY|`top margin (MarginY)`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     * - `XS+#` or `YS+#`: Use the left edge `XS` or top edge `YS` of the last control marked as a {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Section|`Section`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     * 
     * **Common Styles and Other Options**  
     * Prefix with `-` to disable an option and `+` (or no sign) to add an option.  
     * - `Vstring`: Assign a {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Name|`Name`} to a control where `string` is the new name.  
     *   A control's name can be used to get a reference to that control from a GUI object.  
     *
     *         GuiControl.Opt('+VMyControl')  
     *         GuiControl := Gui['MyControl']  
     * - `Events`: Handled by the control's {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm|`OnEvent()` method}.  
     * - `Disabled`: Disables the control preventing user focus or modifications of the contents.  
     *   Control can be enabled using `-Disabled` or setting {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Enabled`} to true.  
     *   A `0` for enabled or `1` for disabled can immediately follow `Disabled`.  
     *
     *       con.Opt('+Disabled0')
     *       var := 1, con.Opt('+Disabled' var)
     * - `Hidden`: The control is initially invisible.  
     *   Use `-Hidden` or {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Visible`} to unhide it.  
     *   A `0` for visible or `1` for hidden can immediately follow `Hidden`.  
     * 
     *       con.Opt('+Hidden0')
     *       var := 1, con.Opt('+Hidden' var)
     * - `Section`: Sets current control as the new Section for use with the {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#xs|`XS` and `YS`} positioning options.  
     * - `Tabstop`: Disabling Tabstop of a control prevents the user from tabbing to that control.  
     * - `VScroll`: Provide or remove a vertical scroll bar if appropriate for this type of control.  
     * - `HScroll`: Provide or remove a horizontal scroll bar if appropriate for this type of control.  
     *  
     * **Uncommon Styles and Options**
     * - `Border`: Provides a thin-line border around the control. Adding a border to an  
     *   existing control might require increasing the control's width and height by 1 pixel.  
     * - `Redraw`: Enable/disable redrawing (visual updates) of a control (Uses: {@link https://learn.microsoft.com/en-us/windows/win32/gdi/wm-setredraw|`WM_SETREDRAW`}).  
     *   Disabling redraw `-Redraw` prior to adding multiple controls/elements can increase performance.  
     *   Enable redraw `+Redraw` after all changes have been made.  
     * - `Theme`: Used to override the window's current theme setting for the newly created control.  
     *   This setting has no effect when used on an existing control. See {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Theme|`GUI's +/-Theme option`} for details.  
     * - {@link https://www.autohotkey.com/docs/v2/misc/Styles.htm|`Style Number`} `+0x0`: Specify a plus or minus sign  
     *   followed immediately by a decimal or hexadecimal style number.  
     * - {@link https://learn.microsoft.com/en-us/windows/win32/winmsg/extended-window-styles|`ExStyle Number`} `+E0x0`: Specify a plus or minus sign  
     *   followed immediately by the letter E and a decimal or hexadecimal extended style number.  
     * @param {(String)} [StartingPos] - Sets the starting position of the buddy control.  
     * @returns {(Gui.UpDown)} UpDown Control Object
     * @example <caption>  
     * Using UpDown controls to change window width.</caption>
     * goo := Gui()
     * goo.AddText('xm ym w150 +Wrap', 'Adjust window width with '
     *     'up/down keys scroll wheel, or up/down control arrows.'
     *     '`nMin width: 200'
     *     '`nMax width: 300')
     * goo.edit := goo.AddEdit('xm w150 +ReadOnly')
     * goo.edit.OnEvent('Change', update_win_size)
     * goo.ud_edit := goo.AddUpDown('+Range200-300', 250)
     * goo.ud_edit.OnEvent('Change', update_win_size)
     * goo.Show('')
     * update_win_size(goo.edit)
     * 
     * update_win_size(con, *) => con.gui.Move(,,con.Value)
     */
    AddUpDown([Options:='', StartingPos:=0]) => Gui.UpDown
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Add|`AddComboBox()`} adds a control that is combination of a DropDownList  
     * and an edit control.  
     * @method
     * @param {(String)} Options - Any {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#OtherOptions|`general`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm|`control-specific`} options, separated by spaces/tabs.  
     * **Control Specific Options**  
     * - `Choose#`: Pre-selects an item where `#` is the line number of the item.  
     * - `Uppercase` or `Lowercase`: Converts all items in the list to uppercase or lowercase.  
     * - `Sort`: Item list is sorted alphabetically. This option also enables incremental searching.  
     *   Meaning an item can be selected by typing its name.  
     * - `Limit`: Restrict the user's input to the visible width of the ComboBox's edit field.  
     * - `Simple`: Replaces the ComboBox's DropDownList with a {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#ListBox|`ListBox`}.  
     * 
     * **Positioning and Sizing of Controls**  
     * - `R#`: Max amount of items to show in the control list without needing to scroll,  
     *   where `#` is the number of visible rows. This number can be a float.  
     *   `R` takes precedence over `H`.  
     * - `W#`: Width of control where `#` is a number of pixels.  
     *   Default value: Current font size x15
     * - `H#`: Height of control where `#` is a number of pixels.  
     *   Default value: 3 rows  
     * - `WP+#` or `HP+#`: Use previous control's width `WP` or height `HP`.  
     *   Width or height can be adjusted by adding `+#` or `-#` where `#` is a number of pixels.  
     * - `X#` or `Y#`: Static `X` or `Y` coordinates where `#` is the pixel location on the Gui.  
     * - `X+#` or `Y+#`: Use the right edge `X+#` or bottom edge `Y+#` of the previous control as a start point.  
     *   The position can be offset with `+#` or `-#` where `#` is a number of pixels.  
     * - `XP+#` or `YP+#`: Use the left edge `XP+#` or top edge `YP+#` of the previous control as a start point.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     *   Useful for aligning controls in a {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#GroupBox|`GroupBox`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Tab|`Tab`}.  
     * - `XM+#` or `YM+#`: Use Gui {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginX|`left margin (MarginX)`} or {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginY|`top margin (MarginY)`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     * - `XS+#` or `YS+#`: Use the left edge `XS` or top edge `YS` of the last control marked as a {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Section|`Section`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     *  
     * **Common Styles and Other Options**  
     * Prefix with `-` to disable an option and `+` (or no sign) to add an option.  
     * - `Vstring`: Assign a {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Name|`Name`} to a control where `string` is the new name.  
     *   A control's name can be used to get a reference to that control from a GUI object.  
     *
     *         GuiControl.Opt('+VMyControl')  
     *         GuiControl := Gui['MyControl']  
     * - `Events`: Handled by the control's {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm|`OnEvent()` method}.  
     * - `AltSubmit`: {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Submit|`Gui.Submit`} will record the item position(s) instead of the actual text.  
     *   If no item is selected, the text of the edit field is stored, even if the string is empty.   
     * - `C#`: Set text color where `#` is one of the following:  
     *   - RGB hex value (0x prefix is optional): `C0x000000` to `CFFffFF`  
     *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}: `CBlack`, `CSilver`, `CGray`, `CWhite`, `CMaroon`, `CRed`, `CPurple`  
     *     `CFuchsia`, `CGreen`, `CLime`, `COlive`, `CYellow`, `CNavy`, `CBlue`, `CTeal`, `CAqua`  
     *   - Reset/Default: `CDefault` or `C`  
     *   Text color applies to the Edit field and to {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#ComboBox|`Simple`} ListBoxes.  
     * - `Disabled`: Disables the control preventing user focus or modifications of the contents.  
     *   Control can be enabled using `-Disabled` or setting {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Enabled`} to true.  
     *   A `0` for enabled or `1` for disabled can immediately follow `Disabled`.  
     *
     *       con.Opt('+Disabled0')
     *       var := 1, con.Opt('+Disabled' var)
     * - `Hidden`: The control is initially invisible.  
     *   Use `-Hidden` or {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Visible`} to unhide it.  
     *   A `0` for visible or `1` for hidden can immediately follow `Hidden`.  
     * 
     *       con.Opt('+Hidden0')
     *       var := 1, con.Opt('+Hidden' var)
     * - `Section`: Sets current control as the new Section for use with the {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#xs|`XS` and `YS`} positioning options.  
     * - `Tabstop`: Disabling Tabstop of a control prevents the user from tabbing to that control.  
     * - `Wrap`: Enables word-wrapping of the control's contents within its available width.  
     *   This is enabled by default for almost all controls.  
     * - `VScroll`: Provide or remove a vertical scroll bar if appropriate for this type of control.  
     * - `HScroll`: Provide or remove a horizontal scroll bar if appropriate for this type of control.  
     *  
     * **Uncommon Styles and Options**
     * - `Background#`: Sets control background color where `#` is one of the following:  
     *   - RGB hex value (0x prefix is optional): `000000` to `0xFFffFf`
     *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}: `Black`, `Silver`, `Gray`, `White`, `Maroon`, `Red`, `Purple`  
     *   `Fuchsia`, `Green`, `Lime`, `Olive`, `Yellow`, `Navy`, `Blue`, `Teal`, `Aqua`  
     *   - Reset/Default: `BackgroundDefault` or `-Background`  
     *   Background color applies to the Edit field and to {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#ComboBox|`Simple`} ListBoxes.  
     * - `Border`: Provides a thin-line border around the control. Adding a border to an  
     *   existing control might require increasing the control's width and height by 1 pixel.  
     * - `Redraw`: Enable/disable redrawing (visual updates) of a control (Uses: {@link https://learn.microsoft.com/en-us/windows/win32/gdi/wm-setredraw|`WM_SETREDRAW`}).  
     *   Disabling redraw `-Redraw` prior to adding multiple controls/elements can increase performance.  
     *   Enable redraw `+Redraw` after all changes have been made.  
     * - `Theme`: Used to override the window's current theme setting for the newly created control.  
     *   This setting has no effect when used on an existing control. See {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Theme|`GUI's +/-Theme option`} for details.  
     * - {@link https://www.autohotkey.com/docs/v2/misc/Styles.htm|`Style Number`} `+0x0`: Specify a plus or minus sign  
     *   followed immediately by a decimal or hexadecimal style number.  
     * - {@link https://learn.microsoft.com/en-us/windows/win32/winmsg/extended-window-styles|`ExStyle Number`} `+E0x0`: Specify a plus or minus sign  
     *   followed immediately by the letter E and a decimal or hexadecimal extended style number.  
     * @param {(String)} [Text]  - An array of strings to populate the ComboBox.  
     * @returns {(Gui.ComboBox)} ComboBox Control Object
     * @example <caption>  
     * Showcasing different ComboBox setups.</caption>
     * goo := Gui()
     * con_w := 250
     * item_list := ['Banana', 'Cherry', 'Apple']
     * goo.AddText('xm ym w' con_w, 'Unsorted Normal Combo Box'
     *         . '`nItem 2 pre-selected:')
     * goo.AddText('x+50 yp w' con_w, 'Sorted Simple Combo Box'
     *         . '`nItem 2 pre-selected:')
     * goo.AddComboBox('xm w' con_w ' Choose2', item_list)
     * goo.AddComboBox('x+50 w' con_w ' Choose2 Simple Sort', item_list)
     * goo.Show('AutoSize')
     */
    AddComboBox([Options:='', Text:=[]]) => Gui.ComboBox
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Add|`AddDDL()`} adds a single-lined control that, when clicked,  
     * produces a list of items to select from.  
     * @method
     * @param {(String)} Options - Any {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#OtherOptions|`general`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm|`control-specific`} options, separated by spaces/tabs.  
     * **Control Specific Options**  
     * - `Choose#`: Pre-selects an item where `#` is the line number of the item.  
     * - `Uppercase` or `Lowercase`: Converts all items in the list to uppercase or lowercase.  
     * - `Sort`: Item list is sorted alphabetically. 
     * 
     * **Positioning and Sizing of Controls**  
     * - `R#`: Max amount of items to show in the control list without needing to scroll,  
     *   where `#` is the number of visible rows. This number can be a float.  
     *   `R` takes precedence over `H`.  
     * - `W#`: Width of control where `#` is a number of pixels.  
     *   Default value: Current font size x15
     * - `H#`: Height of control where `#` is a number of pixels.  
     *   Default value: 3 rows  
     * - `WP+#` or `HP+#`: Use previous control's width `WP` or height `HP`.  
     *   Width or height can be adjusted by adding `+#` or `-#` where `#` is a number of pixels.  
     * - `X#` or `Y#`: Static `X` or `Y` coordinates where `#` is the pixel location on the Gui.  
     * - `X+#` or `Y+#`: Use the right edge `X+#` or bottom edge `Y+#` of the previous control as a start point.  
     *   The position can be offset with `+#` or `-#` where `#` is a number of pixels.  
     * - `XP+#` or `YP+#`: Use the left edge `XP+#` or top edge `YP+#` of the previous control as a start point.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     *   Useful for aligning controls in a {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#GroupBox|`GroupBox`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Tab|`Tab`}.  
     * - `XM+#` or `YM+#`: Use Gui {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginX|`left margin (MarginX)`} or {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginY|`top margin (MarginY)`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     * - `XS+#` or `YS+#`: Use the left edge `XS` or top edge `YS` of the last control marked as a {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Section|`Section`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     *  
     * **Common Styles and Other Options**  
     * Prefix with `-` to disable an option and `+` (or no sign) to add an option.  
     * - `Vstring`: Assign a {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Name|`Name`} to a control where `string` is the new name.  
     *   A control's name can be used to get a reference to that control from a GUI object.  
     *
     *         GuiControl.Opt('+VMyControl')  
     *         GuiControl := Gui['MyControl']  
     * - `Events`: Handled by the control's {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm|`OnEvent()` method}.  
     * - `AltSubmit`: {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Submit|`Gui.Submit`} will record the item position(s) instead of the actual text.  
     *   If no item is selected, the text of the edit field is stored, even if the string is empty.   
     * - `C#`: Set text color where `#` is one of the following:  
     *   - RGB hex value (0x prefix is optional): `C0x000000` to `CFFffFF`  
     *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}: `CBlack`, `CSilver`, `CGray`, `CWhite`, `CMaroon`, `CRed`, `CPurple`  
     *     `CFuchsia`, `CGreen`, `CLime`, `COlive`, `CYellow`, `CNavy`, `CBlue`, `CTeal`, `CAqua`  
     *   - Reset/Default: `CDefault` or `C`  
     *   Text color does not apply to the dropped down list.  
     * - `Disabled`: Disables the control preventing user focus or modifications of the contents.  
     *   Control can be enabled using `-Disabled` or setting {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Enabled`} to true.  
     *   A `0` for enabled or `1` for disabled can immediately follow `Disabled`.  
     *
     *       con.Opt('+Disabled0')
     *       var := 1, con.Opt('+Disabled' var)
     * - `Hidden`: The control is initially invisible.  
     *   Use `-Hidden` or {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Visible`} to unhide it.  
     *   A `0` for visible or `1` for hidden can immediately follow `Hidden`.  
     * 
     *       con.Opt('+Hidden0')
     *       var := 1, con.Opt('+Hidden' var)
     * - `Section`: Sets current control as the new Section for use with the {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#xs|`XS` and `YS`} positioning options.  
     * - `Tabstop`: Disabling Tabstop of a control prevents the user from tabbing to that control.  
     * - `Wrap`: Enables word-wrapping of the control's contents within its available width.  
     *   This is enabled by default for almost all controls.  
     * - `VScroll`: Provide or remove a vertical scroll bar if appropriate for this type of control.  
     * - `HScroll`: Provide or remove a horizontal scroll bar if appropriate for this type of control.  
     *  
     * **Uncommon Styles and Options**
     * - `Background#`: Sets control background color where `#` is one of the following:  
     *   - RGB hex value (0x prefix is optional): `000000` to `0xFFffFf`
     *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}: `Black`, `Silver`, `Gray`, `White`, `Maroon`, `Red`, `Purple`  
     *   `Fuchsia`, `Green`, `Lime`, `Olive`, `Yellow`, `Navy`, `Blue`, `Teal`, `Aqua`  
     *   - Reset/Default: `BackgroundDefault` or `-Background`  
     *   Background color does not apply to the dropped down list.  
     * - `Border`: Provides a thin-line border around the control. Adding a border to an  
     *   existing control might require increasing the control's width and height by 1 pixel.  
     * - `Redraw`: Enable/disable redrawing (visual updates) of a control (Uses: {@link https://learn.microsoft.com/en-us/windows/win32/gdi/wm-setredraw|`WM_SETREDRAW`}).  
     *   Disabling redraw `-Redraw` prior to adding multiple controls/elements can increase performance.  
     *   Enable redraw `+Redraw` after all changes have been made.  
     * - `Theme`: Used to override the window's current theme setting for the newly created control.  
     *   This setting has no effect when used on an existing control. See {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Theme|`GUI's +/-Theme option`} for details.  
     * - {@link https://www.autohotkey.com/docs/v2/misc/Styles.htm|`Style Number`} `+0x0`: Specify a plus or minus sign  
     *   followed immediately by a decimal or hexadecimal style number.  
     * - {@link https://learn.microsoft.com/en-us/windows/win32/winmsg/extended-window-styles|`ExStyle Number`} `+E0x0`: Specify a plus or minus sign  
     *   followed immediately by the letter E and a decimal or hexadecimal extended style number.  
     * @param {(Array)} [List] - An array of strings to represent each choice in the list.  
     * @returns {(Gui.DDL)} DropDownList Control Object
     * @example <caption>  
     * Changing background color with Drop Down List of colors.</caption>
     * color_list := ['Default', 'Red','Yellow','Green','Cyan','Blue','Magenta']
     * goo := Gui()
     * goo.ddl := goo.AddDDL('xm ym Choose1', color_list)
     * goo.ddl.OnEvent('Change', color_change)
     * goo.Show('w200 h100')
     * 
     * color_change(con, info) {
     *     color_map := Map('Red' ,0xFF0000 ,'Yellow',0xFFFF00 ,'Green',0xFF00
     *                     ,'Cyan',0xFFFF   ,'Magenta',0xFF00FF,'Blue',0xFF )
     *     color_map.Default := 'Default'
     *     con.gui.BackColor := color_map[con.Text]
     * }
     */
    AddDDL([Options:='', List:=[]]) => Gui.DDL
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Add|`AddDropDownList()`} adds a single-line control that, when clicked, drops down a list of choices to select from.  
     * @method
     * @param {(String)} Options - Any {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#OtherOptions|`general`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm|`control-specific`} options, separated by spaces/tabs.  
     * **Control Specific Options**  
     * - `Choose#`: Pre-selects an item where `#` is the line number of the item.  
     * - `Uppercase` or `Lowercase`: Converts all items in the list to uppercase or lowercase.  
     * - `Sort`: Item list is sorted alphabetically. 
     * 
     * **Positioning and Sizing of Controls**  
     * - `R#`: Max amount of items to show in the control list without needing to scroll,  
     *   where `#` is the number of visible rows. This number can be a float.  
     *   `R` takes precedence over `H`.  
     * - `W#`: Width of control where `#` is a number of pixels.  
     *   Default value: Current font size x15
     * - `H#`: Height of control where `#` is a number of pixels.  
     *   Default value: 3 rows  
     * - `WP+#` or `HP+#`: Use previous control's width `WP` or height `HP`.  
     *   Width or height can be adjusted by adding `+#` or `-#` where `#` is a number of pixels.  
     * - `X#` or `Y#`: Static `X` or `Y` coordinates where `#` is the pixel location on the Gui.  
     * - `X+#` or `Y+#`: Use the right edge `X+#` or bottom edge `Y+#` of the previous control as a start point.  
     *   The position can be offset with `+#` or `-#` where `#` is a number of pixels.  
     * - `XP+#` or `YP+#`: Use the left edge `XP+#` or top edge `YP+#` of the previous control as a start point.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     *   Useful for aligning controls in a {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#GroupBox|`GroupBox`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Tab|`Tab`}.  
     * - `XM+#` or `YM+#`: Use Gui {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginX|`left margin (MarginX)`} or {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginY|`top margin (MarginY)`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     * - `XS+#` or `YS+#`: Use the left edge `XS` or top edge `YS` of the last control marked as a {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Section|`Section`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     *  
     * **Common Styles and Other Options**  
     * Prefix with `-` to disable an option and `+` (or no sign) to add an option.  
     * - `Vstring`: Assign a {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Name|`Name`} to a control where `string` is the new name.  
     *   A control's name can be used to get a reference to that control from a GUI object.  
     *
     *         GuiControl.Opt('+VMyControl')  
     *         GuiControl := Gui['MyControl']  
     * - `Events`: Handled by the control's {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm|`OnEvent()` method}.  
     * - `AltSubmit`: {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Submit|`Gui.Submit`} will record the item position(s) instead of the actual text.  
     *   If no item is selected, the text of the edit field is stored, even if the string is empty.   
     * - `C#`: Set text color where `#` is one of the following:  
     *   - RGB hex value (0x prefix is optional): `C0x000000` to `CFFffFF`  
     *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}: `CBlack`, `CSilver`, `CGray`, `CWhite`, `CMaroon`, `CRed`, `CPurple`  
     *     `CFuchsia`, `CGreen`, `CLime`, `COlive`, `CYellow`, `CNavy`, `CBlue`, `CTeal`, `CAqua`  
     *   - Reset/Default: `CDefault` or `C`  
     *   Text color does not apply to the dropped down list.  
     * - `Disabled`: Disables the control preventing user focus or modifications of the contents.  
     *   Control can be enabled using `-Disabled` or setting {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Enabled`} to true.  
     *   A `0` for enabled or `1` for disabled can immediately follow `Disabled`.  
     *
     *       con.Opt('+Disabled0')
     *       var := 1, con.Opt('+Disabled' var)
     * - `Hidden`: The control is initially invisible.  
     *   Use `-Hidden` or {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Visible`} to unhide it.  
     *   A `0` for visible or `1` for hidden can immediately follow `Hidden`.  
     * 
     *       con.Opt('+Hidden0')
     *       var := 1, con.Opt('+Hidden' var)
     * - `Section`: Sets current control as the new Section for use with the {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#xs|`XS` and `YS`} positioning options.  
     * - `Tabstop`: Disabling Tabstop of a control prevents the user from tabbing to that control.  
     * - `Wrap`: Enables word-wrapping of the control's contents within its available width.  
     *   This is enabled by default for almost all controls.  
     * - `VScroll`: Provide or remove a vertical scroll bar if appropriate for this type of control.  
     * - `HScroll`: Provide or remove a horizontal scroll bar if appropriate for this type of control.  
     *  
     * **Uncommon Styles and Options**
     * - `Background#`: Sets control background color where `#` is one of the following:  
     *   - RGB hex value (0x prefix is optional): `000000` to `0xFFffFf`
     *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}: `Black`, `Silver`, `Gray`, `White`, `Maroon`, `Red`, `Purple`  
     *   `Fuchsia`, `Green`, `Lime`, `Olive`, `Yellow`, `Navy`, `Blue`, `Teal`, `Aqua`  
     *   - Reset/Default: `BackgroundDefault` or `-Background`  
     *   Background color does not apply to the dropped down list.  
     * - `Border`: Provides a thin-line border around the control. Adding a border to an  
     *   existing control might require increasing the control's width and height by 1 pixel.  
     * - `Redraw`: Enable/disable redrawing (visual updates) of a control (Uses: {@link https://learn.microsoft.com/en-us/windows/win32/gdi/wm-setredraw|`WM_SETREDRAW`}).  
     *   Disabling redraw `-Redraw` prior to adding multiple controls/elements can increase performance.  
     *   Enable redraw `+Redraw` after all changes have been made.  
     * - `Theme`: Used to override the window's current theme setting for the newly created control.  
     *   This setting has no effect when used on an existing control. See {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Theme|`GUI's +/-Theme option`} for details.  
     * - {@link https://www.autohotkey.com/docs/v2/misc/Styles.htm|`Style Number`} `+0x0`: Specify a plus or minus sign  
     *   followed immediately by a decimal or hexadecimal style number.  
     * - {@link https://learn.microsoft.com/en-us/windows/win32/winmsg/extended-window-styles|`ExStyle Number`} `+E0x0`: Specify a plus or minus sign  
     *   followed immediately by the letter E and a decimal or hexadecimal extended style number.  
     * @param {(Array)} [List] - An array of strings to represent each choice in the list.  
     * @returns {(Gui.DDL)} DropDownList Control Object
     * @example <caption>  
     * Changing background color with Drop Down List of colors.</caption>
     * color_list := ['Default', 'Red','Yellow','Green','Cyan','Blue','Magenta']
     * goo := Gui()
     * goo.ddl := goo.AddDropDownList('xm ym Choose1', color_list)
     * goo.ddl.OnEvent('Change', color_change)
     * goo.Show('w200 h100')
     * 
     * color_change(con, info) {
     *     color_map := Map('Red' ,0xFF0000 ,'Yellow',0xFFFF00 ,'Green',0xFF00
     *                     ,'Cyan',0xFFFF   ,'Magenta',0xFF00FF,'Blue',0xFF )
     *     color_map.Default := 'Default'
     *     con.gui.BackColor := color_map[con.Text]
     * }
     */
    AddDropDownList([Options:='', List:=[]]) => Gui.DDL
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Add|`AddListBox()`} adds a box control containing a list of choices  
     * that can be chosen from. This is the same list type used with {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#ComboBox|`Simple` ComboBoxes}.  
     * @method
     * @param {(String)} Options - Any {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#OtherOptions|`general`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm|`control-specific`} options, separated by spaces/tabs.  
     * **Control Specific Options**  
     * - `Choose#`: Pre-selects an item where `#` is the line number of the item.  
     * - `Multi`: Multiple items can be selected via Ctrl+Clicking and Shift+Clicking.  
     *   Using Style `+0x8` {@link https://learn.microsoft.com/en-us/windows/win32/controls/list-box-styles#LBS_MULTIPLESEL|`LBS_MULTIPLESEL`}, item highlighting is toggled on clicked.  
     * - `ReadOnly`: Items will not be visibly highlighted when selected but still register  
     *   with {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Submit|`Gui.Submit()`} and the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Value|`Value`} and {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Text|`Text`} properties.  
     * - `Sort`: Item list is sorted alphabetically. This option also enables incremental searching.  
     *   Meaning an item can be selected by typing its name.  
     * - `T#`: Sets each tab's distance, where `#` is number of dialogue units (a unit determined by the OS) to use.  
     *   If one tab stop is set, that distance is used between all tabs.  
     *   If multiple tab stops are set, each marks the distance the corresponding tab will extend to.  
     * - `0x100`: Adds the {@link https://www.autohotkey.com/docs/v2/misc/Styles.htm#LBS_NOINTEGRALHEIGHT|`LBS_NOINTEGRALHEIGHT`} style to the listbox, preventing a partial  
     *   row from appearing at the bottom and from shrinking when the font is changed.  
     * 
     * **Positioning and Sizing of Controls**  
     * - `R#`: Max amount of items to show in the control list without needing to scroll,  
     *   where `#` is the number of visible rows. This number can be a float.  
     *   `R` takes precedence over `H`.  
     * - `W#`: Width of control where `#` is a number of pixels.  
     *   Default value: Current font size x15
     * - `H#`: Height of control where `#` is a number of pixels.  
     *   Default value: 3 rows  
     * - `WP+#` or `HP+#`: Use previous control's width `WP` or height `HP`.  
     *   Width or height can be adjusted by adding `+#` or `-#` where `#` is a number of pixels.  
     * - `X#` or `Y#`: Static `X` or `Y` coordinates where `#` is the pixel location on the Gui.  
     * - `X+#` or `Y+#`: Use the right edge `X+#` or bottom edge `Y+#` of the previous control as a start point.  
     *   The position can be offset with `+#` or `-#` where `#` is a number of pixels.  
     * - `XP+#` or `YP+#`: Use the left edge `XP+#` or top edge `YP+#` of the previous control as a start point.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     *   Useful for aligning controls in a {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#GroupBox|`GroupBox`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Tab|`Tab`}.  
     * - `XM+#` or `YM+#`: Use Gui {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginX|`left margin (MarginX)`} or {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginY|`top margin (MarginY)`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     * - `XS+#` or `YS+#`: Use the left edge `XS` or top edge `YS` of the last control marked as a {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Section|`Section`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     *  
     * **Common Styles and Other Options**  
     * Prefix with `-` to disable an option and `+` (or no sign) to add an option.  
     * - `Vstring`: Assign a {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Name|`Name`} to a control where `string` is the new name.  
     *   A control's name can be used to get a reference to that control from a GUI object.  
     *
     *         GuiControl.Opt('+VMyControl')  
     *         GuiControl := Gui['MyControl']  
     * - `Events`: Handled by the control's {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm|`OnEvent()` method}.  
     * - `AltSubmit`: {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Submit|`Gui.Submit`} will record the item position(s) instead of the actual text.  
     *   If no item is selected, the text of the edit field is stored, even if the string is empty.   
     * - `C#`: Set text color where `#` is one of the following:  
     *   - RGB hex value (0x prefix is optional): `C0x000000` to `CFFffFF`  
     *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}: `CBlack`, `CSilver`, `CGray`, `CWhite`, `CMaroon`, `CRed`, `CPurple`  
     *     `CFuchsia`, `CGreen`, `CLime`, `COlive`, `CYellow`, `CNavy`, `CBlue`, `CTeal`, `CAqua`  
     *   - Reset/Default: `CDefault` or `C`  
     * - `Disabled`: Disables the control preventing user focus or modifications of the contents.  
     *   Control can be enabled using `-Disabled` or setting {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Enabled`} to true.  
     *   A `0` for enabled or `1` for disabled can immediately follow `Disabled`.  
     *
     *       con.Opt('+Disabled0')
     *       var := 1, con.Opt('+Disabled' var)
     * - `Hidden`: The control is initially invisible.  
     *   Use `-Hidden` or {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Visible`} to unhide it.  
     *   A `0` for visible or `1` for hidden can immediately follow `Hidden`.  
     * 
     *       con.Opt('+Hidden0')
     *       var := 1, con.Opt('+Hidden' var)
     * - `Section`: Sets current control as the new Section for use with the {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#xs|`XS` and `YS`} positioning options.  
     * - `Tabstop`: Disabling Tabstop of a control prevents the user from tabbing to that control.  
     * - `Wrap`: Enables word-wrapping of the control's contents within its available width.  
     *   This is enabled by default for almost all controls.  
     * - `VScroll`: Provide or remove a vertical scroll bar if appropriate for this type of control.  
     * - `HScroll`: Provide or remove a horizontal scroll bar if appropriate for this type of control.  
     *  
     * **Uncommon Styles and Options**
     * - `Background#`: Sets control background color where `#` is one of the following:  
     *   - RGB hex value (0x prefix is optional): `000000` to `0xFFffFf`
     *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}: `Black`, `Silver`, `Gray`, `White`, `Maroon`, `Red`, `Purple`  
     *   `Fuchsia`, `Green`, `Lime`, `Olive`, `Yellow`, `Navy`, `Blue`, `Teal`, `Aqua`  
     *   - Reset/Default: `BackgroundDefault` or `-Background`  
     * - `Border`: Provides a thin-line border around the control. Adding a border to an  
     *   existing control might require increasing the control's width and height by 1 pixel.  
     * - `Redraw`: Enable/disable redrawing (visual updates) of a control (Uses: {@link https://learn.microsoft.com/en-us/windows/win32/gdi/wm-setredraw|`WM_SETREDRAW`}).  
     *   Disabling redraw `-Redraw` prior to adding multiple controls/elements can increase performance.  
     *   Enable redraw `+Redraw` after all changes have been made.  
     * - `Theme`: Used to override the window's current theme setting for the newly created control.  
     *   This setting has no effect when used on an existing control. See {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Theme|`GUI's +/-Theme option`} for details.  
     * - {@link https://www.autohotkey.com/docs/v2/misc/Styles.htm|`Style Number`} `+0x0`: Specify a plus or minus sign  
     *   followed immediately by a decimal or hexadecimal style number.  
     * - {@link https://learn.microsoft.com/en-us/windows/win32/winmsg/extended-window-styles|`ExStyle Number`} `+E0x0`: Specify a plus or minus sign  
     *   followed immediately by the letter E and a decimal or hexadecimal extended style number.  
     * @param {(Array)} [List] - Array of strings to populate the listbox.  
     * @returns {(Gui.ListBox)} ListBox Control Object
     * @example <caption>  
     * ListBox of items that adjusts GUI size.</caption>
     * goo := Gui()
     * rez := ['Minimal', '640 x 360','640 x 480','720 x 480','1280 x 720','1920 x 1080']
     * goo.AddText('xm ym', 'Select a window size')
     * con := goo.AddListBox('xm ym w200 r' rez.Length, rez)
     * con.OnEvent('Change', update_win_size)
     * goo.Show()
     * 
     * update_win_size(con, *) {
     *     if InStr(con.Text, ' x ')
     *         rez := StrSplit(con.Text, 'x', ' ')0
     *         ,con.gui.Move(,,rez[1], rez[2])
     *     else goo.Show('AutoSize')
     * }
     */
    AddListBox([Options:='', List:=[]]) => Gui.ListBox
    
    /**
     * Use {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Tab|`AddTab3()`} instead. AddTab() and AddTab2() only remain for backward compatibility.  
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Add|`AddTab()`} adds a large control used to contain organize other controls.  
     * Each tab acts as it's own "page" of individual controls.  
     * @method
     * @param {(String)} Options - Any {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#OtherOptions|`general`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm|`control-specific`} options, separated by spaces/tabs.  
     * **Control Specific Options**  
     * - `Choose#`: Pre-selects a Tab where `#` is the tab's positional number.  
     * - `Buttons`: The Tabs are replaced with clickable buttons.  
     * - `Left`/`Right`/`Bottom`: Specify the side of the control to show the tabs.  
     *   See {@link https://www.autohotkey.com/docs/v2/misc/Styles.htm#TCS_VERTICAL|`TCS_VERTICAL`} for Left/Right limitations.  
     * - `Wrap`: Specify `-Wrap` to keep all tabs on a single row. Scroll buttons are added if there are too many tabs.  
     *   If there are too many tabs, scroll buttons are added to navigate through them.  
     * - `Tab Icons`: Icons may be added next to tab's via {@link https://www.autohotkey.com/docs/v2/lib/SendMessage.htm|`SendMessage`} as demonstrated in {@link https://www.autohotkey.com/board/topic/5692-icons-in-tabs/|`this post`}.  
     *  
     * **Positioning and Sizing of Controls**  
     * - `R#`: Max amount of items to show in the control list without needing to scroll,  
     *   where `#` is the number of visible rows. This number can be a float.  
     *   `R` takes precedence over `H`.  
     * - `W#`: Width of control where `#` is a number of pixels.  
     *   Default value: Current font size x30 plus the {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginX|`MarginX`} x3.  
     * - `H#`: Height of control where `#` is a number of pixels.  
     *   Default value: 10 rows  
     * - `WP+#` or `HP+#`: Use previous control's width `WP` or height `HP`.  
     *   Width or height can be adjusted by adding `+#` or `-#` where `#` is a number of pixels.  
     * - `X#` or `Y#`: Static `X` or `Y` coordinates where `#` is the pixel location on the Gui.  
     * - `X+#` or `Y+#`: Use the right edge `X+#` or bottom edge `Y+#` of the previous control as a start point.  
     *   The position can be offset with `+#` or `-#` where `#` is a number of pixels.  
     * - `XP+#` or `YP+#`: Use the left edge `XP+#` or top edge `YP+#` of the previous control as a start point.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     *   Useful for aligning controls in a {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#GroupBox|`GroupBox`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Tab|`Tab`}.  
     * - `XM+#` or `YM+#`: Use Gui {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginX|`left margin (MarginX)`} or {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginY|`top margin (MarginY)`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     * - `XS+#` or `YS+#`: Use the left edge `XS` or top edge `YS` of the last control marked as a {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Section|`Section`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     *  
     * **Common Styles and Other Options**  
     * Prefix with `-` to disable an option and `+` (or no sign) to add an option.  
     * - `Vstring`: Assign a {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Name|`Name`} to a control where `string` is the new name.  
     *   A control's name can be used to get a reference to that control from a GUI object.  
     *
     *         GuiControl.Opt('+VMyControl')  
     *         GuiControl := Gui['MyControl']  
     * - `Events`: Handled by the control's {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm|`OnEvent()` method}.  
     * - `AltSubmit`: {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Submit|`Gui.Submit`} will record the item position(s) instead of the actual text.  
     *   If no item is selected, the text of the edit field is stored, even if the string is empty.   
     * - `C#`: Set text color where `#` is one of the following:  
     *   - RGB hex value (0x prefix is optional): `C0x000000` to `CFFffFF`  
     *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}: `CBlack`, `CSilver`, `CGray`, `CWhite`, `CMaroon`, `CRed`, `CPurple`  
     *     `CFuchsia`, `CGreen`, `CLime`, `COlive`, `CYellow`, `CNavy`, `CBlue`, `CTeal`, `CAqua`  
     *   - Reset/Default: `CDefault` or `C`  
     * - `Disabled`: Disables the control preventing user focus or modifications of the contents.  
     *   Control can be enabled using `-Disabled` or setting {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Enabled`} to true.  
     *   A `0` for enabled or `1` for disabled can immediately follow `Disabled`.  
     *
     *       con.Opt('+Disabled0')
     *       var := 1, con.Opt('+Disabled' var)
     * - `Hidden`: The control is initially invisible.  
     *   Use `-Hidden` or {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Visible`} to unhide it.  
     *   A `0` for visible or `1` for hidden can immediately follow `Hidden`.  
     * 
     *       con.Opt('+Hidden0')
     *       var := 1, con.Opt('+Hidden' var)
     * - `Section`: Sets current control as the new Section for use with the {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#xs|`XS` and `YS`} positioning options.  
     * - `Tabstop`: Disabling Tabstop of a control prevents the user from tabbing to that control.  
     * - `VScroll`: Provide or remove a vertical scroll bar if appropriate for this type of control.  
     * - `HScroll`: Provide or remove a horizontal scroll bar if appropriate for this type of control.  
     *  
     * **Uncommon Styles and Options**
     * - `Background#`: Sets control background color where `#` is one of the following:  
     *   - RGB hex value (0x prefix is optional): `000000` to `0xFFffFf`
     *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}: `Black`, `Silver`, `Gray`, `White`, `Maroon`, `Red`, `Purple`  
     *   `Fuchsia`, `Green`, `Lime`, `Olive`, `Yellow`, `Navy`, `Blue`, `Teal`, `Aqua`  
     *   - Reset/Default: `BackgroundDefault` or `-Background`  
     * - `Border`: Provides a thin-line border around the control. Adding a border to an  
     *   existing control might require increasing the control's width and height by 1 pixel.  
     * - `Redraw`: Enable/disable redrawing (visual updates) of a control (Uses: {@link https://learn.microsoft.com/en-us/windows/win32/gdi/wm-setredraw|`WM_SETREDRAW`}).  
     *   Disabling redraw `-Redraw` prior to adding multiple controls/elements can increase performance.  
     *   Enable redraw `+Redraw` after all changes have been made.  
     * - `Theme`: Used to override the window's current theme setting for the newly created control.  
     *   This setting has no effect when used on an existing control. See {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Theme|`GUI's +/-Theme option`} for details.  
     * - {@link https://www.autohotkey.com/docs/v2/misc/Styles.htm|`Style Number`} `+0x0`: Specify a plus or minus sign  
     *   followed immediately by a decimal or hexadecimal style number.  
     * - {@link https://learn.microsoft.com/en-us/windows/win32/winmsg/extended-window-styles|`ExStyle Number`} `+E0x0`: Specify a plus or minus sign  
     *   followed immediately by the letter E and a decimal or hexadecimal extended style number.  
     * @param {(Array)} [TabTitles] - Array of strings to use as tab titles.
     * @returns {(Gui.Tab)} Tab Control Object
     * @example <caption>  
     * Creating a gui with 3 tabs.</caption>
     * goo := Gui()
     * goo.tabs := goo.AddTab('xm ym w200 h100 Section', ['Tab 1', 'Tab 2', 'Tab 3'])
     * loop 3 {
     *     goo.tabs.UseTab(A_Index)
     *     goo.AddButton('x20 y30', 'Button ' A_Index)
     * }
     * goo.Show()
     */
    AddTab([Options:='', TabTitles:=[]]) => Gui.Tab
    
    /**
     * Use {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Tab|`AddTab3()`} instead. AddTab() and AddTab2() only remain for backward compatibility.  
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Add|`AddTab2()`} adds a large control used to contain organize other controls.  
     * Each tab acts as it's own "page" of individual controls.  
     * Avoid using AddTab() and AddTab2() as they're meant only for backward compatability.  
     * @method
     * @param {(String)} Options - Any {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#OtherOptions|`general`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm|`control-specific`} options, separated by spaces/tabs.  
     * **Control Specific Options**  
     * - `Choose#`: Pre-selects a Tab where `#` is the tab's positional number.  
     * - `Buttons`: The Tabs are replaced with clickable buttons. 
     * - `Left`/`Right`/`Bottom`: Specify the side of the control to show the tabs.  
     *   See {@link https://www.autohotkey.com/docs/v2/misc/Styles.htm#TCS_VERTICAL|`TCS_VERTICAL`} for Left/Right limitations.  
     * - `Wrap`: Specify `-Wrap` to keep all tabs on a single row. Scroll buttons are added if there are too many tabs.  
     *   If there are too many tabs, scroll buttons are added to navigate through them.  
     * - `Tab Icons`: Icons may be added next to tab's via {@link https://www.autohotkey.com/docs/v2/lib/SendMessage.htm|`SendMessage`} as demonstrated in {@link https://www.autohotkey.com/board/topic/5692-icons-in-tabs/|`this post`}.  
     *  
     * **Positioning and Sizing of Controls**  
     * - `R#`: Max amount of items to show in the control list without needing to scroll,  
     *   where `#` is the number of visible rows. This number can be a float.  
     *   `R` takes precedence over `H`.  
     * - `W#`: Width of control where `#` is a number of pixels.  
     *   Default value: Current font size x30 plus the {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginX|`MarginX`} x3.  
     * - `H#`: Height of control where `#` is a number of pixels.  
     *   Default value: 10 rows  
     * - `WP+#` or `HP+#`: Use previous control's width `WP` or height `HP`.  
     *   Width or height can be adjusted by adding `+#` or `-#` where `#` is a number of pixels.  
     * - `X#` or `Y#`: Static `X` or `Y` coordinates where `#` is the pixel location on the Gui.  
     * - `X+#` or `Y+#`: Use the right edge `X+#` or bottom edge `Y+#` of the previous control as a start point.  
     *   The position can be offset with `+#` or `-#` where `#` is a number of pixels.  
     * - `XP+#` or `YP+#`: Use the left edge `XP+#` or top edge `YP+#` of the previous control as a start point.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     *   Useful for aligning controls in a {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#GroupBox|`GroupBox`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Tab|`Tab`}.  
     * - `XM+#` or `YM+#`: Use Gui {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginX|`left margin (MarginX)`} or {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginY|`top margin (MarginY)`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     * - `XS+#` or `YS+#`: Use the left edge `XS` or top edge `YS` of the last control marked as a {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Section|`Section`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     *  
     * **Common Styles and Other Options**  
     * Prefix with `-` to disable an option and `+` (or no sign) to add an option.  
     * - `Vstring`: Assign a {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Name|`Name`} to a control where `string` is the new name.  
     *   A control's name can be used to get a reference to that control from a GUI object.  
     *
     *         GuiControl.Opt('+VMyControl')  
     *         GuiControl := Gui['MyControl']  
     * - `Events`: Handled by the control's {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm|`OnEvent()` method}.  
     * - `AltSubmit`: {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Submit|`Gui.Submit`} will record the item position(s) instead of the actual text.  
     *   If no item is selected, the text of the edit field is stored, even if the string is empty.   
     * - `C#`: Set text color where `#` is one of the following:  
     *   - RGB hex value (0x prefix is optional): `C0x000000` to `CFFffFF`  
     *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}: `CBlack`, `CSilver`, `CGray`, `CWhite`, `CMaroon`, `CRed`, `CPurple`  
     *     `CFuchsia`, `CGreen`, `CLime`, `COlive`, `CYellow`, `CNavy`, `CBlue`, `CTeal`, `CAqua`  
     *   - Reset/Default: `CDefault` or `C`  
     * - `Disabled`: Disables the control preventing user focus or modifications of the contents.  
     *   Control can be enabled using `-Disabled` or setting {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Enabled`} to true.  
     *   A `0` for enabled or `1` for disabled can immediately follow `Disabled`.  
     *
     *       con.Opt('+Disabled0')
     *       var := 1, con.Opt('+Disabled' var)
     * - `Hidden`: The control is initially invisible.  
     *   Use `-Hidden` or {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Visible`} to unhide it.  
     *   A `0` for visible or `1` for hidden can immediately follow `Hidden`.  
     * 
     *       con.Opt('+Hidden0')
     *       var := 1, con.Opt('+Hidden' var)
     * - `Section`: Sets current control as the new Section for use with the {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#xs|`XS` and `YS`} positioning options.  
     * - `Tabstop`: Disabling Tabstop of a control prevents the user from tabbing to that control.  
     * - `VScroll`: Provide or remove a vertical scroll bar if appropriate for this type of control.  
     * - `HScroll`: Provide or remove a horizontal scroll bar if appropriate for this type of control.  
     *  
     * **Uncommon Styles and Options**
     * - `Background#`: Sets control background color where `#` is one of the following:  
     *   - RGB hex value (0x prefix is optional): `000000` to `0xFFffFf`
     *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}: `Black`, `Silver`, `Gray`, `White`, `Maroon`, `Red`, `Purple`  
     *   `Fuchsia`, `Green`, `Lime`, `Olive`, `Yellow`, `Navy`, `Blue`, `Teal`, `Aqua`  
     *   - Reset/Default: `BackgroundDefault` or `-Background`  
     * - `Border`: Provides a thin-line border around the control. Adding a border to an  
     *   existing control might require increasing the control's width and height by 1 pixel.  
     * - `Redraw`: Enable/disable redrawing (visual updates) of a control (Uses: {@link https://learn.microsoft.com/en-us/windows/win32/gdi/wm-setredraw|`WM_SETREDRAW`}).  
     *   Disabling redraw `-Redraw` prior to adding multiple controls/elements can increase performance.  
     *   Enable redraw `+Redraw` after all changes have been made.  
     * - `Theme`: Used to override the window's current theme setting for the newly created control.  
     *   This setting has no effect when used on an existing control. See {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Theme|`GUI's +/-Theme option`} for details.  
     * - {@link https://www.autohotkey.com/docs/v2/misc/Styles.htm|`Style Number`} `+0x0`: Specify a plus or minus sign  
     *   followed immediately by a decimal or hexadecimal style number.  
     * - {@link https://learn.microsoft.com/en-us/windows/win32/winmsg/extended-window-styles|`ExStyle Number`} `+E0x0`: Specify a plus or minus sign  
     *   followed immediately by the letter E and a decimal or hexadecimal extended style number.  
     * @param {(Array)} [TabTitles] - Array of strings to use as tab titles.
     * @returns {(Gui.Tab)} Tab Control Object
     * @example <caption>  
     * Creating a gui with 3 tabs.</caption>
     * goo := Gui()
     * goo.tabs := goo.AddTab2('xm ym w200 h100 Section', ['Tab 1', 'Tab 2', 'Tab 3'])
     * loop 3 {
     *     goo.tabs.UseTab(A_Index)
     *     goo.AddButton('x20 y30', 'Button ' A_Index)
     * }
     * goo.Show()
     */
    AddTab2([Options:='', TabTitles:=[]]) => Gui.Tab
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Add|`AddTab3()`} adds a large control used to contain organize other controls.  
     * Each tab acts as it's own "page" of individual controls.  
     * Avoid using AddTab() and AddTab2() as they're only kept for backward compatability.  
     * @method
     * @param {(String)} Options - Any {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#OtherOptions|`general`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm|`control-specific`} options, separated by spaces/tabs.  
     * **Control Specific Options**  
     * - `Choose#`: Pre-selects a Tab where `#` is the tab's positional number.  
     * - `Buttons`: The Tabs are replaced with clickable buttons. 
     * - `Left`/`Right`/`Bottom`: Specify the side of the control to show the tabs.  
     *   See {@link https://www.autohotkey.com/docs/v2/misc/Styles.htm#TCS_VERTICAL|`TCS_VERTICAL`} for Left/Right limitations.  
     * - `Wrap`: Specify `-Wrap` to keep all tabs on a single row. Scroll buttons are added if there are too many tabs.  
     *   If there are too many tabs, scroll buttons are added to navigate through them.  
     * - `Tab Icons`: Icons may be added next to tab's via {@link https://www.autohotkey.com/docs/v2/lib/SendMessage.htm|`SendMessage`} as demonstrated in {@link https://www.autohotkey.com/board/topic/5692-icons-in-tabs/|`this post`}.  
     *  
     * **Positioning and Sizing of Controls**  
     * - `R#`: Max amount of items to show in the control list without needing to scroll,  
     *   where `#` is the number of visible rows. This number can be a float.  
     *   `R` takes precedence over `H`.  
     * - `W#`: Width of control where `#` is a number of pixels.  
     *   Default value: Current font size x30 plus the {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginX|`MarginX`} x3.  
     * - `H#`: Height of control where `#` is a number of pixels.  
     *   Default value: 10 rows  
     * - `WP+#` or `HP+#`: Use previous control's width `WP` or height `HP`.  
     *   Width or height can be adjusted by adding `+#` or `-#` where `#` is a number of pixels.  
     * - `X#` or `Y#`: Static `X` or `Y` coordinates where `#` is the pixel location on the Gui.  
     * - `X+#` or `Y+#`: Use the right edge `X+#` or bottom edge `Y+#` of the previous control as a start point.  
     *   The position can be offset with `+#` or `-#` where `#` is a number of pixels.  
     * - `XP+#` or `YP+#`: Use the left edge `XP+#` or top edge `YP+#` of the previous control as a start point.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     *   Useful for aligning controls in a {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#GroupBox|`GroupBox`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Tab|`Tab`}.  
     * - `XM+#` or `YM+#`: Use Gui {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginX|`left margin (MarginX)`} or {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#MarginY|`top margin (MarginY)`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     * - `XS+#` or `YS+#`: Use the left edge `XS` or top edge `YS` of the last control marked as a {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Section|`Section`}.  
     *   The offset can be positive `+#` or negative `-#` where `#` is a number of pixels.  
     *  
     * **Common Styles and Other Options**  
     * Prefix with `-` to disable an option and `+` (or no sign) to add an option.  
     * - `Vstring`: Assign a {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Name|`Name`} to a control where `string` is the new name.  
     *   A control's name can be used to get a reference to that control from a GUI object.  
     *
     *         GuiControl.Opt('+VMyControl')  
     *         GuiControl := Gui['MyControl']  
     * - `Events`: Handled by the control's {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm|`OnEvent()` method}.  
     * - `AltSubmit`: {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Submit|`Gui.Submit`} will record the item position(s) instead of the actual text.  
     *   If no item is selected, the text of the edit field is stored, even if the string is empty.   
     * - `C#`: Set text color where `#` is one of the following:  
     *   - RGB hex value (0x prefix is optional): `C0x000000` to `CFFffFF`  
     *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}: `CBlack`, `CSilver`, `CGray`, `CWhite`, `CMaroon`, `CRed`, `CPurple`  
     *     `CFuchsia`, `CGreen`, `CLime`, `COlive`, `CYellow`, `CNavy`, `CBlue`, `CTeal`, `CAqua`  
     *   - Reset/Default: `CDefault` or `C`  
     * - `Disabled`: Disables the control preventing user focus or modifications of the contents.  
     *   Control can be enabled using `-Disabled` or setting {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Enabled`} to true.  
     *   A `0` for enabled or `1` for disabled can immediately follow `Disabled`.  
     *
     *       con.Opt('+Disabled0')
     *       var := 1, con.Opt('+Disabled' var)
     * - `Hidden`: The control is initially invisible.  
     *   Use `-Hidden` or {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiCtrl.Visible`} to unhide it.  
     *   A `0` for visible or `1` for hidden can immediately follow `Hidden`.  
     * 
     *       con.Opt('+Hidden0')
     *       var := 1, con.Opt('+Hidden' var)
     * - `Section`: Sets current control as the new Section for use with the {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#xs|`XS` and `YS`} positioning options.  
     * - `Tabstop`: Disabling Tabstop of a control prevents the user from tabbing to that control.  
     * - `VScroll`: Provide or remove a vertical scroll bar if appropriate for this type of control.  
     * - `HScroll`: Provide or remove a horizontal scroll bar if appropriate for this type of control.  
     *  
     * **Uncommon Styles and Options**
     * - `Background#`: Sets control background color where `#` is one of the following:  
     *   - RGB hex value (0x prefix is optional): `000000` to `0xFFffFf`
     *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}: `Black`, `Silver`, `Gray`, `White`, `Maroon`, `Red`, `Purple`  
     *   `Fuchsia`, `Green`, `Lime`, `Olive`, `Yellow`, `Navy`, `Blue`, `Teal`, `Aqua`  
     *   - Reset/Default: `BackgroundDefault` or `-Background`  
     * - `Border`: Provides a thin-line border around the control. Adding a border to an  
     *   existing control might require increasing the control's width and height by 1 pixel.  
     * - `Redraw`: Enable/disable redrawing (visual updates) of a control (Uses: {@link https://learn.microsoft.com/en-us/windows/win32/gdi/wm-setredraw|`WM_SETREDRAW`}).  
     *   Disabling redraw `-Redraw` prior to adding multiple controls/elements can increase performance.  
     *   Enable redraw `+Redraw` after all changes have been made.  
     * - `Theme`: Used to override the window's current theme setting for the newly created control.  
     *   This setting has no effect when used on an existing control. See {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Theme|`GUI's +/-Theme option`} for details.  
     * - {@link https://www.autohotkey.com/docs/v2/misc/Styles.htm|`Style Number`} `+0x0`: Specify a plus or minus sign  
     *   followed immediately by a decimal or hexadecimal style number.  
     * - {@link https://learn.microsoft.com/en-us/windows/win32/winmsg/extended-window-styles|`ExStyle Number`} `+E0x0`: Specify a plus or minus sign  
     *   followed immediately by the letter E and a decimal or hexadecimal extended style number.  
     * @param {(Array)} [TabTitles] - Array of strings to use as tab titles.
     * @returns {(Gui.Tab)} Tab Control Object
     * @example <caption>  
     * Creating a gui with 3 tabs.</caption>
     * goo := Gui()
     * goo.tabs := goo.AddTab3('xm ym w200 h100 Section', ['Tab 1', 'Tab 2', 'Tab 3'])
     * loop 3 {
     *     goo.tabs.UseTab(A_Index)
     *     goo.AddButton('x20 y30', 'Button ' A_Index)
     * }
     * goo.Show()
     */
    AddTab3([Options:='', TabTitles:=[]]) => Gui.Tab
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Destroy|`Destroy()`} removes the window and all its controls, freeing the corresponding memory and system resources.  
     * @method
     * @returns {(String)} An empty string is always returned.  
     * @example <caption>  
     * </caption>
     * goo := Gui()
     * con := goo.AddButton('xm ym w100', 'Destroy GUI')
     * con.OnEvent('Click', destroy_gui)
     * goo.Show('AutoSize')
     * 
     * destroy_gui(con, *) {
     *     con.gui.Destroy()
     * }
     */
    Destroy() => EmptyString
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Flash|`Flash()`} causes the Gui's title bar and taskbar to blink.  
     * This is done by inverting their colors once per call. By calling flash multiple times, the button and window appear to "blink".  
     * @method
     * @param {(Boolean)} [Blink] - Any true value will cause the color inversion to continue.  
     * Setting Blink to false will reset the flash by removing the color inversion if present.  
     * @returns {(String)} An empty string is always returned.  
     * @example <caption>  
     * Make a flashing GUI.</caption>
     * goo := Gui()
     * goo.AddButton('xm ym w100')
     * goo.Show('AutoSize')
     * loop 6
     *     goo.Flash()
     * goo.Flash(0)
     * MsgBox('Done flashing and flash is reset')
     */
    Flash([Blink:=1]) => EmptyString
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#GetClientPos|`GetClientPos()`} retrieves the position and size of the window's client area.  
     * Client area is the main area of a program and it excludes the window's title bar, standard menus, and window borders.  
     * Unlike {@link https://www.autohotkey.com/docs/v2/lib/WinGetClientPos.htm|`WinGetClientPos`}, this method applies {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#DPIScale|`DPI scaling`} to width and height.  
     * @method
     * @param {(VarRef)} [X] - Variable to store the x coordinate of the client area. 
     * This is the left edge of the area.  
     * @param {(VarRef)} [Y] - Variable to store the y coordinate of the client area. 
     * This is the top edge of the area.  
     * @param {(VarRef)} [Width] - Variable to store the width of the client area. 
     * To get the right edge of the area, add width and x.  
     * @param {(VarRef)} [Height] - Variable to store the height of the client area. 
     * To get the bottom edge of the area, add height and y.  
     * @returns {(String)} An empty string is always returned.  
     * @example <caption>  
     * Getting active info on a Window.</caption>
     * WM_MOVE := 0x0003
     * 
     * gu := Gui('+Resize')
     * goo.txt := goo.AddText('xm ym w300 h400')
     * goo.Show('x100 y100 w300 h400')
     * 
     * callback := update_pos_info.Bind(gu)
     * callback()
     * goo.OnEvent('Size', callback)
     * OnMessage(WM_MOVE, callback)
     * 
     * update_pos_info(goo, *) {
     *     goo.GetPos(&X, &Y, &Width, &Height)
     *     ,goo.GetClientPos(&cX, &cY, &cWidth, &cHeight)
     *     ,goo.txt.Text := 'Window X: ' x '`nWindow y: ' y '`nWindow width: ' width '`nWindow height: ' height
     *         . '`nClient X: ' x '`nClient y: ' y '`nClient width: ' width '`nClient height: ' height
     * }
     */
    GetClientPos([&X, &Y, &Width, &Height]) => EmptyString  
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#GetPos|`GetPos()`} retrieves the position and size of the window.  
     * Unlike {@link https://www.autohotkey.com/docs/v2/lib/WinGetClientPos.htm|`WinGetClientPos`}, this method applies {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#DPIScale|`DPI scaling`} to width and height.  
     * @method
     * @param {(VarRef)} [X] - Variable to store the x coordinate of the Gui.  
     * This is the left edge of the Gui.  
     * @param {(VarRef)} [Y] - Variable to store the y coordinate of the Gui.  
     * This is the top edge of the Gui.  
     * @param {(VarRef)} [Width] - Variable to store the width of the Gui.  
     * To get the right edge of the Gui, add width and x.  
     * @param {(VarRef)} [Height] - Variable to store the height of the Gui.  
     * To get the bottom edge of the Gui, add height and y.  
     * @returns {(String)} An empty string is always returned.  
     * @example <caption>  
     * Getting active info on a Window.</caption>
     * WM_MOVE := 0x0003
     * 
     * gu := Gui('+Resize')
     * goo.txt := goo.AddText('xm ym w300 h400')
     * goo.Show('x100 y100 w300 h400')
     * 
     * callback := update_pos_info.Bind(gu)
     * callback()
     * goo.OnEvent('Size', callback)
     * OnMessage(WM_MOVE, callback)
     * 
     * update_pos_info(goo, *) {
     *     goo.GetPos(&X, &Y, &Width, &Height)
     *     ,goo.GetClientPos(&cX, &cY, &cWidth, &cHeight)
     *     ,goo.txt.Text := 'Window X: ' x '`nWindow y: ' y '`nWindow width: ' width '`nWindow height: ' height
     *         . '`nClient X: ' x '`nClient y: ' y '`nClient width: ' width '`nClient height: ' height
     * }
     */
    GetPos([&X, &Y, &Width, &Height]) => EmptyString
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Hide|`Hide()`} hides the Gui window from view but does not destroy it.  
     * @method
     * @returns {(String)} An empty string is always returned.  
     * @example <caption>  
     * A GUI that can be hidden and shown with F1.</caption>
     * *F1::toggle_gui()
     * 
     * toggle_gui()
     * 
     * toggle_gui() {
     *     static gu := make_gui()
     *     if WinExist('ahk_id ' goo.hwnd)
     *         goo.Hide()
     *     else goo.Show()
     *     return
     *     
     *     make_gui() {
     *         goo := Gui()
     *         goo.AddText('xm ym w150', 'Press F1 to hide/show GUI.')
     *         goo.btn_exit := goo.AddButton('xm w150', 'Click to close Script')
     *         goo.btn_exit.OnEvent('Click', (*) => ExitApp())
     *         return gu
     *     }
     * }
     */
    Hide() => EmptyString
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Maximize|`Maximize()`} unhides the window if hidden and then maximizes it.  
     * @method
     * @returns {(String)} An empty string is always returned.  
     * @example <caption>  
     * GUI with max, min, and restore buttons.</caption>
     * goo := Gui()
     * goo.btn_max := goo.AddButton('xm ym w100', 'Maximize Window')
     * goo.btn_max.OnEvent('Click', (con, *) => con.gui.Maximize())
     * goo.btn_res := goo.AddButton('xm w100', 'Restore Window')
     * goo.btn_res.OnEvent('Click', (con, *) => con.gui.Restore())
     * goo.btn_min := goo.AddButton('xm w100', 'Minimize Window')
     * goo.btn_min.OnEvent('Click', (con, *) => con.gui.Minimize())
     * goo.Show()
     */
    Maximize() => EmptyString
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Minimize|`Minimize()`} unhides the window if hidden and then minimizes it.  
     * @method
     * @returns {(String)} An empty string is always returned.  
     * @example <caption>  
     * GUI with max, min, and restore buttons.</caption>
     * goo := Gui()
     * goo.btn_max := goo.AddButton('xm ym w100', 'Maximize Window')
     * goo.btn_max.OnEvent('Click', (con, *) => con.gui.Maximize())
     * goo.btn_res := goo.AddButton('xm w100', 'Restore Window')
     * goo.btn_res.OnEvent('Click', (con, *) => con.gui.Restore())
     * goo.btn_min := goo.AddButton('xm w100', 'Minimize Window')
     * goo.btn_min.OnEvent('Click', (con, *) => con.gui.Minimize())
     * goo.Show()
     */
    Minimize() => EmptyString
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Move|`Move()`} is used to adjust the poisition (x,y coords), height, and/or width of the GUI.  
     * Unlike {@link https://www.autohotkey.com/docs/v2/lib/WinMove.htm|`WinMove`}, this method applies {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#DPIScale|`DPI scaling`} to width and height.  
     * @method
     * @param {(Integer)} [X] - New x coordinate of the Gui.  
     * @param {(Integer)} [Y] - New y coordinate of the Gui.  
     * @param {(Integer)} [Width] - New Gui width.  
     * @param {(Integer)} [Height] - New Gui height.  
     * @returns {(String)} An empty string is always returned.  
     * @example <caption>  
     * Create a button to randomly move the GUI.</caption>
     * goo := Gui()
     * goo.btn_b1 := goo.AddButton('xm w100', 'Random Position')
     * goo.btn_b1.OnEvent('Click', random_pos)
     * goo.btn_b2 := goo.AddButton('xm w100', 'Close Script')
     * goo.btn_b2.OnEvent('Click', (*) => ExitApp())
     * goo.Show()
     * 
     * random_pos(control, info) {
     *     MonitorGetWorkArea(MonitorGetPrimary(), &left, &top, &right, &bottom)
     *     x := Random(left, right)
     *     y := Random(top, bottom)
     *     control.Gui.move(x, y)
     * }
     */
    Move([X:=Unset, Y:=Unset, Width:=Unset, Height:=Unset]) => EmptyString
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#OnEvent|`OnEvent()`} registers a function or method to be called when the given event occurs.  
     * @method
     * @param {(String)} EventName - One of the following event(s):  
     * Gui Events:
     * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Close|`Close`} - Window is closed.  
     *   `Gui_Close(GuiObj)`  
     * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#ContextMenu|`ContextMenu`} - User right-clicks within the window or presses Menu or Shift+F10.  
     *   `Gui_ContextMenu(GuiObj, GuiCtrlObj, Item, RightClicked, X, Y)`  
     * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#DropFiles|`DropFiles`} - Files/folders are dragged and dropped onto the window.  
     *   `Gui_DropFiles(GuiObj, GuiCtrlObj, FileArray, X, Y)`  
     * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Escape|`Escape`} - User presses Esc while the GUI window is active.  
     *   `Gui_Escape(GuiObj)`  
     * - {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm#Size|`Size`} - Window is resized, minimized, maximized or restored.  
     *   `Gui_Size(GuiObj, MinMax, Width, Height)`  
     * @param {(String|FuncObj)} Callback - The function, method, boundfunc, or object to be called when the event is raised.  
     * A callback's first parameter is the {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm|`Gui`}.  
     * If multiple callbacks have been registered for an event, a callback may return a non-empty string to prevent any remaining callbacks from being called.  
     * @param {(Integer)} [AddRemove=1] - Adjust callback order or delete callback. If omitted, parameter defaults to 1.  
     * - `1`: Add the callback after any previously registered callbacks.  
     * - `-1`: Add the callback before any previously registered callbacks.  
     * - `0`: Remove the callback.  
     * @returns {(String)} An empty string is always returned.  
     * @see {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm|`OnEvent()`}
     * , {@link https://www.autohotkey.com/docs/v2/Functions.htm#Variadic|`Variadic Functions`}
     * @example <caption>  
     * Making a script exit when a GUI is closed.</caption>
     * goo := Gui()
     * goo.OnEvent('Close', exit_script)
     * goo.OnEvent('Escape', exit_script)
     * goo.AddText('xm ym', 'To close the gui:'
     *     '`n`n- Press the "Escape" key'
     *     '`n- Close the GUI')
     * goo.Show('h100')
     * 
     * exit_script(*) => ExitApp()
     */
    OnEvent(EventName, Callback [, AddRemove:=1]) => EmptyString
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Opt|`Opt()`} sets various options and styles for the appearance and behavior of the window.  
     * @method
     * @param {(String)} ControlType - One of the following control types:  
     * {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#ActiveX|`ActiveX`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Button|`Button`}, 
     * {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Checkbox|`Checkbox`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#ComboBox|`ComboBox`}, 
     * {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Custom|`Custom`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#DateTime|`DateTime`}, 
     * {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#DropDownList|`DDL`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#DropDownList|`DropDownList`}, 
     * {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Edit|`Edit`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#GroupBox|`GroupBox`}, 
     * {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Hotkey|`Hotkey`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Link|`Link`}, 
     * {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#ListBox|`ListBox`}, {@link https://www.autohotkey.com/docs/v2/lib/ListView.htm|`ListView`}, 
     * {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#MonthCal|`MonthCal`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Picture|`Pic`}, 
     * {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Picture|`Picture`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Progress|`Progress`}, 
     * {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Radio|`Radio`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Slider|`Slider`}, 
     * {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#StatusBar|`StatusBar`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Tab|`Tab`}, 
     * {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Tab|`Tab2`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Tab|`Tab3`}, 
     * {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Text|`Text`}, {@link https://www.autohotkey.com/docs/v2/lib/TreeView.htm|`TreeView`}, 
     * {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#UpDown|`UpDown`}
     * @method
     * @param {(String)} Options - Zero or more Gui options, separated by spaces and/or tabs.  
     * For best performance, set all options in 1 call and do so before the window is created.  
     * Use `-` before an option to remove it or `+` to add it. Using no sign is the same as using `+`.  
     * - `AlwaysOnTop`: Makes the window stay on top of all other windows. Same effect as {@link https://www.autohotkey.com/docs/v2/lib/WinSetAlwaysOnTop.htm|`WinSetAlwaysOnTop`}.  
     * - `Border`: Provides a thin-line border around the window.  
     * - `Caption`: Include the standard title bar and a thick window border/edge. If using {@link https://www.autohotkey.com/docs/v2/lib/WinSetTransColor.htm|`WinSetTransColor`}, remove Caption only after setting the TransColor.  
     * - `Disabled`: Disables the window, which prevents the user from interacting with its controls. This is often used on a window that owns other windows (see {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Owner|`Owner`}).  
     * - `DPIScale`: If DPI scaling is enabled, coordinates and sizes passed to or retrieved from the Gui and GuiControl methods/properties are automatically scaled based on screen DPI.  
     *   {@link https://www.autohotkey.com/docs/v2/Variables.htm#ScreenDPI|`A_ScreenDPI`} contains the system's current DPI.  
     *   DPI scaling only applies to the Gui and GuiControl methods/properties, so coordinates coming directly from other sources such as ControlGetPos or WinGetPos will not work.  
     * - `LastFound`: Sets the window to {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#LastFoundWindow|`last found window`}. This is done automatically in a GUI thread to allow functions such as {@link https://www.autohotkey.com/docs/v2/lib/WinGetStyle.htm|`WinGetStyle`} and {@link https://www.autohotkey.com/docs/v2/lib/WinSetTransparent.htm|`WinSetTransparent`} to operate on it even if it is hidden.  
     * - `MaximizeBox`: Enables the maximize button in the title bar. This is included when the Resize option is used.  
     * - `MinimizeBox`: Enables the minimize button in the title bar.  
     * - `MaxSize` or `MinSize`: Set, adjust, or remove the minimum/maximum size of the client area of the window, such as when the user drags its edges to resize it.  
     *   `+MaxSize`/`+MinSize` uses the current window size as the maximum/minimum.  
     *   Alternatively, `+MaxSize640x480`/`+MinSize640x480` would set the max/min size to 640 pixels wide by 480 pixels tall and the width or height may be omitted, though the `x` separator must always be present.  
     * - `OwnDialogs`: Should be specified in each thread for which subsequently displayed MsgBox, InputBox, FileSelect, and DirSelect dialogs should be owned by the window.  
     *   These dialogs become modal, meaning that the user cannot interact with the Gui until the dialog box is dismissed.  
     *   ToolTip cannot become modal even though they become owned. Instead, they wilstay always on top of the owner.  
     * - `Owner`: Causes the window to be owned by another. Include the handle (HWND) to another window after the word owner to make the Gui owned by that Window.  
     *   Omitting a handle (HWND) will make the Gui owned by the script's main window.  
     * - `Parent`: Use `+Parent` immediately followed by the handle (HWND) of any window or control to use it as the parent of this window while `-Parent` will revert it back to a top-level window.  
     * - `Resize`: Makes the window resizable and enables its maximize button in the title bar. The maximize button can be removed with `-MaximizeBox`.  
     * - `SysMenu`: Adds or removes the system menu and icon in the window's upper left corner. This includes the minimize, maximize, and close buttons in the title bar.  
     * - `Theme`: If `-Theme` is used, all subsequently created controls in the window will have the Classic Theme appearance.  
     *   Theme can also be used in a control's options during its creation such as `g.AddButton('-Theme')`.  
     * - `ToolWindow`: Provides a narrower title bar, removes the taskbar button, and hides both the maximize and minimize buttons.  
     * - `0x0` Unnamed Style: Specify a plus or minus sign followed immediately by a decimal or hexadecimal style number.  
     * - `E0x0` Unnamed ExStyle: Specify a plus or minus sign followed immediately by the letter E and a decimal or hexadecimal extended style number. For styles not {@link https://www.autohotkey.com/docs/v2/misc/Styles.htm|`documented here`}, see {@link https://learn.microsoft.com/windows/win32/winmsg/extended-window-styles|`Extended Window Styles | Microsoft Docs`} for a complete list.  
     * @returns {(String)} An empty string is always returned.  
     * @example <caption>  
     * Creating a resizeable GUI with no window.</caption>
     * goo := Gui()
     * goo.Opt('-Caption +Border +Resize')
     * goo.btn := goo.AddButton('w100', 'Close Script')
     * goo.btn.OnEvent('Click', exit_script)
     * goo.Show('AutoSize')
     */
    Opt(Options) => EmptyString
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Restore|`Restore()`} unhides and restores the window, if it was minimized or maximized beforehand.  
     * @method
     * @returns {(String)} An empty string is always returned.  
     * @example <caption>  
     * GUI with max, min, and restore buttons.</caption>
     * goo := Gui()
     * goo.btn_max := goo.AddButton('xm ym w100', 'Maximize Window')
     * goo.btn_max.OnEvent('Click', (con, *) => con.gui.Maximize())
     * goo.btn_res := goo.AddButton('xm w100', 'Restore Window')
     * goo.btn_res.OnEvent('Click', (con, *) => con.gui.Restore())
     * goo.btn_min := goo.AddButton('xm w100', 'Minimize Window')
     * goo.btn_min.OnEvent('Click', (con, *) => con.gui.Minimize())
     * goo.Show()
     */
    Restore() => EmptyString
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#SetFont|`SetFont()`} sets the typeface, size, style, and text color for subsequently created controls.  
     * @method
     * @param {(String)} [Options] - Zero or more options separated by spaces.  
     * Styling words. These are executed in order so specifying `norm italic` would reset the text to normal and then italicize it.  
     * - `bold` - Adds a heavy weight/boldness to text.  
     * - `italic` - Italicizes text.  
     * - `strike` - Strikes out text by adding a horizontal line through it.  
     * - `underline` - Underlines text.  
     * - `norm`- Disables all aforementioned settings.It is possible to use norm to turn off all attributes and then selectively turn on others. For example, specifying norm italic would set the font to normal then to italic.  
     * Other options:  
     * - `C#`: Set text color where `#` is one of the following:  
     *   - RGB hex value (0x prefix is optional):  
     *     `C0x000000` to `CFFffFF`  
     *   - {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`}:  
     *     `CBlack`, `CSilver`, `CGray`, `CWhite`, `CMaroon`, `CRed`, `CPurple`, `CFuchsia`  
     *     `CGreen`, `CLime`, `COlive`, `CYellow`, `CNavy`, `CBlue`, `CTeal`, `CAqua`  
     *   - Reset/Default:  
     *     `CDefault` or `C`  
     *   The color option does not affect {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#Button|`buttons`} or {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#StatusBar|`status bars`}.  
     * - `S#`: Size in points where `#` is a decimal value.  
     * - `W#`: Weight/boldness where `#` is a decimal value between 1 and 1000. 400 is normal. 700 is bold.  
     * - `Q#`: {@link https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-createfonta|`Text rendering quality`} where `#` is an integer between 0 and 5.  
     *    - 0 - Window Constant: `DEFAULT_QUALITY` - Appearance of the font does not matter.  
     *    - 1 - Window Constant: `DRAFT_QUALITY` - Appearance of the font is less important than when the PROOF_QUALITY value is used.  
     *    - 2 - Window Constant: `PROOF_QUALITY` - Character quality of the font is more important than exact matching of the logical-font attributes.  
     *    - 3 - Window Constant: `NONANTIALIASED_QUALITY` - Font is never antialiased, that is, font smoothing is not done.  
     *    - 4 - Window Constant: `ANTIALIASED_QUALITY` - Font is antialiased, or smoothed, if the font supports it and the size of the font is not too small or too large.  
     *    - 5 - Window Constant: `CLEARTYPE_QUALITY` - If set, text is rendered (when possible) using ClearType antialiasing method.  
     * @param {(String)} [FontName] - the name of any font, such as one from the {@link https://www.autohotkey.com/docs/v2/misc/FontsStandard.htm|`font table`}.  
     * If FontName is omitted or does not exist on the system, the previous font typeface will be used, otherwise the system's default Gui typeface is used.  
     * @returns {(String)} An empty string is always returned.  
     * @example <caption>  
     * Setting the default font of the </caption>
     * goo := Gui()
     * goo.SetFont('s20 cRed italic', 'Courier New')
     * goo.SetFont('', 'Consolas')
     * goo.AddText('xm ym', 'Default text is set to:'
     *     '`n20 pt, red, with italics and Consolas font.'
     *     '`n`nCourier New is the backup font if Consolas isn`'t present.')
     * goo.Show('AutoSize')
     */
    SetFont([Options:='', FontName:=PriorFont]) => EmptyString
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Show|`Show()`} makes the window visible, unminimizes it (if necessary) and {@link https://www.autohotkey.com/docs/v2/lib/WinActivate.htm|`activates`} it.  
     * @method
     * @param {(String)} [Options] - Zero or more option sseparated by spaces.  
     * If X, Y, W, and H are omitted, the Gui will retrain its previous size and position otherwise it will be auto-centered.  
     * Only decimal numbers should be used. Hex is invalid.  
     * - `W#` and `H#`: The Width/Height of the window's client area in pixels. This does not include the window area, border, or title bar.  
     * - `X#` and `Y#`: The Window's X/Y position on the screen in pixels.  
     * - `Center`: Centers the window horizontally and vertically on the screen.  
     * - `xCenter`: Centers the window horizontally on the screen.  
     * - `yCenter`: Centers the window vertically on the screen.  
     * - `AutoSize`: Resizes the window to accommodate only its currently visible controls.  
     * Only one of the following may be present:
     * - `Minimize`: Minimizes the window and activates the one beneath it.  
     * - `Maximize`: Maximizes and activates the window.  
     * - `Restore`: Unminimizes or unmaximizes the window, if necessary. The window is also shown and activated, if necessary.  
     * - `NoActivate`: Unminimizes or unmaximizes the window, if necessary. The window is also shown without activating it.  
     * - `NA`: Shows the window without activating it. If the window is minimized, it will stay that way but will usually rise higher in the z-order.  
     * - `Hide`: Hides the window and activates the one beneath it. This allows a hidden window to be moved or resized without showing it.  
     * @returns {(String)} An empty string is always returned.  
     * @example <caption>  
     * A GUI that can be hidden and shown with F1.</caption>
     * toggle_gui()
     * 
     * *F1::toggle_gui()
     * 
     * toggle_gui() {
     *     static gu := make_gui()
     *     if WinExist('ahk_id ' goo.hwnd)
     *         goo.Hide()
     *     else goo.Show()
     *     return
     *     
     *     make_gui() {
     *         goo := Gui()
     *         goo.AddText('xm ym w150', 'Press F1 to hide/show GUI.')
     *         goo.btn_exit := goo.AddButton('xm w150', 'Click to close Script')
     *         goo.btn_exit.OnEvent('Click', (*) => ExitApp())
     *         return gu
     *     }
     * }
     */
    Show([Options:='']) => EmptyString
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Submit|`Submit()`} collects the values from named controls and composes them into an {@link https://www.autohotkey.com/docs/v2/lib/Object.htm|`Object`}. Optionally hides the window.  
     * @method
     * @param {(Boolean)} [Hide] - If omitted or true, window is hidden. If false, the window will not be hidden.  
     * @returns {(Object)} An object is returned with a property for each input-capable control.  
     * The control must be one with a {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Value|`value property`} and have been given a {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Name|`name`}.  
     * For DropDownList, ComboBox, ListBox, and Tab, the text of the selected item/tab is stored.  
     * If the control uses AltSubmit or if the ComboBox's text matches an item in the list, the position number is used.  
     * @example <caption>  
     * Using submit to get all the controls from a GUI.</caption>
     * goo := Gui()
     * goo.text := goo.AddText('xm +Border', 'Basic text control')
     * goo.text.Name := 'TextControl'
     * goo.combo := goo.AddEdit('xm w100', 'Combo Box Text')
     * goo.combo.Name := 'EditControl'
     * goo.ddl := goo.AddDDL('xm choose2', ['Apple', 'Banana', 'Cherry'])
     * goo.ddl.Name := 'DDLControl'
     * goo.Show('y200 AutoSize')
     * 
     * results := goo.Submit(0)
     * str := 'Control Info`nNotice that submit doesn`'t get text controls.'
     * for name, value in results.OwnProps()
     *     str .= '`n`nControl name: ' name
     *         . '`nControl value: ' value
     * MsgBox(str)
     */
    Submit([Hide:=1]) => Object
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#__Enum|`__Enum()`} creates an enumerator and allows the iteraiton of a Gui's controls.  
     * Enumerators are usually used with for-loops and not called directly. Guis can be passed directly to a for-loop.  
     * @method
     * @example <caption>  
     * For-looop through all controls using GUI enumerator.</caption>
     * goo := Gui()
     * goo.text := goo.AddText('xm +Border', 'Basic text control')
     * goo.text.Name := 'TextControl'
     * goo.combo := goo.AddEdit('xm w100', 'Combo Box Text')
     * goo.combo.Name := 'EditControl'
     * goo.ddl := goo.AddDDL('xm choose2', ['Apple', 'Banana', 'Cherry'])
     * goo.ddl.Name := 'DDLControl'
     * goo.Show('y200 AutoSize')
     * 
     * str := 'Control Info'
     * for hwnd, control in gu
     *     str .= '`n`nName: ' control.Name
     *         . '`nHandle: ' hwnd
     *         . '`nValue: ' control.Value
     * MsgBox(str)
     */
    __Enum() => Enumerator
    
    /**
     * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#__New|`__New()`} constructs a new Gui instance.  
     * @method
     * @param {(String)} [Options] - Zero or more Gui options, separated by spaces and/or tabs.  
     * For best performance, set all options in 1 call and do so before the window is created.  
     * Use `-` before an option to remove it or `+` to add it. Using no sign is the same as using `+`.  
     * - `AlwaysOnTop`: Makes the window stay on top of all other windows. Same effect as {@link https://www.autohotkey.com/docs/v2/lib/WinSetAlwaysOnTop.htm|`WinSetAlwaysOnTop`}.  
     * - `Border`: Provides a thin-line border around the window.  
     * - `Caption`: Include the standard title bar and a thick window border/edge. If using {@link https://www.autohotkey.com/docs/v2/lib/WinSetTransColor.htm|`WinSetTransColor`}, remove Caption only after setting the TransColor.  
     * - `Disabled`: Disables the window, which prevents the user from interacting with its controls. This is often used on a window that owns other windows (see {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm#Owner|`Owner`}).  
     * - `DPIScale`: If DPI scaling is enabled, coordinates and sizes passed to or retrieved from the Gui and GuiControl methods/properties are automatically scaled based on screen DPI.  
     *   {@link https://www.autohotkey.com/docs/v2/Variables.htm#ScreenDPI|`A_ScreenDPI`} contains the system's current DPI.  
     *   DPI scaling only applies to the Gui and GuiControl methods/properties, so coordinates coming directly from other sources such as ControlGetPos or WinGetPos will not work.  
     * - `LastFound`: Sets the window to {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#LastFoundWindow|`last found window`}. This is done automatically in a GUI thread to allow functions such as {@link https://www.autohotkey.com/docs/v2/lib/WinGetStyle.htm|`WinGetStyle`} and {@link https://www.autohotkey.com/docs/v2/lib/WinSetTransparent.htm|`WinSetTransparent`} to operate on it even if it is hidden.  
     * - `MaximizeBox`: Enables the maximize button in the title bar. This is included when the Resize option is used.  
     * - `MinimizeBox`: Enables the minimize button in the title bar.  
     * - `MaxSize` or `MinSize`: Set, adjust, or remove the minimum/maximum size of the client area of the window, such as when the user drags its edges to resize it.  
     *   `+MaxSize`/`+MinSize` uses the current window size as the maximum/minimum.  
     *   Alternatively, `+MaxSize640x480`/`+MinSize640x480` would set the max/min size to 640 pixels wide by 480 pixels tall and the width or height may be omitted, though the `x` separator must always be present.  
     * - `OwnDialogs`: Should be specified in each thread for which subsequently displayed MsgBox, InputBox, FileSelect, and DirSelect dialogs should be owned by the window.  
     *   These dialogs become modal, meaning that the user cannot interact with the Gui until the dialog box is dismissed.  
     *   ToolTip cannot become modal even though they become owned. Instead, they wilstay always on top of the owner.  
     * - `Owner`: Causes the window to be owned by another. Include the handle (HWND) to another window after the word owner to make the Gui owned by that Window.  
     *   Omitting a handle (HWND) will make the Gui owned by the script's main window.  
     * - `Parent`: Use `+Parent` immediately followed by the handle (HWND) of any window or control to use it as the parent of this window while `-Parent` will revert it back to a top-level window.  
     * - `Resize`: Makes the window resizable and enables its maximize button in the title bar. The maximize button can be removed with `-MaximizeBox`.  
     * - `SysMenu`: Adds or removes the system menu and icon in the window's upper left corner. This includes the minimize, maximize, and close buttons in the title bar.  
     * - `Theme`: If `-Theme` is used, all subsequently created controls in the window will have the Classic Theme appearance.  
     *   Theme can also be used in a control's options during its creation such as `g.AddButton('-Theme')`.  
     * - `ToolWindow`: Provides a narrower title bar, removes the taskbar button, and hides both the maximize and minimize buttons.  
     * - `0x0` Unnamed Style: Specify a plus or minus sign followed immediately by a decimal or hexadecimal style number.  
     * - `E0x0` Unnamed ExStyle: Specify a plus or minus sign followed immediately by the letter E and a decimal or hexadecimal extended style number. For styles not {@link https://www.autohotkey.com/docs/v2/misc/Styles.htm|`documented here`}, see {@link https://learn.microsoft.com/windows/win32/winmsg/extended-window-styles|`Extended Window Styles | Microsoft Docs`} for a complete list.  
     * @param {(String)} [Title] - The window title. If omitted, it defaults to the current value of {@link https://www.autohotkey.com/docs/v2/Variables.htm#ScriptName|`A_ScriptName)`}.  
     * @param {(Object)} [EventObj] - An "event sink", or object to bind events to.  
     * If EventObj is specified, {@link https://www.autohotkey.com/docs/v2/lib/GuiOnEvent.htm|`OnEvent()`}, {@link https://www.autohotkey.com/docs/v2/lib/GuiOnNotify.htm|`OnNotify`} and {@link https://www.autohotkey.com/docs/v2/lib/GuiOnCommand.htm|`OnCommand`} can be used to register methods of EventObj to be called when an event is raised.  
     * If omitted or empty, any string passed to OnEvent's Function parameter is interpreted as a function name.  
     * @returns {(Gui)} New gui object
     * @example <caption>  
     * ?</caption>
     */  
    __New([Options, Title, EventObj]) => Gui
}


/**
 * 
 */
class Primitive extends Any {
    class Number extends Primitive {
        Class Float extends Numbers {
            
        }
        
        Class Integer extends Numbers {
            
        }
    }
    
    Class String extends Primitive {
        
    }
}

/**
 * 
 */
class VarRef extends Any {
    
}

/**
 * 
 */
class ComValue extends Any {
    
}
;#endregion

;#region functions

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/Math.htm#Abs|`Abs()`} returns the absolute value of the specified number.  
 * Absolute value is the greatest magnitude of the number regardless of its sign.  
 * @param {(Number)} Num - Number to get absolute value of.
 * @returns {(Number)} Absolute value of number
 * @example <caption>  
 * </caption>
 */
Abs(Num) => Number

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/Math.htm#ASin|`ASin()`} returns the arcsine in radians.  
 * Arcsine is the inverse trigonometric function of the sine function.  
 * @param {(Number)} Num - The sine number. Must be between 1 and -1.  
 * @returns {(Number)} Arcsine in radians.  
 * @example <caption>  
 * </caption>
 */
ASin(Num) => Number

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/Math.htm#ACos|`ACos()`} returns the arccosine in radians.  
 * Arccosine is the inverse trigonometric function of the cosine function.  
 * @param {(Number)} Num - The cosine number. This must be between 1 and -1.  
 * @returns {(Number)} Arccosine in radians.  
 * @example <caption>  
 * </caption>
 */
ACos(Num) => Number

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/Math.htm#ATan|`ATan()`} returns the arctangent in radians.  
 * Arctangent is the inverse trigonometric function of the tangent function.  
 * @param {(Number)} Num - The tangent number.  
 * @returns {(Number)} Arctangent in radians.  
 * @example <caption>  
 * </caption>
 */
ATan(Num) => Number

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/BlockInput.htm|`BlockInput()`} disables or enables the user's  
 * ability to interact with the computer via keyboard and mouse.  
 * @param {(String|Integer)} [Mode] - Each of the 3 mode  
 * groups 
 * operate independently of each other.  
 * - **OnOff**
 *   - `On` or `1` = Mouse and keyboard input is disabled.  
 *   - `Off` or `0` = Mouse and keyboard input is enabled.  
 * - **SendMouse**
 *   - `Send` = Keyboard and mouse input is disabled while a {@link https://www.autohotkey.com/docs/v2/lib/Send.htm#SendEvent|`SendEvent`} is running.  
 *     This prevents the disruption of keys being sent.  
 *   - `Mouse` = Keyboard and mouse input is disabled while {@link https://www.autohotkey.com/docs/v2/lib/Click.htm|`Click()`}  
 *     , {@link https://www.autohotkey.com/docs/v2/lib/MouseMove.htm|`MouseMove()`}
 *     , {@link https://www.autohotkey.com/docs/v2/lib/MouseClick.htm|`MouseClick()`}
 *     , or {@link https://www.autohotkey.com/docs/v2/lib/MouseClickDrag.htm|`MouseClickDrag()`} is running.  
 *     Prevents user mouse input from disrupting mouse events.  
 *   - `SendAndMouse` = Enables both of the modes mentioned above.
 *   - `Default` = Disables both `Send` and `Mouse` modes if they're on.  
 * - **MouseMove**  
 *   - `MouseMove` = User mouse movement is disabled.  
 *     DirectInput applications are a possible exception.  
 *   - `MouseMoveOff` = Disables `MouseMove` if it's enabled.  
 * @returns {(String)} An empty string is always returned.  
 * @example <caption>  
 * </caption>
 */
BlockInput([Mode]) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/CallbackCreate.htm|`CallbackCreate()`} creates a machine-code address that when called,  
 * redirects the call to a function in the script.  
 * @param {(FuncObj)} Function - A {@link https://www.autohotkey.com/docs/v2/misc/Functor.htm|`function object`} to call when  
 * the created callback address is called.  
 * @param {(String)} Options - 
 * - Empty, a new {@link https://www.autohotkey.com/docs/v2/misc/Threads.htm|`thread`}  
 * - `Fast` or `F` = Avoid starting a new thread each time the Function Object is called.  
 * - `CDecl` or `C` = Causes address to conform to the 'C' calling convention.  
 *   Typically omitted because standard calling is much more common for callbacks.  
 * - `&` = Causes the address of the parameter list to be passed to Function.  
 *   Parameter values can be retrieved using NumGet. 
 When using the standard 32-bit calling convention, 
 ParamCount must specify the size of the parameter list in DWORDs (the number of bytes divided by 4).
 * @param {(Integer)} ParamCount - If omitted, {@link https://www.autohotkey.com/docs/v2/lib/Func.htm#MinParams|`Function.MinParams`} is used.  
 *  Otherwise, the number of parameters that Address' caller will pass to it.  
 *  In either case, ensure that the caller passes exactly this number of parameters
 * @returns {(Integer)} A machine code address.  
 * @example <caption>  
 * </caption>
 */
CallbackCreate(Function [, Options:='', ParamCount:=Function.MinParams]) => Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/CallbackCreate.htm#CallbackFree|`CallbackFree()`} frees a callback created by {@link https://www.autohotkey.com/docs/v2/lib/CallbackCreate.htm#CallbackFree|`CallbackCreate()`}.  
 * @param {(Integer)} Address - A callback address.  
 * @returns {(String)} An empty string is always returned.  
 * @example <caption>  
 * </caption>
 */
CallbackFree(Address) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/CaretGetPos.htm|`CaretGetPos()`} retrieves the current position of the text caret.  
 * @param {(VarRef)} [OutputVarX] - The variable to store the caret's X client coordinate (if provided).  
 * @param {(VarRef)} [OutputVarY] - The variable to store the caret's Y client coordinate (if provided).  
 * @returns {(Boolean)} `1` if caret found, else `0`  
 * @example <caption>  
 * </caption>
 */
CaretGetPos([&OutputVarX, &OutputVarY]) => Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/Math.htm#Ceil|`Ceil()`} rounds a number up to the nearest integer.  
 * @param {(Number)} Num - The number to round up.  
 * @returns {(Integer)} The rounded up integer.  
 * @example <caption>  
 * </caption>
 */
Ceil(Num) => Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/Chr.htm|`Chr()`} returns the string (usually a single character) corresponding to the character code indicated by the specified number.  
 * @param {(Integer)} UnicodeNumber - A Unicode character between 0x0 and 0x10FFFF.  
 * Numbers in the range 0x10000 to 0x10FFFF produce 2 characters.  
 * 0 produces a binary null character, not an empty string.  
 * @returns {(String)} The character(s) of the UnicodeNumber.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/Ord.htm|`Ord()`}
 * , {@link https://www.autohotkey.com/docs/v2/Concepts.htm#string-encoding|`String Encoding`}
 * @example <caption>  
 * </caption>
 */
Chr(UnicodeNumber) => String

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/Click.htm|`Click()`} sends a click event to a specified cooridnate.  
 * Alternatively, all options can be passed in as a single string.  
 * @param {(String)} [Button] - Mouse button to click:  
 *   - `L`/`Left`, `R`/`Right`, `M`/`Middle`
 *   - `X1` (XButton1), `X2` (XButton2)  
 *   - `WU`/`WheelUp`, `WD`/`WheelDown`, `WR`/`WheelRight`, `WL`/`WheelLeft`  
 * @param {(Integer)} [X] - The X coordinate to click at.  
 * {@link https://www.autohotkey.com/docs/v2/lib/CoordMode.htm|`CoordMode()`} dictates where x0 y0 starts at  
 * `Client` is suggested unless working with the desktop  
 * If `Relative` is used, x0 y0 is the mouse cursor.  
 * If omitted, the current mouse X value is used
 * @param {(Integer)} [Y] - The Y coordinate to click at  
 * {@link https://www.autohotkey.com/docs/v2/lib/CoordMode.htm|`CoordMode()`} dictates where x0 y0 starts at  
 * `Client` is suggested unless working with the desktop  
 * If `Relative` is used, x0 y0 is the mouse cursor.  
 * If omitted, the current mouse Y value is used
 * @param {(Integer)} [Count] - The number of times to click  
 * If omitted, `1` is used  
 * @param {(String)} [State] - Send the up state, down state, or full click.  
 * - Omit = A full click is sent  
 * - `D` = Down event. The button is logically held down.  
 * - `U` = Up event. The button is logically released.  
 * @param {(String)} [Relative] - Include the word `Rel` to click relative to the current mouse position.  
 * `X` and `Y` parameters are used as offsets from the current mouse position.  
 * In other words, the mouse cursor becomes x0 y0.  
 * @returns {(String)} An empty string is always returned.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/CoordMode.htm|`CoordMode()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SendMode.htm|`SendMode()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SetDefaultMouseSpeed.htm|`SetDefaultMouseSpeed()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SetMouseDelay.htm|`SetMouseDelay()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/MouseClick.htm|`MouseClick()`},  
 * {@link https://www.autohotkey.com/docs/v2/lib/MouseClickDrag.htm|`MouseClickDrag()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/MouseGetPos.htm|`MouseGetPos()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/MouseMove.htm|`MouseMove()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/ControlClick.htm|`ControlClick()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/BlockInput.htm|`BlockInput()`}
 * @example <caption>__
 * </caption>
 */
Click([Button:='L', X:=CurrentX, Y:=CurrentY, Count:=1, Speed:=2, State:=unset, Relative:=unset]) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/ClipWait.htm|`ClipWait()`} waits until the clipboard contains data.  
 * Clear the clipboard proior to using ClipWait() `A_Clipboard := 0`  
 * @param {(Number)} [TimeoutInSec] - Time to wait in seconds.  
 * This can be a float fractions of a second.  
 * If omitted, function will wait indefinitely.  
 * @param {(Integer)} [WaitForType] - Type of data to check for:  
 * `0` = Wait for text  
 * `1` = Wait for any type of data  
 * @returns {(Boolean)} `0` if timed out, else `1`
 * @see {@link https://www.autohotkey.com/docs/v2/lib/A_Clipboard.htm|`A_Clipboard()`}, 
 * {@link https://www.autohotkey.com/docs/v2/lib/WinWait.htm|`WinWait()`}, 
 * {@link https://www.autohotkey.com/docs/v2/lib/KeyWait.htm|`KeyWait()`}
 * @example <caption>  
 * </caption>
 */
ClipWait([TimeoutInSec:=Unset, WaitForType:=0]) => String

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/ComCall.htm|`ComCall()`} calls a native COM interface method by index.  
 * @param {(Integer)} Index - The zero-based index of the method  
 * within the virtual function table. Corresponds to the method's  
 * position within the original interface definition.  
 * An invalid index can cause undefined behaviour, up to program termination.
 * @param {(Integer|Object)} ComObj - The target COM object.  
 * Pointer value can be passed directly or encapsulated within an object  
 * with the Ptr property, such as a {@link https://www.autohotkey.com/docs/v2/lib/ComValue.htm|`ComValue`} with variant type VT_UNKNOWN.
 * @param {(String|Integer)} [TypeN] - Arg's data type.  
 * - {@link https://www.autohotkey.com/docs/v2/lib/DllCall.htm#str|`String`}: `Str`, `WStr`, `AStr`  
 * - {@link https://www.autohotkey.com/docs/v2/lib/DllCall.htm#Int|`Integer`}: `Int64`, `Int`, `Short`, `Char`  
 * - Float: `Float`, `Double`  
 * - {@link https://www.autohotkey.com/docs/v2/lib/DllCall.htm#unsigned|`Unsigned numbers`}: `UInt`, `UShort`, `UChar`, `UPtr` (only 32-bit pointers)
 * - {@link https://www.autohotkey.com/docs/v2/lib/DllCall.htm#ptr|`Pointer`}: `Ptr`, `* or P [suffix]`  
 * - {@link https://www.autohotkey.com/docs/v2/lib/DllCall.htm#HRESULT|`COM`}: `HRESULT`  
 * 
 * There can be be multiple `type, arg` pairs listed sequentially.  
 * @param {(String)} [ArgN] - The argument being passed.  
 * There can be be multiple `type, arg` pairs listed sequentially.  
 * @param {(String)} [ReturnType] - If omitted, return type defaults to {@link https://www.autohotkey.com/docs/v2/lib/DllCall.htm#HRESULT|`HRESULT`}  
 * If there is no return type (such as C's `void`), specify `Int` or another numeric type.  
 * `Cdecl` is supported but is generally not used by COM interface methods.
 * @returns {(String|Integer)} The actual value returned by the method  
 * @throws {(OSError)} - Any result indicating failure throws an {@link https://www.autohotkey.com/docs/v2/lib/Error.htm#OSError|`OSError`}  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/Buffer.htm|`Buffer object`}
 * ,{@link https://www.autohotkey.com/docs/v2/lib/ComObject.htm|`ComObject`}  
 * ,{@link https://www.autohotkey.com/docs/v2/lib/ComObjQuery.htm|`ComObjQuery()`}
 * ,{@link https://www.autohotkey.com/docs/v2/lib/ComValue.htm|`ComValue`}
 * ,{@link https://www.autohotkey.com/docs/v2/lib/CallbackCreate.htm|`CallbackCreate()`}
 * @example <caption>  
 * </caption>
 */
ComCall(Index, ComObj [, TypeN:=Unset, ArgN:=Unset, ReturnType:='HRESULT']) => String | Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/ComObjActive.htm|`ComObjActive()`} retrieves a registered COM object.  
 * @param {(String)} CLSID - CLSID or human-readable Prog ID of the COM object to retrieve.  
 * @returns {(ComObject)} A COM wrapper object with the {@link https://www.autohotkey.com/docs/v2/lib/ComObjType.htm#vt|`variant type VT_DISPATCH (9)`}.
 * @throws {{Error}} - An exception is thrown on failure.
 * @see {@link https://www.autohotkey.com/docs/v2/lib/ComValue.htm|`ComValue`}
 * , {@link https://www.autohotkey.com/docs/v2/lib/ComObject.htm|`ComObject`}
 * , {@link https://www.autohotkey.com/docs/v2/lib/ComObjGet.htm|`ComObjGet()`}
 * , {@link https://www.autohotkey.com/docs/v2/lib/ComObjFlags.htm|`ComObjFlags()`}  
 * , {@link https://www.autohotkey.com/docs/v2/lib/ComObjConnect.htm|`ComObjConnect()`}
 * , {@link https://www.autohotkey.com/docs/v2/lib/ObjAddRef.htm|`ObjAddRef()/ObjRelease()`}  
 * , {@link https://www.autohotkey.com/docs/v2/lib/ComObjQuery.htm|`ComObjQuery()`}
 * , {@link https://learn.microsoft.com/windows/win32/api/oleauto/nf-oleauto-getactiveobject|`GetActiveObject (Microsoft Docs)`}
 * @example <caption>  
 * Use {@link https://learn.microsoft.com/office/vba/api/Word.Application|`Word COM`} to view the current opened MS Word doc.</caption>  
 * word_com := ComObjActive("Word.Application")
 * if !word_com
 *     MsgBox("Word isn't open.")
 * else
 *     MsgBox(word.ActiveDocument.FullName)
 */
ComObjActive(CLSID) => ComObject

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/ComObjConnect.htm|`ComObjConnect()`} connects a COM object's event source to the script, enabling events to be handled.  
 * @param {(ComObject)} ComObj - An object which raises events.  
 * An error is shown if the object does not support {@link https://learn.microsoft.com/en-us/windows/win32/api/ocidl/nn-ocidl-iconnectionpointcontainer|`IConnectionPointContainer`}.
 * @param {(String|Object)} PrefixOrSink - If omitted, the object is "disconnected".  
 * Otherwise, specify a string to prefix to the event name to determine which  
 * global function to call when an event occurs.  
 * Or an {@link https://www.autohotkey.com/docs/v2/lib/ComObjConnect.htm#event-sink|`event sink object`} with static methods for each event handler.
 * @returns {(String)} An empty string is always returned.  
 * @see
 * {@link https://www.autohotkey.com/docs/v2/lib/ComObject.htm|`ComObject`}
 * , {@link https://www.autohotkey.com/docs/v2/lib/ComObjGet.htm|`ComObjGet()`}
 * , {@link https://www.autohotkey.com/docs/v2/lib/ComObjActive.htm|`ComObjActive()`}
 * , {@link https://learn.microsoft.com/previous-versions/ccxe1xe6(v=vs.85)|`WScript.ConnectObject (Microsoft Docs)`}
 * @example <caption>  
 * </caption>
 */
ComObjConnect(ComObj [, PrefixOrSink:=unset]) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/ComObjFlags.htm|`ComObjFlags()`} retrieves or changes flags which  
 * control a COM wrapper object's behaviour.  
 * @param {(Object)} ComObj - A COM wrapper object. See {@link https://www.autohotkey.com/docs/v2/lib/ComValue.htm|`ComValue`}.  
 * @param {(Integer)} NewFlags - New values for the flags identified  
 * by Mask, or flags to add or remove.  
 * @param {(Integer)} Mask - A bitmask of flags to change.  
 * @returns {(Integer)} New flags of the specified COM object  
 * @throws {(TypeError)} - If `ComObj` not a valid COM wrapper object  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/ComValue.htm|`ComValue`}
 * , {@link https://www.autohotkey.com/docs/v2/lib/ComObjActive.htm|`ComObjActive()`}
 * , {@link https://www.autohotkey.com/docs/v2/lib/ComObjArray.htm|`ComObjArray()`}
 * @example <caption>  
 * </caption>
 */
ComObjFlags(ComObj [, NewFlags:=unset, Mask:=unset]) => Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/ComObjFromPtr.htm|`ComObjFromPtr()`} wraps a raw {@link https://learn.microsoft.com/windows/win32/api/oaidl/nn-oaidl-idispatch|`IDispatch`} pointer  
 * (COM object) for use by the script.  
 * @param {(Integer)} DispPtr - A non-null interface pointer  
 * for IDispatch or a derived interface.  
 * @returns {(ComObject)} A wrapper object containing the  
 * {@link https://www.autohotkey.com/docs/v2/lib/ComObjType.htm#vt|`variant type VT_DISPATCH`} and the given pointer  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/ComValue.htm|`ComValue`},
 * {@link https://www.autohotkey.com/docs/v2/lib/ComObject.htm|`ComObject`},
 * {@link https://www.autohotkey.com/docs/v2/lib/ComObjGet.htm|`ComObjGet()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/ComObjConnect.htm|`ComObjConnect()`},  
 * {@link https://www.autohotkey.com/docs/v2/lib/ComObjFlags.htm|`ComObjFlags()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/ObjAddRef.htm|`ObjAddRef()/ObjRelease()`},  
 * {@link https://www.autohotkey.com/docs/v2/lib/ComObjQuery.htm|`ComObjQuery()`},
 * {@link https://learn.microsoft.com/windows/win32/api/oleauto/nf-oleauto-getactiveobject|`GetActiveObject (Microsoft Docs)`}
 * @example <caption>  
 * </caption>
 */
ComObjFromPtr(DispPtr) => String

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/ComObjGet.htm|`ComObjGet()`} returns a reference to an  object  
 * provided by a COM component.  
 * @param {(String)} Name - The display name of the object  
 * to be retrieved. See: {@link https://learn.microsoft.com/windows/win32/api/objbase/nf-objbase-mkparsedisplayname|`MkParseDisplayName (Microsoft Docs)`}  
 * @returns {(ComObject)} A new COM wrapper object with  
 * the {@link https://www.autohotkey.com/docs/v2/lib/ComObjType.htm#vt|`variant type VT_DISPATCH (9)`}.
 * @see {@link https://www.autohotkey.com/docs/v2/lib/ComObject.htm|`ComObject`},
 * {@link https://www.autohotkey.com/docs/v2/lib/ComObjActive.htm|`ComObjActive()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/ComObjConnect.htm|`ComObjConnect()`},  
 * {@link https://www.autohotkey.com/docs/v2/lib/ComObjQuery.htm|`ComObjQuery()`},
 * {@link https://learn.microsoft.com/windows/win32/api/objbase/nf-objbase-cogetobject|`CoGetObject (Microsoft Docs)`}
 * @example <caption>  
 * </caption>
 */
ComObjGet(Name) => ComObject


/**
 * {@link https://www.autohotkey.com/docs/v2/lib/ComObjQuery.htm|`ComObjQuery()`} queries a COM object for an interface or service.  
 * @param {(Object|Integer)} ComObj - A COM wrapper object, interface pointer,  
 * or object with a Ptr property which returns an interface pointer.  
 * GUID format: `{xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}`  
 * @param {(String)} IIDorSID - Either an interface identifier (GUID) or a  
 * service identifier. If this is a service identifier, an interface  
 * identifier must be passed into the 3rd param.  
 * @param {(String)} IID - A service identifier in the same form as IID.  
 * @returns {(Object)} A COM wrapper object based on the IID  
 * - `IID_IDispatch` => ({@link https://www.autohotkey.com/docs/v2/lib/ComObject.htm|`ComObject`}) VT_Dispatch (9)  
 *   The script can call properties/methods using normal {@link https://www.autohotkey.com/docs/v2/Objects.htm#Usage_Objects|`object syntax`}.
 * - `Any other IID` => ({@link https://www.autohotkey.com/docs/v2/lib/ComValue.htm|`ComValue`}) - VT_UNKNOWN (13)  
 *   Provides a `Ptr` property that can be passed to {@link https://www.autohotkey.com/docs/v2/lib/DllCall.htm|`DllCall()`} or {@link https://www.autohotkey.com/docs/v2/lib/ComCall.htm|`ComCall`}.
 * @throws {(Error)} - Any failure, such as "interface not supported."
 * @see 
 * {@link https://www.autohotkey.com/docs/v2/lib/ComObjGet.htm|`ComObjGet()`}
 * {@link https://www.autohotkey.com/docs/v2/lib/ComCall.htm|`ComCall()`}
 * {@link https://www.autohotkey.com/docs/v2/lib/ComObjActive.htm|`ComObjActive()`}
 * @example <caption>  
 * </caption>
 * @returns {string} 
 */
ComObjQuery(ComObj, IIDorSID, IID) => Object

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/ComObjType.htm|`ComObjType()`} retrieves type information from a COM object.  
 * @param {(Object)} ComObj - A wrapper object containing a  
 * COM object or typed value. See {@link https://www.autohotkey.com/docs/v2/lib/ComValue.htm|`ComValue`} for details.
 * @param {(String)} [InfoType]
 * - Omitted = Integer {@link https://www.autohotkey.com/docs/v2/lib/ComObjType.htm#vt|`variant type code`} indicating COM type is retrieved.  
 * - `Name` = Name of the object's default interface.  
 * - `IID` = Object's default interface GUID.  
 * - `Class` = Object's class name (Not the same as Prog ID)
 * - `CLSID` = Object's class GUID.  
 * @returns {(Integer|String)} Return value depnds on InfoType  
 * Empty string is returned if param is invalid or info can't be retrieved.
 * @see {@link https://www.autohotkey.com/docs/v2/lib/ComValue.htm|`ComValue`},
 * {@link https://www.autohotkey.com/docs/v2/lib/ComObject.htm|`ComObject`},
 * {@link https://www.autohotkey.com/docs/v2/lib/ComObjValue.htm|`ComObjValue()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/ComObjGet.htm|`ComObjGet()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/ComObjGet.htm|`ComObjGet()`}
 * @example <caption>  
 * </caption>
 */
ComObjType(ComObj [, InfoType:=unset]) => Integer | String

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/ComObjValue.htm|`ComObjValue()`} retrieves the value or pointer stored in a COM wrapper object.  
 * @param {(Object)} ComObj - A wrapper object containing a  
 * COM object or typed value. See {@link https://www.autohotkey.com/docs/v2/lib/ComValue.htm|`ComValue`} for details.
 * @returns {(Integer)} A 64-bit signed integer
 * @throws {(TypeError)} - `ComObj` is not a COM wrapper object
 * @see {@link https://www.autohotkey.com/docs/v2/lib/ComObject.htm|`ComObject`},
 * {@link https://www.autohotkey.com/docs/v2/lib/ComObjType.htm|`ComObjType()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/ComObjGet.htm|`ComObjGet()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/ComObjGet.htm|`ComObjGet()`}
 * @example <caption>  
 * </caption>
 */
ComObjValue(ComObj) => String

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/ControlAddItem.htm|`ControlAddItem()`} adds the specified string as a new entry  
 * at the bottom of a ListBox or ComboBox.  
 * @param {(String)} Str - String to add.  
 * @param {(String|Integer|Object)} Control - A control's ClassNN,  
 * Text, HWND (handle), or an object with an HWND. See {@link https://www.autohotkey.com/docs/v2/lib/Control.htm#Parameter|`Control Parameter`}.
 * @param {(String|Integer|Object)} [WinTitle] - A string using a {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`} to match a window.  
 * Types: {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_exe|`ahk_exe`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_class|`ahk_class`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_id|`ahk_id`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_pid|`ahk_pid`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_group|`ahk_group`}  
 * If the string is the letter `A`, the current active window is used.  
 * If all `Win` params are omited, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#LastFoundWindow|`Last Found Window`} is used.  
 * @param {(String)} [WinText] - Text that must be found in the window.  
 * Use WindowSpy to view window text.  
 * @param {(String)} [NoWinTitle] - Window title does not contain this text.  
 * @param {(String)} [NoWinText] - Text that must not appear in the window.
 * Use WindowSpy to view window text.
 * @returns {(Integer)} Index of the new item  
 * @throws {(TargetError)} - Window or control could not be found  
 * Or control's class does not contain `Combo` or `List`
 * @throws {(Error|OSError)} - Item could not be added  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/ControlDeleteItem.htm|`ControlDeleteItem()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/ControlFindItem.htm|`ControlFindItem()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Add|`GuiControl.Add()`},  
 * {@link https://www.autohotkey.com/docs/v2/lib/Control.htm|`Control functions`},
 * {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SetTitleMatchMode.htm|`SetTitleMatchMode()`}
 * @example <caption>  
 * </caption>
 */
ControlAddItem(Str, Control [, WinTitle:='', WinText:='', NoWinTitle:='', NoWinText:='']) => Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/ControlChooseIndex.htm|`ControlChooseIndex()`} sets the selection in a ListBox,  
 * ComboBox or Tab control to specified index.  
 * @param {(Integer)} N - The index number to select.  
 * 0 deselects all entries of a Listbox or ComboBox.  
 * @param {(String|Integer|Object)} Control - A control's ClassNN,  
 * Text, HWND (handle), or an object with an HWND. See {@link https://www.autohotkey.com/docs/v2/lib/Control.htm#Parameter|`Control Parameter`}.
 * @param {(String|Integer|Object)} [WinTitle] - A string using a {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`} to match a window.  
 * Types: {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_exe|`ahk_exe`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_class|`ahk_class`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_id|`ahk_id`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_pid|`ahk_pid`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_group|`ahk_group`}  
 * If the string is the letter `A`, the current active window is used.  
 * If all `Win` params are omited, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#LastFoundWindow|`Last Found Window`} is used.  
 * @param {(String)} [WinText] - Text that must be found in the window.  
 * Use WindowSpy to view window text.  
 * @param {(String)} [NoWinTitle] - Window title does not contain this text.  
 * @param {(String)} [NoWinText] - Text that must not appear in the window.
 * Use WindowSpy to view window text.
 * @returns {(String)} An empty string is always returned.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/ControlGetIndex.htm|`ControlGetIndex()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/ControlChooseString.htm|`ControlChooseString()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Choose|`GuiControl.Choose()`},  
 * {@link https://www.autohotkey.com/docs/v2/lib/Control.htm|`Control functions`},
 * {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SetTitleMatchMode.htm|`SetTitleMatchMode()`}
 * @example <caption>  
 * </caption>
 */
ControlChooseIndex(N, Control [, WinTitle:='', WinText:='', NoWinTitle:='', NoWinText:='']) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/ControlChooseString.htm|`ControlChooseString()`} sets the selection in a ListBox or ComboBox  
 * to be the first entry that matches the specified string.  
 * @param {(String)} Str - The string to choose. This is not case sensitive. 
 * @param {(String|Integer|Object)} Control - A control's ClassNN,  
 * Text, HWND (handle), or an object with an HWND. See {@link https://www.autohotkey.com/docs/v2/lib/Control.htm#Parameter|`Control Parameter`}.
 * @param {(String|Integer|Object)} [WinTitle] - A string using a {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`} to match a window.  
 * Types: {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_exe|`ahk_exe`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_class|`ahk_class`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_id|`ahk_id`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_pid|`ahk_pid`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_group|`ahk_group`}  
 * If the string is the letter `A`, the current active window is used.  
 * If all `Win` params are omited, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#LastFoundWindow|`Last Found Window`} is used.  
 * @param {(String)} [WinText] - Text that must be found in the window.  
 * Use WindowSpy to view window text.  
 * @param {(String)} [NoWinTitle] - Window title does not contain this text.  
 * @param {(String)} [NoWinText] - Text that must not appear in the window.
 * Use WindowSpy to view window text.
 * @returns {(Integer)} The index of the chosen item.  
 * @see  
 * {@link https://www.autohotkey.com/docs/v2/lib/ControlChooseIndex.htm|`ControlChooseIndex()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/ControlGetChoice.htm|`ControlGetChoice()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Choose|`GuiControl.Choose()`},  
 * {@link https://www.autohotkey.com/docs/v2/lib/Control.htm|`Control functions`},
 * {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SetTitleMatchMode.htm|`SetTitleMatchMode()`}
 * @example <caption>  
 * </caption>
 */
ControlChooseString(Str, Control [, WinTitle:='', WinText:='', NoWinTitle:='', NoWinText:='']) => Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/ControlClick.htm|`ControlClick()`} sends a mouse button or mouse wheel event to a control.  
 * @param {(String|Integer|Object)} [ConOrPos]  
 * - Omitted: The target window itself is clicked.  
 * - Position: Specify an x and y value separated by a space/tab.  
 * 
 *       ControlClick('x100 y200')
 * - Control: A control's ClassNN, Text, HWND (handle),  
 *   or an object with an HWND. See {@link https://www.autohotkey.com/docs/v2/lib/Control.htm#Parameter|`Control Parameter`}  
 * 
 *       ControlClick('Button2')  
 * @param {(String|Integer|Object)} [WinTitle] - A string using a {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`} to match a window.  
 * Types: {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_exe|`ahk_exe`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_class|`ahk_class`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_id|`ahk_id`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_pid|`ahk_pid`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_group|`ahk_group`}  
 * If the string is the letter `A`, the current active window is used.  
 * If all `Win` params are omited, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#LastFoundWindow|`Last Found Window`} is used.  
 * @param {(String)} [WinText] - Text that must be found in the window.  
 * Use WindowSpy to view window text.  
 * @param {(String)} [Button] - If omitted, defaults to left click.  
 * `L`/`Left`, `R`/`Right`, `M`/`Middle`, `X1` (XButton1), `X2` (XButton2)  
 * `WU`/`WheelUp`, `WD`/`WheelDown`, `WR`/`WheelRight`, `WL`/`WheelLeft`  
 * @param {(Integer)} [Count] - Number of times to click. Defaults to 1.  
 * @param {(String)} [Options] - 
 * - Omitted: Down and then up events are sent to the middle of the control.  
 * - `NA`: May improve {@link https://www.autohotkey.com/docs/v2/lib/ControlClick.htm#Reliability|`reliability`}.  
 * - `D`/`U`: Set button state to **D**own (hold) or **U**p (release).  
 * - `Pos`: Forces the `ConOrPos` variable to be Position (coordinates).  
 * - `X`\`Y`: Set the X and Y position of the click **on the control**.  
 *   The coordinates are relative to the **control's** upper left corner.  
 *   Coordinates must be decimal format.  
 * @param {(String)} [NoWinTitle] - Window title does not contain this text.  
 * @param {(String)} [NoWinText] - Text that must not appear in the window.
 * Use WindowSpy to view window text.
 * @returns {(String)} An empty string is always returned.  
 * @throws {(TargetError)} - The target window or target control could not be found.  
 * @throws {(OSError)} - X and Y coords were omited and control's position was undetermined.  
 * @throws {(ValueError|TypeError)} - Invalid parameters were detected.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/SetControlDelay.htm|`SetControlDelay()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Control.htm|`Control functions`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Click.htm|`Click()`},
 * {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SetTitleMatchMode.htm|`SetTitleMatchMode()`}
 * @example <caption>  
 * </caption>
 */
ControlClick([ConOrPos:=unset, WinTitle:='', WinText:='', Button:='Left', Count:=1, Options:=unset, NoWinTitle:='', NoWinText:='']) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/ControlDeleteItem.htm|`ControlDeleteItem()`} deletes the specified entry number from a ListBox or ComboBox.  
 * @param {(Integer)} N - The index of the item to delete.  
 * @param {(String|Integer|Object)} Control - A control's ClassNN,  
 * Text, HWND (handle), or an object with an HWND. See {@link https://www.autohotkey.com/docs/v2/lib/Control.htm#Parameter|`Control Parameter`}.
 * @param {(String|Integer|Object)} [WinTitle] - A string using a {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`} to match a window.  
 * Types: {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_exe|`ahk_exe`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_class|`ahk_class`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_id|`ahk_id`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_pid|`ahk_pid`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_group|`ahk_group`}  
 * If the string is the letter `A`, the current active window is used.  
 * If all `Win` params are omited, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#LastFoundWindow|`Last Found Window`} is used.  
 * @param {(String)} [WinText] - Text that must be found in the window.  
 * Use WindowSpy to view window text.  
 * @param {(String)} [NoWinTitle] - Window title does not contain this text.  
 * @param {(String)} [NoWinText] - Text that must not appear in the window.
 * Use WindowSpy to view window text.
 * @returns {(String)} An empty string is always returned.  
 * @throws {(TargetError)} - Window or control could not be found  
 * Or control's class does not contain `Combo` or `List`
 * @throws {(Error|OSError)} - Item could not be added  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/ControlAddItem.htm|`ControlAddItem()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/ControlFindItem.htm|`ControlFindItem()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Delete|`GuiControl.Delete()`},  
 * {@link https://www.autohotkey.com/docs/v2/lib/Control.htm|`Control functions`},
 * {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SetTitleMatchMode.htm|`SetTitleMatchMode()`}
 * @example <caption>  
 * </caption>
 */
ControlDeleteItem(N, Control [, WinTitle:='', WinText:='', NoWinTitle:='', NoWinText:='']) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/ControlFindItem.htm|`ControlFindItem()`} returns the entry number of a ListBox or ComboBox  
 * that is a complete match for the specified string.  
 * @param {(String)} Str - The string to find. This is not case sensitive.  
 * The entire text must match, not just the leading part.  
 * @param {(String|Integer|Object)} Control - A control's ClassNN,  
 * Text, HWND (handle), or an object with an HWND. See {@link https://www.autohotkey.com/docs/v2/lib/Control.htm#Parameter|`Control Parameter`}.
 * @param {(String|Integer|Object)} [WinTitle] - A string using a {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`} to match a window.  
 * Types: {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_exe|`ahk_exe`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_class|`ahk_class`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_id|`ahk_id`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_pid|`ahk_pid`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_group|`ahk_group`}  
 * If the string is the letter `A`, the current active window is used.  
 * If all `Win` params are omited, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#LastFoundWindow|`Last Found Window`} is used.  
 * @param {(String)} [WinText] - Text that must be found in the window.  
 * Use WindowSpy to view window text.  
 * @param {(String)} [NoWinTitle] - Window title does not contain this text.  
 * @param {(String)} [NoWinText] - Text that must not appear in the window.
 * Use WindowSpy to view window text.
 * @returns {(Integer)} The index of the found item.  
 * If no match is found, an exception is thrown.  
 * @throws {(TargetError)} - Window or control could not be found  
 * Or control's class does not contain `Combo` or `List` 
 * @throws {(Error)} - Item could not be found.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/ControlAddItem.htm|`ControlAddItem()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/ControlDeleteItem.htm|`ControlDeleteItem()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Control.htm|`Control functions`},
 * {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SetTitleMatchMode.htm|`SetTitleMatchMode()`}
 * @example <caption>  
 * </caption>
 */
ControlFindItem(Str, Control [, WinTitle:='', WinText:='', NoWinTitle:='', NoWinText:='']) => Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/ControlFocus.htm|`ControlFocus()`} sets input focus to a given control on a window.  
 * @param {(String|Integer|Object)} Control - A control's ClassNN,  
 * Text, HWND (handle), or an object with an HWND. See {@link https://www.autohotkey.com/docs/v2/lib/Control.htm#Parameter|`Control Parameter`}.
 * @param {(String|Integer|Object)} [WinTitle] - A string using a {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`} to match a window.  
 * Types: {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_exe|`ahk_exe`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_class|`ahk_class`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_id|`ahk_id`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_pid|`ahk_pid`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_group|`ahk_group`}  
 * If the string is the letter `A`, the current active window is used.  
 * If all `Win` params are omited, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#LastFoundWindow|`Last Found Window`} is used.  
 * @param {(String)} [WinText] - Text that must be found in the window.  
 * Use WindowSpy to view window text.  
 * @param {(String)} [NoWinTitle] - Window title does not contain this text.  
 * @param {(String)} [NoWinText] - Text that must not appear in the window.
 * Use WindowSpy to view window text.
 * @returns {(Integer)} The index of the found item.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/SetControlDelay.htm|`SetControlDelay()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/ControlGetFocus.htm|`ControlGetFocus()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Control.htm|`Control functions`},
 * {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SetTitleMatchMode.htm|`SetTitleMatchMode()`}
 * @throws {(TargetError)} - Window or control could not be found  
 * @example <caption>  
 * </caption>
 */
ControlFocus(Control [, WinTitle:='', WinText:='', NoWinTitle:='', NoWinText:='']) => Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/ControlGetChecked.htm|`ControlGetChecked()`} returns a non-zero value if the checkbox or radio button is checked.  
 * @param {(String|Integer|Object)} Control - A control's ClassNN,  
 * Text, HWND (handle), or an object with an HWND. See {@link https://www.autohotkey.com/docs/v2/lib/Control.htm#Parameter|`Control Parameter`}.
 * @param {(String|Integer|Object)} [WinTitle] - A string using a {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`} to match a window.  
 * Types: {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_exe|`ahk_exe`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_class|`ahk_class`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_id|`ahk_id`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_pid|`ahk_pid`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_group|`ahk_group`}  
 * If the string is the letter `A`, the current active window is used.  
 * If all `Win` params are omited, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#LastFoundWindow|`Last Found Window`} is used.  
 * @param {(String)} [WinText] - Text that must be found in the window.  
 * Use WindowSpy to view window text.  
 * @param {(String)} [NoWinTitle] - Window title does not contain this text.  
 * @param {(String)} [NoWinText] - Text that must not appear in the window.
 * Use WindowSpy to view window text.
 * @returns {(Boolean)} `1` if checkbox/radio is checked, else `0`  
 * @throws {(TargetError)} - Window or control could not be found  
 * @throws {(OSError)} - Message could not be sent to the control  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/ControlSetChecked.htm|`ControlSetChecked()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Value|`GuiControl.Value`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Control.htm|`Control functions`},
 * {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SetTitleMatchMode.htm|`SetTitleMatchMode()`}
 * @example <caption>  
 * </caption>
 */
ControlGetChecked(Control [, WinTitle:='', WinText:='', NoWinTitle:='', NoWinText:='']) => Integer

/**
 * {@link |`ControlGetChoice()`} returns the name of the currently selected entry in a ListBox or ComboBox.  
 * @param {(String|Integer|Object)} Control - A control's ClassNN,  
 * Text, HWND (handle), or an object with an HWND. See {@link https://www.autohotkey.com/docs/v2/lib/Control.htm#Parameter|`Control Parameter`}.
 * @param {(String|Integer|Object)} [WinTitle] - A string using a {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`} to match a window.  
 * Types: {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_exe|`ahk_exe`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_class|`ahk_class`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_id|`ahk_id`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_pid|`ahk_pid`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_group|`ahk_group`}  
 * If the string is the letter `A`, the current active window is used.  
 * If all `Win` params are omited, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#LastFoundWindow|`Last Found Window`} is used.  
 * @param {(String)} [WinText] - Text that must be found in the window.  
 * Use WindowSpy to view window text.  
 * @param {(String)} [NoWinTitle] - Window title does not contain this text.  
 * @param {(String)} [NoWinText] - Text that must not appear in the window.
 * Use WindowSpy to view window text.
 * @returns {(String)} The name of the selected entry in a ListBox or ComboBox  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/ControlChooseIndex.htm|`ControlChooseIndex()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/ControlChooseString.htm|`ControlChooseString()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Choose|`GuiControl.Choose()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Value|`GuiControl.Value`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Control.htm|`Control functions`},
 * {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SetTitleMatchMode.htm|`SetTitleMatchMode()`}
 * @example <caption>  
 * </caption>
 */
ControlGetChoice(Control [, WinTitle:='', WinText:='', NoWinTitle:='', NoWinText:='']) => String

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/ControlGetClassNN.htm|`ControlGetClassNN()`} returns the ClassNN of the specified control.  
 * This is the name of the control class followed by its sequence number.  
 * @param {(String|Integer|Object)} Control - A control's ClassNN,  
 * Text, HWND (handle), or an object with an HWND. See {@link https://www.autohotkey.com/docs/v2/lib/Control.htm#Parameter|`Control Parameter`}.
 * @param {(String|Integer|Object)} [WinTitle] - A string using a {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`} to match a window.  
 * Types: {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_exe|`ahk_exe`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_class|`ahk_class`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_id|`ahk_id`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_pid|`ahk_pid`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_group|`ahk_group`}  
 * If the string is the letter `A`, the current active window is used.  
 * If all `Win` params are omited, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#LastFoundWindow|`Last Found Window`} is used.  
 * @param {(String)} [WinText] - Text that must be found in the window.  
 * Use WindowSpy to view window text.  
 * @param {(String)} [NoWinTitle] - Window title does not contain this text.  
 * @param {(String)} [NoWinText] - Text that must not appear in the window.
 * Use WindowSpy to view window text.
 * @returns {(String)} The ClassNN of the control  
 * @throws {(TargetError)} - A problem determining the target window or control
 * @throws {(Error|OSError)} - ClassNN could not be determined
 * @see {@link https://www.autohotkey.com/docs/v2/lib/WinGetClass.htm|`WinGetClass()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/WinGetControls.htm|`WinGetControls()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/MouseGetPos.htm|`MouseGetPos()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#ClassNN|`GuiControl.ClassNN`},  
 * {@link https://www.autohotkey.com/docs/v2/lib/Control.htm|`Control functions`},
 * {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SetTitleMatchMode.htm|`SetTitleMatchMode()`}
 * @example <caption>  
 * </caption>
 */
ControlGetClassNN(Control [, WinTitle:='', WinText:='', NoWinTitle:='', NoWinText:='']) => String

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/ControlGetEnabled.htm|`ControlGetEnabled()`} returns a non-zero value if the specified control is enabled.  
 * @param {(String|Integer|Object)} Control - A control's ClassNN,  
 * Text, HWND (handle), or an object with an HWND. See {@link https://www.autohotkey.com/docs/v2/lib/Control.htm#Parameter|`Control Parameter`}.
 * @param {(String|Integer|Object)} [WinTitle] - A string using a {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`} to match a window.  
 * Types: {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_exe|`ahk_exe`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_class|`ahk_class`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_id|`ahk_id`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_pid|`ahk_pid`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_group|`ahk_group`}  
 * If the string is the letter `A`, the current active window is used.  
 * If all `Win` params are omited, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#LastFoundWindow|`Last Found Window`} is used.  
 * @param {(String)} [WinText] - Text that must be found in the window.  
 * Use WindowSpy to view window text.  
 * @param {(String)} [NoWinTitle] - Window title does not contain this text.  
 * @param {(String)} [NoWinText] - Text that must not appear in the window.
 * Use WindowSpy to view window text.
 * @returns {(Boolean)} `1` if control is enabled, otherwise `0`  
 * @throws {(TargetError)} - The window or control could not be found  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/ControlSetEnabled.htm|`ControlSetEnabled()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/WinSetEnabled.htm|`WinSetEnabled()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Enabled|`GuiControl.Enabled`},  
 * {@link https://www.autohotkey.com/docs/v2/lib/Control.htm|`Control functions`},
 * {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SetTitleMatchMode.htm|`SetTitleMatchMode()`}
 * @example <caption>  
 * </caption>
 */
ControlGetEnabled(Control [, WinTitle:='', WinText:='', NoWinTitle:='', NoWinText:='']) => Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/ControlGetFocus.htm|`ControlGetFocus()`} retrieves the focused control of the target window, if any.  
 * @param {(String|Integer|Object)} [WinTitle] - A string using a {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`} to match a window.  
 * Types: {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_exe|`ahk_exe`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_class|`ahk_class`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_id|`ahk_id`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_pid|`ahk_pid`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_group|`ahk_group`}  
 * If the string is the letter `A`, the current active window is used.  
 * If all `Win` params are omited, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#LastFoundWindow|`Last Found Window`} is used.  
 * @param {(String)} [WinText] - Text that must be found in the window.  
 * Use WindowSpy to view window text.  
 * @param {(String)} [NoWinTitle] - Window title does not contain this text.  
 * @param {(String)} [NoWinText] - Text that must not appear in the window.
 * Use WindowSpy to view window text.
 * @returns {(Integer)} The {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_id|`handle (HWND)`} of the focused control.  
 * `0` if none of the controls have focus.  
 * @throws {(TargetError)} - Problem determining the target window or control  
 * @throws {(OSError)} - Problem determining the control focus
 * @see {@link https://www.autohotkey.com/docs/v2/lib/ControlFocus.htm|`ControlFocus`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Control.htm|`Control functions`},
 * {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SetTitleMatchMode.htm|`SetTitleMatchMode()`}
 * @example <caption>  
 * </caption>
 */
ControlGetFocus([WinTitle:='', WinText:='', NoWinTitle:='', NoWinText:='']) => Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/ControlGetHwnd.htm|`ControlGetHwnd()`} returns the unique ID number (handle) of the specified control.  
 * @param {(String|Integer|Object)} Control - A control's ClassNN,  
 * Text, HWND (handle), or an object with an HWND. See {@link https://www.autohotkey.com/docs/v2/lib/Control.htm#Parameter|`Control Parameter`}.
 * @param {(String|Integer|Object)} [WinTitle] - A string using a {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`} to match a window.  
 * Types: {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_exe|`ahk_exe`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_class|`ahk_class`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_id|`ahk_id`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_pid|`ahk_pid`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_group|`ahk_group`}  
 * If the string is the letter `A`, the current active window is used.  
 * If all `Win` params are omited, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#LastFoundWindow|`Last Found Window`} is used.  
 * @param {(String)} [WinText] - Text that must be found in the window.  
 * Use WindowSpy to view window text.  
 * @param {(String)} [NoWinTitle] - Window title does not contain this text.  
 * @param {(String)} [NoWinText] - Text that must not appear in the window.
 * Use WindowSpy to view window text.
 * @returns {(Integer)} The {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_id|`handle (HWND)`} of the specified control.  
 * @throws {(TargetError)} - The target window or control could not be found  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/WinGetID.htm|`WinGetID()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Hwnd|`GuiControl.Hwnd`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Control.htm|`Control functions`},
 * {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SetTitleMatchMode.htm|`SetTitleMatchMode()`}
 * @example <caption>  
 * </caption>
 */
ControlGetHwnd(Control [, WinTitle:='', WinText:='', NoWinTitle:='', NoWinText:='']) => Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/ControlGetIndex.htm|`ControlGetIndex()`} returns the index of the current selected entry/tab  
 * of a ListBox, ComboBox or Tab control.  
 * @param {(String|Integer|Object)} Control - A control's ClassNN,  
 * Text, HWND (handle), or an object with an HWND. See {@link https://www.autohotkey.com/docs/v2/lib/Control.htm#Parameter|`Control Parameter`}.
 * @param {(String|Integer|Object)} [WinTitle] - A string using a {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`} to match a window.  
 * Types: {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_exe|`ahk_exe`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_class|`ahk_class`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_id|`ahk_id`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_pid|`ahk_pid`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_group|`ahk_group`}  
 * If the string is the letter `A`, the current active window is used.  
 * If all `Win` params are omited, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#LastFoundWindow|`Last Found Window`} is used.  
 * @param {(String)} [WinText] - Text that must be found in the window.  
 * Use WindowSpy to view window text.  
 * @param {(String)} [NoWinTitle] - Window title does not contain this text.  
 * @param {(String)} [NoWinText] - Text that must not appear in the window.
 * Use WindowSpy to view window text.
 * @returns {(Integer)} The index of the tab or the ListBox/ComboBox selected entry.  
 * `0` if no tab/entry is selected.  
 * @throws {(TargetError)} - The window or control could not be found  
 * Or the control's class name does not contain "Combo", "List" or "Tab"
 * @throws {(OSError)} - Message could not be sent to the control  
 * @see 
 * {@link https://www.autohotkey.com/docs/v2/lib/ControlChooseIndex.htm|`ControlChooseIndex()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/ControlGetChoice.htm|`ControlGetChoice()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/ControlChooseString.htm|`ControlChooseString()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Value|`GuiControl.Value`},  
 * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Choose|`GuiControl.Choose()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Control.htm|`Control functions`},
 * {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SetTitleMatchMode.htm|`SetTitleMatchMode()`}
 * @example <caption>  
 * </caption>
 */
ControlGetIndex(Control [, WinTitle:='', WinText:='', NoWinTitle:='', NoWinText:='']) => Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/ControlGetItems.htm|`ControlGetItems()`} returns an array of items/rows from a  
 * ListBox, ComboBox, or DropDownList.  
 * @param {(String|Integer|Object)} Control - A control's ClassNN,  
 * Text, HWND (handle), or an object with an HWND. See {@link https://www.autohotkey.com/docs/v2/lib/Control.htm#Parameter|`Control Parameter`}.
 * @param {(String|Integer|Object)} [WinTitle] - A string using a {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`} to match a window.  
 * Types: {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_exe|`ahk_exe`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_class|`ahk_class`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_id|`ahk_id`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_pid|`ahk_pid`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_group|`ahk_group`}  
 * If the string is the letter `A`, the current active window is used.  
 * If all `Win` params are omited, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#LastFoundWindow|`Last Found Window`} is used.  
 * @param {(String)} [WinText] - Text that must be found in the window.  
 * Use WindowSpy to view window text.  
 * @param {(String)} [NoWinTitle] - Window title does not contain this text.  
 * @param {(String)} [NoWinText] - Text that must not appear in the window.
 * Use WindowSpy to view window text.
 * @returns {(Array)} An array containing the text of each item or row.  
 * @throws {(TargetError)} - The window or control could not be found  
 * Or the control's class name does not contain "Combo" or "List"  
 * @see 
 * {@link https://www.autohotkey.com/docs/v2/lib/ListViewGetContent.htm|`ListViewGetContent()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/WinGetList.htm|`WinGetList()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Control.htm|`Control functions`},  
 * {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SetTitleMatchMode.htm|`SetTitleMatchMode()`}
 * @example <caption>  
 * </caption>
 */
ControlGetItems(Control [, WinTitle:='', WinText:='', NoWinTitle:='', NoWinText:='']) => Array

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/ControlGetPos.htm|`ControlGetPos()`} retrieves the position and size of a control.  
 * @param {(VarRef)} [OutX] - The x coordinate of the control's upper left corner.  
 * Coordinates are relative to the {@link https://www.autohotkey.com/docs/v2/lib/CoordMode.htm#Client|`client area`}.  
 * @param {(VarRef)} [OutY] - The y coordinate of the control's upper left corner.  
 * Coordinates are relative to the {@link https://www.autohotkey.com/docs/v2/lib/CoordMode.htm#Client|`client area`}.  
 * @param {(VarRef)} [OutWidth] - Width of the control in pixels.  
 * @param {(VarRef)} [OutHeight] - Height of the control in pixels.  
 * @param {(String|Integer|Object)} [Control] - A control's ClassNN,  
 * Text, HWND (handle), or an object with an HWND. See {@link https://www.autohotkey.com/docs/v2/lib/Control.htm#Parameter|`Control Parameter`}.  
 * If omitted, the main window is targeted.  
 * @param {(String|Integer|Object)} [WinTitle] - A string using a {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`} to match a window.  
 * Types: {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_exe|`ahk_exe`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_class|`ahk_class`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_id|`ahk_id`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_pid|`ahk_pid`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_group|`ahk_group`}  
 * If the string is the letter `A`, the current active window is used.  
 * If all `Win` params are omited, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#LastFoundWindow|`Last Found Window`} is used.  
 * @param {(String)} [WinText] - Text that must be found in the window.  
 * Use WindowSpy to view window text.  
 * @param {(String)} [NoWinTitle] - Window title does not contain this text.  
 * @param {(String)} [NoWinText] - Text that must not appear in the window.
 * Use WindowSpy to view window text.
 * @returns {(String)} An empty string is always returned.  
 * @throws {(TargetError)} - The window or control could not be found.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/ControlMove.htm|`ControlMove()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/WinGetPos.htm|`WinGetPos()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Control.htm|`Control functions`},
 * {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SetTitleMatchMode.htm|`SetTitleMatchMode()`}
 * @example <caption>  
 * </caption>
 */
ControlGetPos([&OutX, &OutY, &OutWidth, &OutHeight, Control:=unset, WinTitle:='', WinText:='', NoWinTitle:='', NoWinText:='']) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/ControlGetStyle.htm|`ControlGetStyle()`} gets a conrol's style number.  
 * @param {(String|Integer|Object)} Control - A control's ClassNN,  
 * Text, HWND (handle), or an object with an HWND. See {@link https://www.autohotkey.com/docs/v2/lib/Control.htm#Parameter|`Control Parameter`}.
 * @param {(String|Integer|Object)} [WinTitle] - A string using a {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`} to match a window.  
 * Types: {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_exe|`ahk_exe`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_class|`ahk_class`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_id|`ahk_id`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_pid|`ahk_pid`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_group|`ahk_group`}  
 * If the string is the letter `A`, the current active window is used.  
 * If all `Win` params are omited, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#LastFoundWindow|`Last Found Window`} is used.  
 * @param {(String)} [WinText] - Text that must be found in the window.  
 * Use WindowSpy to view window text.  
 * @param {(String)} [NoWinTitle] - Window title does not contain this text.  
 * @param {(String)} [NoWinText] - Text that must not appear in the window.
 * Use WindowSpy to view window text.
 * @returns {{Integer}} The controls' style number.
 * @throws {(TargetError)} - Window or control could not be found
 * @see {@link https://www.autohotkey.com/docs/v2/lib/ControlSetStyle.htm|`ControlSetStyle()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/WinGetStyle.htm|`WinGetStyle()`},
 * {@link https://www.autohotkey.com/docs/v2/misc/Styles.htm|`Styles Table`},  
 * {@link https://www.autohotkey.com/docs/v2/lib/Control.htm|`Control functions`},
 * {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SetTitleMatchMode.htm|`SetTitleMatchMode()`}
 * @example <caption>  
 * </caption>
 */
ControlGetStyle(Control [, WinTitle:='', WinText:='', NoWinTitle:='', NoWinText:='']) => Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/ControlGetStyle.htm|`ControlGetExStyle()`} gets a conrol's extended style number.  
 * @param {(String|Integer|Object)} Control - A control's ClassNN,  
 * Text, HWND (handle), or an object with an HWND. See {@link https://www.autohotkey.com/docs/v2/lib/Control.htm#Parameter|`Control Parameter`}.
 * @param {(String|Integer|Object)} [WinTitle] - A string using a {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`} to match a window.  
 * Types: {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_exe|`ahk_exe`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_class|`ahk_class`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_id|`ahk_id`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_pid|`ahk_pid`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_group|`ahk_group`}  
 * If the string is the letter `A`, the current active window is used.  
 * If all `Win` params are omited, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#LastFoundWindow|`Last Found Window`} is used.  
 * @param {(String)} [WinText] - Text that must be found in the window.  
 * Use WindowSpy to view window text.  
 * @param {(String)} [NoWinTitle] - Window title does not contain this text.  
 * @param {(String)} [NoWinText] - Text that must not appear in the window.
 * Use WindowSpy to view window text.
 * @returns {{Integer}} The controls' style number.
 * @throws {(TargetError)} - Window or control could not be found
 * @see {@link https://www.autohotkey.com/docs/v2/lib/ControlSetStyle.htm|`ControlSetExStyle()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/WinGetStyle.htm|`WinGetExStyle()`},
 * {@link https://www.autohotkey.com/docs/v2/misc/Styles.htm|`Styles Table`},  
 * {@link https://www.autohotkey.com/docs/v2/lib/Control.htm|`Control functions`},
 * {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SetTitleMatchMode.htm|`SetTitleMatchMode()`}
 * @example <caption>  
 * </caption>
 */
ControlGetExStyle(Control [, WinTitle:='', WinText:='', NoWinTitle:='', NoWinText:='']) => Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/ControlGetText.htm|`ControlGetText()`} retrieves text from a control.  
 * @param {(String|Integer|Object)} Control - A control's ClassNN,  
 * Text, HWND (handle), or an object with an HWND. See {@link https://www.autohotkey.com/docs/v2/lib/Control.htm#Parameter|`Control Parameter`}.
 * @param {(String|Integer|Object)} [WinTitle] - A string using a {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`} to match a window.  
 * Types: {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_exe|`ahk_exe`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_class|`ahk_class`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_id|`ahk_id`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_pid|`ahk_pid`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_group|`ahk_group`}  
 * If the string is the letter `A`, the current active window is used.  
 * If all `Win` params are omited, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#LastFoundWindow|`Last Found Window`} is used.  
 * @param {(String)} [WinText] - Text that must be found in the window.  
 * Use WindowSpy to view window text.  
 * @param {(String)} [NoWinTitle] - Window title does not contain this text.  
 * @param {(String)} [NoWinText] - Text that must not appear in the window.
 * Use WindowSpy to view window text.
 * @returns {(String)} The text from the specified control.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/ControlSetText.htm|`ControlSetText()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/WinGetText.htm|`WinGetText()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Control.htm|`Control functions`},
 * {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SetTitleMatchMode.htm|`SetTitleMatchMode()`}
 * @example <caption>  
 * </caption>
 */
ControlGetText(Control [, WinTitle:='', WinText:='', NoWinTitle:='', NoWinText:='']) => String

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/ControlGetVisible.htm|`ControlGetVisible()`} returns a non-zero value if the specified control is visible.  
 * @param {(String|Integer|Object)} Control - A control's ClassNN,  
 * Text, HWND (handle), or an object with an HWND. See {@link https://www.autohotkey.com/docs/v2/lib/Control.htm#Parameter|`Control Parameter`}.
 * @param {(String|Integer|Object)} [WinTitle] - A string using a {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`} to match a window.  
 * Types: {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_exe|`ahk_exe`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_class|`ahk_class`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_id|`ahk_id`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_pid|`ahk_pid`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_group|`ahk_group`}  
 * If the string is the letter `A`, the current active window is used.  
 * If all `Win` params are omited, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#LastFoundWindow|`Last Found Window`} is used.  
 * @param {(String)} [WinText] - Text that must be found in the window.  
 * Use WindowSpy to view window text.  
 * @param {(String)} [NoWinTitle] - Window title does not contain this text.  
 * @param {(String)} [NoWinText] - Text that must not appear in the window.
 * Use WindowSpy to view window text.
 * @returns {{Boolean}} `1` if control is visible, otherwise `0`
 * @throws {(TargetError)} - The window or control could not be found  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/ControlHide.htm|`ControlHide()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/ControlShow.htm|`ControlShow()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiControl.Visible`},  
 * {@link https://www.autohotkey.com/docs/v2/lib/Control.htm|`Control functions`},
 * {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SetTitleMatchMode.htm|`SetTitleMatchMode()`}
 * @example <caption>  
 * </caption>
 */
ControlGetVisible(Control [, WinTitle:='', WinText:='', NoWinTitle:='', NoWinText:='']) => Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/ControlHide.htm|`ControlHide()`} hides the specified control.  
 * @param {(String|Integer|Object)} Control - A control's ClassNN,  
 * Text, HWND (handle), or an object with an HWND. See {@link https://www.autohotkey.com/docs/v2/lib/Control.htm#Parameter|`Control Parameter`}.
 * @param {(String|Integer|Object)} [WinTitle] - A string using a {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`} to match a window.  
 * Types: {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_exe|`ahk_exe`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_class|`ahk_class`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_id|`ahk_id`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_pid|`ahk_pid`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_group|`ahk_group`}  
 * If the string is the letter `A`, the current active window is used.  
 * If all `Win` params are omited, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#LastFoundWindow|`Last Found Window`} is used.  
 * @param {(String)} [WinText] - Text that must be found in the window.  
 * Use WindowSpy to view window text.  
 * @param {(String)} [NoWinTitle] - Window title does not contain this text.  
 * @param {(String)} [NoWinText] - Text that must not appear in the window.
 * Use WindowSpy to view window text.
 * @returns {(String)} An empty string is always returned.  
 * @throws {(TargetError)} - The window or control could not be found  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/ControlShow.htm|`ControlShow()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/ControlGetVisible.htm|`ControlGetVisible()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/WinHide.htm|`WinHide()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiControl.Visible`},  
 * {@link https://www.autohotkey.com/docs/v2/lib/Control.htm|`Control functions`},
 * {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SetTitleMatchMode.htm|`SetTitleMatchMode()`}
 * @example <caption>  
 * </caption>
 */
ControlHide(Control [, WinTitle:='', WinText:='', NoWinTitle:='', NoWinText:='']) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/ControlHideDropDown.htm|`ControlHideDropDown()`} hides the drop-down list of a ComboBox control.  
 * @param {(String|Integer|Object)} Control - A control's ClassNN,  
 * Text, HWND (handle), or an object with an HWND. See {@link https://www.autohotkey.com/docs/v2/lib/Control.htm#Parameter|`Control Parameter`}.
 * @param {(String|Integer|Object)} [WinTitle] - A string using a {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`} to match a window.  
 * Types: {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_exe|`ahk_exe`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_class|`ahk_class`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_id|`ahk_id`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_pid|`ahk_pid`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_group|`ahk_group`}  
 * If the string is the letter `A`, the current active window is used.  
 * If all `Win` params are omited, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#LastFoundWindow|`Last Found Window`} is used.  
 * @param {(String)} [WinText] - Text that must be found in the window.  
 * Use WindowSpy to view window text.  
 * @param {(String)} [NoWinTitle] - Window title does not contain this text.  
 * @param {(String)} [NoWinText] - Text that must not appear in the window.
 * Use WindowSpy to view window text.
 * @returns {(String)} An empty string is always returned.  
 * @throws {(TargetError)} - The window or control could not be found  
 * @throws {(OSError)} - Message could not be sent to the control
 * @see {@link https://www.autohotkey.com/docs/v2/lib/ControlShowDropDown.htm|`ControlShowDropDown()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Control.htm|`Control functions`},
 * {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SetTitleMatchMode.htm|`SetTitleMatchMode()`}
 * @example <caption>  
 * </caption>
 */
ControlHideDropDown(Control [, WinTitle:='', WinText:='', NoWinTitle:='', NoWinText:='']) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/ControlMove.htm|`ControlMove()`} moves or resizes a control.  
 * @param {(Integer)} [X] - The new x coordinate of the control's upper left corner.  
 * Coordinates are relative to the {@link https://www.autohotkey.com/docs/v2/lib/CoordMode.htm#Client|`client area`}.  
 * @param {(Integer)} [Y] - The new y coordinate of the control's upper left corner.  
 * Coordinates are relative to the {@link https://www.autohotkey.com/docs/v2/lib/CoordMode.htm#Client|`client area`}.  
 * @param {(Integer)} [Width] - The new width of the control.  
 * @param {(Integer)} [Height] - The new height of the control.  
 * @param {(String|Integer|Object)} Control - A control's ClassNN,  
 * Text, HWND (handle), or an object with an HWND. See {@link https://www.autohotkey.com/docs/v2/lib/Control.htm#Parameter|`Control Parameter`}.
 * @param {(String|Integer|Object)} [WinTitle] - A string using a {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`} to match a window.  
 * Types: {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_exe|`ahk_exe`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_class|`ahk_class`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_id|`ahk_id`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_pid|`ahk_pid`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_group|`ahk_group`}  
 * If the string is the letter `A`, the current active window is used.  
 * If all `Win` params are omited, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#LastFoundWindow|`Last Found Window`} is used.  
 * @param {(String)} [WinText] - Text that must be found in the window.  
 * Use WindowSpy to view window text.  
 * @param {(String)} [NoWinTitle] - Window title does not contain this text.  
 * @param {(String)} [NoWinText] - Text that must not appear in the window.
 * Use WindowSpy to view window text.
 * @returns {(String)} An empty string is always returned.  
 * @throws {(TargetError)} - Window or control could not be found  
 * @throws {(OSError)} - Control's current position could not be determined  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/ControlGetPos.htm|`ControlGetPos()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/WinMove.htm|`WinMove()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SetControlDelay.htm|`SetControlDelay()`},  
 * {@link https://www.autohotkey.com/docs/v2/lib/Control.htm|`Control functions`},
 * {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SetTitleMatchMode.htm|`SetTitleMatchMode()`}
 * @example <caption>  
 * </caption>
 */
ControlMove([X, Y, Width, Height, Control, WinTitle:='', WinText:='', NoWinTitle:='', NoWinText:='']) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/ControlSend.htm|`ControlSend()`} sends simulated keystrokes to a window or control.  
 * @param {(String)} Keys - The keystrokes to send to the specified control.  
 * {@link https://www.autohotkey.com/docs/v2/lib/Send.htm|`Send`} syntax is used, including {@link https://www.autohotkey.com/docs/v2/lib/Send.htm#Raw|`Raw`}, {@link https://www.autohotkey.com/docs/v2/lib/Send.htm#Text|`Text`}, and {@link https://www.autohotkey.com/docs/v2/lib/Send.htm#Blind|`Blind`} modes.
 * @param {(String|Integer|Object)} [Control] - A control's ClassNN,  
 * Text, HWND (handle), or an object with an HWND. See {@link https://www.autohotkey.com/docs/v2/lib/Control.htm#Parameter|`Control Parameter`}.  
 * If omitted, the main window is targeted.  
 * @param {(String|Integer|Object)} [WinTitle] - A string using a {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`} to match a window.  
 * Types: {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_exe|`ahk_exe`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_class|`ahk_class`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_id|`ahk_id`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_pid|`ahk_pid`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_group|`ahk_group`}  
 * If the string is the letter `A`, the current active window is used.  
 * If all `Win` params are omited, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#LastFoundWindow|`Last Found Window`} is used.  
 * @param {(String)} [WinText] - Text that must be found in the window.  
 * Use WindowSpy to view window text.  
 * @param {(String)} [NoWinTitle] - Window title does not contain this text.  
 * @param {(String)} [NoWinText] - Text that must not appear in the window.
 * Use WindowSpy to view window text.
 * @returns {(String)} An empty string is always returned.  
 * @throws {(TargetError)} - Window or control could not be found  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/SetKeyDelay.htm|`SetKeyDelay()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Send.htm|`Send()`},
 * {@link https://www.autohotkey.com/docs/v2/misc/Winamp.htm|`Automating Winamp`},
 * {@link https://www.autohotkey.com/docs/v2/misc/EscapeChar.htm|`Escape Sequences`},  
 * {@link https://www.autohotkey.com/docs/v2/lib/Control.htm|`Control functions`},
 * {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SetTitleMatchMode.htm|`SetTitleMatchMode()`}
 * @example <caption>  
 * </caption>
 */
ControlSend(Keys [, Control:=unset, WinTitle:='', WinText:='', NoWinTitle:='', NoWinText:='']) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/ControlSend.htm|`ControlSendText()`} sends simulated text to a window or control.  
 * Keystrokes are sent explicitly because [`{Text}` mode](https://www.autohotkey.com/docs/v2/lib/Send.htm#Text) is enforced.  
 * @param {(String)} Keys - The keystrokes to send to the specified control.  
 * {@link https://www.autohotkey.com/docs/v2/lib/Send.htm|`Send()`} syntax is not supported due to {Text} mode being enforced.  
 * @param {(String|Integer|Object)} [Control] - A control's ClassNN,  
 * Text, HWND (handle), or an object with an HWND. See {@link https://www.autohotkey.com/docs/v2/lib/Control.htm#Parameter|`Control Parameter`}.  
 * If omitted, the main window is targeted.  
 * @param {(String|Integer|Object)} [WinTitle] - A string using a {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`} to match a window.  
 * Types: {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_exe|`ahk_exe`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_class|`ahk_class`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_id|`ahk_id`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_pid|`ahk_pid`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_group|`ahk_group`}  
 * If the string is the letter `A`, the current active window is used.  
 * If all `Win` params are omited, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#LastFoundWindow|`Last Found Window`} is used.  
 * @param {(String)} [WinText] - Text that must be found in the window.  
 * Use WindowSpy to view window text.  
 * @param {(String)} [NoWinTitle] - Window title does not contain this text.  
 * @param {(String)} [NoWinText] - Text that must not appear in the window.
 * Use WindowSpy to view window text.
 * @returns {(String)} An empty string is always returned.  
 * @throws {(TargetError)} - Window or control could not be found  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/SetKeyDelay.htm|`SetKeyDelay()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Send.htm|`Send()`},
 * {@link https://www.autohotkey.com/docs/v2/misc/Winamp.htm|`Automating Winamp`},
 * {@link https://www.autohotkey.com/docs/v2/misc/EscapeChar.htm|`Escape Sequences`},  
 * {@link https://www.autohotkey.com/docs/v2/lib/Control.htm|`Control functions`},
 * {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SetTitleMatchMode.htm|`SetTitleMatchMode()`}
 * @example <caption>  
 * </caption>
 */
ControlSendText(Keys [, Control:=unset, WinTitle:='', WinText:='', NoWinTitle:='', NoWinText:='']) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/ControlSetChecked.htm|`ControlSetChecked()`} turns on/checks or  
 * turns off/unchecks a checkbox or radio button.  
 * @param {(Integer)} NewSetting - Sets new checkbox/radio state.  
 * - `1` = Turn on/check
 * - `0` = Turn off/uncheck
 * - `-1` = Toggle/opposite of current state
 * @param {(String|Integer|Object)} Control - A control's ClassNN,  
 * Text, HWND (handle), or an object with an HWND. See {@link https://www.autohotkey.com/docs/v2/lib/Control.htm#Parameter|`Control Parameter`}.
 * @param {(String|Integer|Object)} [WinTitle] - A string using a {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`} to match a window.  
 * Types: {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_exe|`ahk_exe`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_class|`ahk_class`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_id|`ahk_id`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_pid|`ahk_pid`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_group|`ahk_group`}  
 * If the string is the letter `A`, the current active window is used.  
 * If all `Win` params are omited, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#LastFoundWindow|`Last Found Window`} is used.  
 * @param {(String)} [WinText] - Text that must be found in the window.  
 * Use WindowSpy to view window text.  
 * @param {(String)} [NoWinTitle] - Window title does not contain this text.  
 * @param {(String)} [NoWinText] - Text that must not appear in the window.
 * Use WindowSpy to view window text.
 * @returns {(String)} An empty string is always returned.  
 * @throws {(TargetError)} - Window or control could not be found  
 * @throws {(OSError)} - A message could not be sent to the control
 * @see 
 * {@link https://www.autohotkey.com/docs/v2/lib/ControlGetChecked.htm|`ControlGetChecked()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Value|`GuiControl.Value`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Control.htm|`Control functions`},  
 * {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SetTitleMatchMode.htm|`SetTitleMatchMode()`}
 * @example <caption>  
 * </caption>
 */
ControlSetChecked(NewSetting, Control [, WinTitle:='', WinText:='', NoWinTitle:='', NoWinText:='']) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/ControlSetEnabled.htm|`ControlSetEnabled()`} enables or disables the specified control.  
 * @param {(Integer)} NewSetting - Sets new checkbox/radio state.  
 * - `1` = Turn on/enable
 * - `0` = Turn off/disable
 * - `-1` = Toggle/opposite of current state
 * @param {(String|Integer|Object)} Control - A control's ClassNN,  
 * Text, HWND (handle), or an object with an HWND. See {@link https://www.autohotkey.com/docs/v2/lib/Control.htm#Parameter|`Control Parameter`}.
 * @param {(String|Integer|Object)} [WinTitle] - A string using a {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`} to match a window.  
 * Types: {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_exe|`ahk_exe`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_class|`ahk_class`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_id|`ahk_id`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_pid|`ahk_pid`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_group|`ahk_group`}  
 * If the string is the letter `A`, the current active window is used.  
 * If all `Win` params are omited, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#LastFoundWindow|`Last Found Window`} is used.  
 * @param {(String)} [WinText] - Text that must be found in the window.  
 * Use WindowSpy to view window text.  
 * @param {(String)} [NoWinTitle] - Window title does not contain this text.  
 * @param {(String)} [NoWinText] - Text that must not appear in the window.
 * Use WindowSpy to view window text.
 * @returns {(String)} An empty string is always returned.  
 * @throws {(TargetError)} - Window or control could not be found  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/ControlGetEnabled.htm|`ControlGetEnabled()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/WinSetEnabled.htm|`WinSetEnabled()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Enabled|`GuiControl.Enabled`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Control.htm|`Control functions`},
 * {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SetTitleMatchMode.htm|`SetTitleMatchMode()`}
 * @example <caption>  
 * </caption>
 */
ControlSetEnabled(NewSetting, Control [, WinTitle:='', WinText:='', NoWinTitle:='', NoWinText:='']) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/ControlSetStyle.htm|`ControlSetStyle()`} changes the style of the specified control.  
 * @param {(Integer|String)} Value - Pass a positive integer to completely  
 * overwrite/set the window's style. {@link https://www.autohotkey.com/docs/v2/misc/Styles.htm|`Style Table`}.
 * - `+` Add: '+0x80' = `NewStyle := CurrentStyle | Value`
 * - `-` Remove: '-0x80' = `NewStyle := CurrentStyle & ~Value`
 * - `^` Toggle: '^0x80' = `NewStyle := CurrentStyle ^ Value`
 * @param {(String|Integer|Object)} Control - A control's ClassNN,  
 * Text, HWND (handle), or an object with an HWND. See {@link https://www.autohotkey.com/docs/v2/lib/Control.htm#Parameter|`Control Parameter`}.
 * @param {(String|Integer|Object)} [WinTitle] - A string using a {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`} to match a window.  
 * Types: {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_exe|`ahk_exe`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_class|`ahk_class`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_id|`ahk_id`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_pid|`ahk_pid`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_group|`ahk_group`}  
 * If the string is the letter `A`, the current active window is used.  
 * If all `Win` params are omited, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#LastFoundWindow|`Last Found Window`} is used.  
 * @param {(String)} [WinText] - Text that must be found in the window.  
 * Use WindowSpy to view window text.  
 * @param {(String)} [NoWinTitle] - Window title does not contain this text.  
 * @param {(String)} [NoWinText] - Text that must not appear in the window.
 * Use WindowSpy to view window text.
 * @returns {(String)} An empty string is always returned.  
 * @throws {(TargetError)} - Window or control could not be found  
 * @throws {(OSError)} - The style could not be changed  
 * Partial change is considered a success.
 * @see {@link https://www.autohotkey.com/docs/v2/lib/ControlGetStyle.htm|`ControlGetStyle()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/WinSetStyle.htm|`WinSetStyle()`},
 * {@link https://www.autohotkey.com/docs/v2/misc/Styles.htm|`Styles Table`},  
 * {@link https://www.autohotkey.com/docs/v2/lib/Control.htm|`Control functions`},
 * {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SetTitleMatchMode.htm|`SetTitleMatchMode()`}
 * @example <caption>  
 * </caption>
 */
ControlSetStyle(Value, Control [, WinTitle:='', WinText:='', NoWinTitle:='', NoWinText:='']) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/ControlSetStyle.htm|`ControlSetExStyle()`} changes the extended style of the specified control.  
 * @param {(Integer|String)} Value - Pass a positive integer to completely  
 * overwrite/set the window's style. {@link https://www.autohotkey.com/docs/v2/misc/Styles.htm|`Style Table`}.
 * - `+` Add: '+0x80' = `NewStyle := CurrentStyle | Value`
 * - `-` Remove: '-0x80' = `NewStyle := CurrentStyle & ~Value`
 * - `^` Toggle: '^0x80' = `NewStyle := CurrentStyle ^ Value`
 * @param {(String|Integer|Object)} Control - A control's ClassNN,  
 * Text, HWND (handle), or an object with an HWND. See {@link https://www.autohotkey.com/docs/v2/lib/Control.htm#Parameter|`Control Parameter`}.
 * @param {(String|Integer|Object)} [WinTitle] - A string using a {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`} to match a window.  
 * Types: {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_exe|`ahk_exe`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_class|`ahk_class`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_id|`ahk_id`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_pid|`ahk_pid`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_group|`ahk_group`}  
 * If the string is the letter `A`, the current active window is used.  
 * If all `Win` params are omited, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#LastFoundWindow|`Last Found Window`} is used.  
 * @param {(String)} [WinText] - Text that must be found in the window.  
 * Use WindowSpy to view window text.  
 * @param {(String)} [NoWinTitle] - Window title does not contain this text.  
 * @param {(String)} [NoWinText] - Text that must not appear in the window.
 * Use WindowSpy to view window text.
 * @returns {(String)} An empty string is always returned.  
 * @throws {(TargetError)} - Window or control could not be found  
 * @throws {(OSError)} - The style could not be changed  
 * Partial change is considered a success.
 * @see {@link https://www.autohotkey.com/docs/v2/lib/ControlGetStyle.htm|`ControlGetExStyle()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/WinSetStyle.htm|`WinSetExStyle()`},
 * {@link https://www.autohotkey.com/docs/v2/misc/Styles.htm|`Styles Table`},  
 * {@link https://www.autohotkey.com/docs/v2/lib/Control.htm|`Control functions`},
 * {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SetTitleMatchMode.htm|`SetTitleMatchMode()`}
 * @example <caption>  
 * </caption>
 */
ControlSetExStyle(Value, Control [, WinTitle:='', WinText:='', NoWinTitle:='', NoWinText:='']) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/ControlSetText.htm|`ControlSetText()`} changes the text of a control.  
 * @param {(String)} NewText - Text to assign to the control.  
 * A blank line can be used to clear the control.  
 * @param {(String|Integer|Object)} Control - A control's ClassNN,  
 * Text, HWND (handle), or an object with an HWND. See {@link https://www.autohotkey.com/docs/v2/lib/Control.htm#Parameter|`Control Parameter`}.
 * @param {(String|Integer|Object)} [WinTitle] - A string using a {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`} to match a window.  
 * Types: {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_exe|`ahk_exe`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_class|`ahk_class`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_id|`ahk_id`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_pid|`ahk_pid`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_group|`ahk_group`}  
 * If the string is the letter `A`, the current active window is used.  
 * If all `Win` params are omited, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#LastFoundWindow|`Last Found Window`} is used.  
 * @param {(String)} [WinText] - Text that must be found in the window.  
 * Use WindowSpy to view window text.  
 * @param {(String)} [NoWinTitle] - Window title does not contain this text.  
 * @param {(String)} [NoWinText] - Text that must not appear in the window.
 * Use WindowSpy to view window text.
 * @returns {(String)} An empty string is always returned.  
 * @throws {(TargetError)} - Window or control could not be found  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/SetControlDelay.htm|`SetControlDelay()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/ControlGetText.htm|`ControlGetText()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Control.htm|`Control functions`},
 * {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SetTitleMatchMode.htm|`SetTitleMatchMode()`}
 * @example <caption>  
 * </caption>
 */
ControlSetText(NewText, Control [, WinTitle:='', WinText:='', NoWinTitle:='', NoWinText:='']) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/ControlShow.htm|`ControlShow()`} shows the specified control if it was previously hidden.  
 * @param {(String|Integer|Object)} Control - A control's ClassNN,  
 * Text, HWND (handle), or an object with an HWND. See {@link https://www.autohotkey.com/docs/v2/lib/Control.htm#Parameter|`Control Parameter`}.
 * @param {(String|Integer|Object)} [WinTitle] - A string using a {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`} to match a window.  
 * Types: {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_exe|`ahk_exe`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_class|`ahk_class`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_id|`ahk_id`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_pid|`ahk_pid`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_group|`ahk_group`}  
 * If the string is the letter `A`, the current active window is used.  
 * If all `Win` params are omited, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#LastFoundWindow|`Last Found Window`} is used.  
 * @param {(String)} [WinText] - Text that must be found in the window.  
 * Use WindowSpy to view window text.  
 * @param {(String)} [NoWinTitle] - Window title does not contain this text.  
 * @param {(String)} [NoWinText] - Text that must not appear in the window.
 * Use WindowSpy to view window text.
 * @returns {(String)} An empty string is always returned.  
 * @throws {(TargetError)} - Window or control could not be found  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/ControlHide.htm|`ControlHide()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/ControlGetVisible.htm|`ControlGetVisible()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/WinShow.htm|`WinShow()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm#Visible|`GuiControl.Visible`},  
 * {@link https://www.autohotkey.com/docs/v2/lib/Control.htm|`Control functions`},
 * {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SetTitleMatchMode.htm|`SetTitleMatchMode()`}
 * @example <caption>  
 * </caption>
 */
ControlShow(Control [, WinTitle:='', WinText:='', NoWinTitle:='', NoWinText:='']) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/ControlShowDropDown.htm|`ControlShowDropDown()`} shows the drop-down list of a ComboBox control.  
 * @param {(String|Integer|Object)} Control - A control's ClassNN,  
 * Text, HWND (handle), or an object with an HWND. See {@link https://www.autohotkey.com/docs/v2/lib/Control.htm#Parameter|`Control Parameter`}.
 * @param {(String|Integer|Object)} [WinTitle] - A string using a {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`} to match a window.  
 * Types: {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_exe|`ahk_exe`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_class|`ahk_class`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_id|`ahk_id`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_pid|`ahk_pid`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_group|`ahk_group`}  
 * If the string is the letter `A`, the current active window is used.  
 * If all `Win` params are omited, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#LastFoundWindow|`Last Found Window`} is used.  
 * @param {(String)} [WinText] - Text that must be found in the window.  
 * Use WindowSpy to view window text.  
 * @param {(String)} [NoWinTitle] - Window title does not contain this text.  
 * @param {(String)} [NoWinText] - Text that must not appear in the window.
 * Use WindowSpy to view window text.
 * @returns {(String)} An empty string is always returned.  
 * @throws {(TargetError)} - Window or control could not be found  
 * @throws {(OSError)} - Message could not be sent to the control
 * @see {@link https://www.autohotkey.com/docs/v2/lib/ControlHideDropDown.htm|`ControlHideDropDown()`}
 * {@link https://www.autohotkey.com/docs/v2/lib/Control.htm|`Control functions`},
 * {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SetTitleMatchMode.htm|`SetTitleMatchMode()`}
 * @example <caption>  
 * </caption>
 */
ControlShowDropDown(Control [, WinTitle:='', WinText:='', NoWinTitle:='', NoWinText:='']) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/CoordMode.htm|`CoordMode()`} determines where x0/y0 starts for various  
 * built-in functions. Relative to Client, Window, or Screen.  
 * {@link https://i.imgur.com/bZXILwM.png|`Image showing each coordmode x0 y0 start point`}  
 * Orange is screen, blue is window, green is client area
 * @param {(String)} TargetType - Set group type:  
 * - `ToolTip` = Affects: {@link https://www.autohotkey.com/docs/v2/lib/ToolTip.htm|`ToolTip()`}
 * - `Pixel` = Affects: {@link https://www.autohotkey.com/docs/v2/lib/PixelGetColor.htm|`PixelGetColor()`}, {@link https://www.autohotkey.com/docs/v2/lib/PixelSearch.htm|`PixelSearch()`}, {@link https://www.autohotkey.com/docs/v2/lib/ImageSearch.htm|`ImageSearch()`}  
 * - `Mouse` = Affects: {@link https://www.autohotkey.com/docs/v2/lib/MouseGetPos.htm|`MouseGetPos()`}, {@link https://www.autohotkey.com/docs/v2/lib/Click.htm|`Click()`}, {@link https://www.autohotkey.com/docs/v2/lib/MouseMove.htm|`MouseMove()`}, {@link https://www.autohotkey.com/docs/v2/lib/MouseClick.htm|`MouseClick()`}, {@link https://www.autohotkey.com/docs/v2/lib/MouseClickDrag.htm|`MouseClickDrag()`}  
 * - `Caret` = Affects: {@link https://www.autohotkey.com/docs/v2/lib/CaretGetPos.htm|`CaretGetPos()`}  
 * - `Menu` = Affects: {@link https://www.autohotkey.com/docs/v2/lib/Menu.htm#Show|`Menu.Show()`}  
 * @param {(String)} [RelativeTo] - Set x0 y0 position:  
 * - `Client`: Upper left of main window area of the program.  
 *   This is usually the best choice.
 * - `Window`: Upper left corner of the Window.  
 *   Window is the area around the client, including the  
 *   title bar and border around the client.  
 * - `Screen`: Upper left corner of the primary monitor.  
 *   Rarely the best choice. Screen should be used  
 *   when working with the desktop or arranging windows.  
 * - Omitted: Defaults to `Screen`  
 * @returns {(String)} Previous setting is always returned  
 * Can be `Client`, `Window`, or `Screen`
 * @see {@link https://www.autohotkey.com/docs/v2/lib/Click.htm|`Click()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/MouseMove.htm|`MouseMove()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/MouseClick.htm|`MouseClick()`},  
 * {@link https://www.autohotkey.com/docs/v2/lib/MouseClickDrag.htm|`MouseClickDrag()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/MouseGetPos.htm|`MouseGetPos()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/ToolTip.htm|`ToolTip()`},  
 * {@link https://www.autohotkey.com/docs/v2/lib/PixelGetColor.htm|`PixelGetColor()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/PixelSearch.htm|`PixelSearch()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Menu.htm|`Menu.Show()`},
 * @example <caption>  
 * </caption>
 */
CoordMode(TargetType [, RelativeTo:='Screen']) => String

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/Math.htm#Cos|`Cos()`} returns the cosine in radians.  
 * @param {(Number)} Num - The number to get the cosine of.  
 * @returns {(Number)} Cosine in radians.  
 * @example <caption>  
 * </caption>
 */
Cos(Num) => Number

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/Critical.htm|`Critical()`} enables or disables {@link https://www.autohotkey.com/docs/v2/misc/Threads.htm|`current thread`}  
 * the ability to interrupt other threads.
 * @param {(String)} [Setting] - New critical setting:  
 * - `On` = Current thread is set to critical.  
 *   It cannot be interrupted by another thread.
 * - `Off` = Current thread immediately becomes interruptible.  
 *   This is regardless of the {@link https://www.autohotkey.com/docs/v2/lib/Thread.htm#Interrupt|`Thread Interrupt`} settings.  
 *   See {@link https://www.autohotkey.com/docs/v2/lib/Critical.htm#Off|`"Critical Off"`} for details.
 * - Positive Number = Enables Critical and uses the number as  
 *   milliseconds between {@link https://www.autohotkey.com/docs/v2/lib/Critical.htm#Interval|`Message Checks`}.  
 * - `0` = Turns off critical.  
 * - `-1` = Turns on critical but disables {@link https://www.autohotkey.com/docs/v2/lib/Critical.htm#Interval|`internal message checking`}.  
 *   Message checking still occurs during sleeps, delays, and waits.  
 * @returns {(Integer)} The previous setting is always returned.  
 * `0` for off, otherwise an integer greater than 0.
 * @see {@link https://www.autohotkey.com/docs/v2/misc/Threads.htm|`Threads`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Thread.htm|`Thread()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Hotkey.htm|`Hotkey()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Menu.htm|`Menu Object`},  
 * {@link https://www.autohotkey.com/docs/v2/lib/_MaxThreadsPerHotkey.htm|`#MaxThreadsPerHotkey`},
 * {@link https://www.autohotkey.com/docs/v2/lib/_MaxThreadsBuffer.htm|`#MaxThreadsBuffer`},  
 * {@link https://www.autohotkey.com/docs/v2/lib/OnMessage.htm|`OnMessage()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/CallbackCreate.htm|`CallbackCreate()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SetTimer.htm|`SetTimer()`}
 * @example <caption>  
 * </caption>
 */
Critical([Setting:='On']) => Integer


/**
 * {@link https://www.autohotkey.com/docs/v2/lib/DateAdd.htm|`DateAdd()`} adds or subtracts time from a date-time value.  
 * @param {(String)} DateTime - A date-time stamp in the {@link https://www.autohotkey.com/docs/v2/lib/FileSetTime.htm#YYYYMMDD|YYYYMMDDHH24MISS} format.
 * @param {(Number)} Time - Amount of time to add or subtract.  
 * @param {(String)} TimeUnits - The type of time unit used in the `Time` parameter.  
 * - `S` / `Seconds`  
 * - `M` / `Minutes`  
 * - `H` / `Hours`  
 * - `D` / `Days`  
 * @returns {(String)} The `DateTime` after alteration in {@link https://www.autohotkey.com/docs/v2/lib/FileSetTime.htm#YYYYMMDD|YYYYMMDDHH24MISS} format.  
 * @throws {(ValueError)} - `DateTime` is invalid or prior to 1601  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/DateDiff.htm|`DateDiff()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileGetTime.htm|`FileGetTime()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FormatTime.htm|`FormatTime()`}
 * @example <caption>  
 * </caption>
 */
DateAdd(DateTime, Time, TimeUnits) => String

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/DateDiff.htm|`DateDiff()`} compares two {@link https://www.autohotkey.com/docs/v2/lib/FileSetTime.htm#YYYYMMDD|date-time values} and returns the difference.  
 * Values are always rounded down to the nearest integer.  
 * For higher precision, use `Seconds` and divide by 60/3600/86400 for minutes/hours/days (respectively).  
 * @param {(String)} [DateTime1] - First {@link https://www.autohotkey.com/docs/v2/lib/FileSetTime.htm#YYYYMMDD|`date-time stamp`} to compare.  
 * If omitted, {@link https://www.autohotkey.com/docs/v2/Variables.htm#Now|`A_Now`} (current date-time) is used.  
 * @param {(String)} [DateTime2] - Second {@link https://www.autohotkey.com/docs/v2/lib/FileSetTime.htm#YYYYMMDD|`date-time stamp`} to compare.  
 * If omitted, {@link https://www.autohotkey.com/docs/v2/Variables.htm#Now|`A_Now`} (current date-time) is used.  
 * @param {(String)} TimeUnits - Unit of time to get the difference in.  
 * - `S` / `Seconds`  
 * - `M` / `Minutes`  
 * - `H` / `Hours`  
 * - `D` / `Days`  
 * @returns {(Integer)} Difference between the two timestamps in the units requested.  
 * The difference is negative if DateTime1 is earlier than DateTime2.  
 * @throws {(ValueError)} - If a date-time stamp is invalid or year is prior to 1601  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/DateAdd.htm|`DateAdd()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileGetTime.htm|`FileGetTime()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FormatTime.htm|`FormatTime()`}
 * @example <caption>  
 * </caption>
 */
DateDiff(DateTime1, DateTime2, TimeUnits) => Integer 

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/DetectHiddenText.htm|`DetectHiddenText()`} determines whether invisible text in a window is "seen" for the purpose of finding the window. This affects windowing functions such as WinExist and WinActivate.  
 * By default, this is on.  
 * @param {(Boolean)} NewSetting 
 * - `1` = Hidden text detected.  
 * - `0` = Hidden text ignored.  
 * @returns {(Boolean)} Previous setting, `0` or `1`  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/DetectHiddenWindows.htm|`DetectHiddenWindows()`}
 * @example <caption>  
 * </caption>
 */
DetectHiddenText(NewSetting) => Integer 

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/DetectHiddenWindows.htm|`DetectHiddenWindows()`} determines whether invisible windows are "seen" by the script.  
 * By default, this is off.  
 * @param {(Boolean)} NewSetting 
 * - `1` = Hidden windows are detected.  
 * - `0` = Hidden windows are ignored.  
 * @returns {(Boolean)} Previous setting, `0` or `1`  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/DetectHiddenText.htm|`DetectHiddenText()`}
 * @example <caption>  
 * </caption>
 */
DetectHiddenWindows(NewSetting) => Integer 

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/DirCopy.htm|`DirCopy()`} copies a folder along with all its sub-folders and files (similar to xcopy).  
 * @param {(String)} Source - Path to source directory.  
 * If a full path isn't used, Source is assumed to start in {@link https://www.autohotkey.com/docs/v2/Variables.htm#WorkingDir|`A_WorkingDir`}.  
 * @param {(String)} Dest - Path to destination directory.  
 * If a full path isn't used, Dest is assumed to start in {@link https://www.autohotkey.com/docs/v2/Variables.htm#WorkingDir|`A_WorkingDir`}.  
 * @param {(Integer)} [Overwrite] - Overwrite if destination already exists  
 * - `0` = Do not overwrite existing files.  
 * - `1` = Overwrite existing files.  
 * @returns {(String)} An empty string is always returned.  
 * @throws {(Error)} - An exception is thrown if any error occurs  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/DirMove.htm|`DirMove()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileCopy.htm|`FileCopy()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileMove.htm|`FileMove()`},  
 * {@link https://www.autohotkey.com/docs/v2/lib/FileDelete.htm|`FileDelete()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/LoopFiles.htm|`Loop-Files`},
 * {@link https://www.autohotkey.com/docs/v2/lib/DirSelect.htm|`DirSelect()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SplitPath.htm|`SplitPath()`}
 * @example <caption>  
 * </caption>
 */
DirCopy(Source, Dest [, Overwrite:=0]) => EmptyString 

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/DirCreate.htm|`DirCreate()`} creates a folder.  
 * @param {(String)} DirName - Path to directory.  
 * If a full path isn't used, DirName is assumed to start in {@link https://www.autohotkey.com/docs/v2/Variables.htm#WorkingDir|`A_WorkingDir`}.  
 * @returns {(String)} An empty string is always returned.  
 * @throws {(OSError)} - Any errors occur.  
 * {@link https://www.autohotkey.com/docs/v2/Variables.htm#LastError|`A_LastError`} is set to the result of the OS's GetLastError().  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/DirDelete.htm|`DirDelete()`}  
 * @example <caption>  
 * </caption>
 */
DirCreate(DirName) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/DirDelete.htm|`DirDelete()`} deletes a folder.  
 * @param {(String)} DirName - Path to directory.  
 * If a full path isn't used, DirName is assumed to start in {@link https://www.autohotkey.com/docs/v2/Variables.htm#WorkingDir|`A_WorkingDir`}.  
 * @param {(Boolean)} Recurse - Recursively remove sub-contents:  
 * - `1` = The directory, all files, and subdirectories are removed.  
 *   Similar to cmd's {@link https://www.computerhope.com/rmdirhlp.htm#syntax|`rmdir /S`}  
 * - `0` = If directory contains anything (files or sub-directories), directory is not deleted.  
 * @returns {(String)} An empty string is always returned.  
 * @throws {(OSError)} - Any errors occur.  
 * {@link https://www.autohotkey.com/docs/v2/Variables.htm#LastError|`A_LastError`} is set to the result of the OS's GetLastError().  
 * @see  {@link https://www.autohotkey.com/docs/v2/lib/DirCreate.htm|`DirCreate()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileDelete.htm|`FileDelete()`}
 * @example <caption>  
 * </caption>
 */
DirDelete(DirName [, Recurse:=0]) => String 

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/DirExist.htm|`DirExist()`} checks for the existence of a folder and returns its attributes.  
 * @param {(String)} FilePattern - Directory path or name to check.  
 * If a full path isn't used, FilePattern is assumed to start in {@link https://www.autohotkey.com/docs/v2/Variables.htm#WorkingDir|`A_WorkingDir`}.  
 * @returns {(String)} A string of all attributes found for the direcotry.  
 * - Empty String = The directory wasn't found
 * - `R` = ReadOnly
 * - `A` = Archive
 * - `S` = System
 * - `H` = Hidden
 * - `D` = Directory
 * - `O` = Offline
 * - `C` = Compressed
 * @see {@link https://www.autohotkey.com/docs/v2/lib/FileExist.htm|`FileExist()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileGetAttrib.htm|`FileGetAttrib()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/LoopFiles.htm|`Loop-Files`}
 * @example <caption>  
 * </caption>
 */
DirExist(FilePattern) => String 

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/DirMove.htm|`DirMove()`} moves a folder along with all its sub-folders and files.  
 * Can also be used to rename a folder.  
 * @param {(String)} Source - Path to source directory.  
 * If a full path isn't used, Source is assumed to start in {@link https://www.autohotkey.com/docs/v2/Variables.htm#WorkingDir|`A_WorkingDir`}.  
 * @param {(String)} Dest - Path to destination directory.  
 * If a full path isn't used, Dest is assumed to start in {@link https://www.autohotkey.com/docs/v2/Variables.htm#WorkingDir|`A_WorkingDir`}.  
 * @param {(String)} [OverwriteRename] - 
 * - `0` = Do not overwrite exiting files.  
 *   Function fails if Dest already exists.  
 * - `1` = Overwrite with limitation.  
 *   Files/Folders in the Dest folder are overwritten only if Source has the same files/folders.  
 * - `2` = Overwrite explicitly.  
 *   All files/folders are overwritten.  
 * - `R` = Rename instead of moving.  
 *   Renaming is all-or-none and cannot be partially successful.  
 *   The function fails if Dest already exists.  
 * @returns {(String)} An empty string is always returned.  
 * @throws {(Error)} - An exception is thrown if any error occurs.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/DirCopy.htm|`DirCopy()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileCopy.htm|`FileCopy()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileMove.htm|`FileMove()`},  
 * {@link https://www.autohotkey.com/docs/v2/lib/FileDelete.htm|`FileDelete()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/LoopFiles.htm|`Loop-Files`},
 * {@link https://www.autohotkey.com/docs/v2/lib/DirSelect.htm|`DirSelect()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SplitPath.htm|`SplitPath()`}
 * @example <caption>  
 * </caption>
 */
DirMove(Source, Dest [, OverwriteOrRename:=0]) => EmptyString 

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/DirSelect.htm|`DirSelect()`} displays a standard dialog that allows the user to select a folder.  
 * @param {(String)} [StartingFolder] - Directory to start in.  
 * The path to a directory. `C:\Some\Path`  
 * Include an asterisk `*` before the path to allow the users to navigate upward. `*c:\some\path`  
 * To set limit to how far upward the user can navigate, include the folder before it. `c:\some *c:\some\path`  
 * A CLSID folder can be used such as `::{20D04FE0-3AEA-1069-A2D8-08002B30309D}`  
 * @param {(Integer)} [Options]
 * - `0` = All options disabled.  
 * - `1` = A "New Folder" button is provided.  
 * - `+2` = Add 2 to provide an edit field for typing the name of a folder.  
 * - `+4` = Add 4 to omit the BIF_NEWDIALOGSTYLE style.  
 *   This removes the "make new folder" button but ensures DirSelect works in PEs.
 * @param {(String)} [Prompt] - Instruction text to display.  
 * @returns {(String)} Full path to the selected folder.  
 * An empty string is returned if the users cancels.  
 * Root directories include the trailing backslash `C:\` and can be removed with RTrim(path, )  
 * 
 *     path := RTrim(path, '\')
 * @see {@link https://www.autohotkey.com/docs/v2/lib/FileSelect.htm|`FileSelect()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/MsgBox.htm|`MsgBox()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/InputBox.htm|`InputBox()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/ToolTip.htm|`ToolTip()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm|`GUI`},
 * {@link https://www.autohotkey.com/docs/v2/misc/CLSID-List.htm|`CLSID List`},
 * {@link https://www.autohotkey.com/docs/v2/lib/DirCopy.htm|`DirCopy()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/DirMove.htm|`DirMove()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SplitPath.htm|`SplitPath()`}
 * @example <caption>  
 * </caption>
 */
DirSelect([StartingFolder:=A_MyDocuments, Options:=1, Prompt:='Select Folder - ' A_ScriptName]) => String 

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/DllCall.htm|`DllCall()`} calls a function inside a DLL, such as a standard Windows API function.  
 * @param {(String|Integer|Object)} DLLNameOrPath - Path to DLL or EXE, backslash, and function name.  
 * If a full path isn't used, DLLNameOrPath is assumed to start in {@link https://www.autohotkey.com/docs/v2/Variables.htm#WorkingDir|`A_WorkingDir`}.  
 * Path can be omitted when using `User32.dll`, `Kernel32.dll`, `ComCtl32.dll`, or `Gdi32.dll`.  
 * A `W` (unicode) prefix is added if no function can be found.  
 * Performance can be increased by {@link https://www.autohotkey.com/docs/v2/lib/DllCall.htm#load|preloading DLLs}. 
 * An integer function address can be used.  
 * If an object is passed, the `Ptr` property value is used.  
 * @param {(String|Integer)} [TypeN] - Arg's data type.  
 * - {@link https://www.autohotkey.com/docs/v2/lib/DllCall.htm#str|`String`}: `Str`, `WStr`, `AStr`  
 * - {@link https://www.autohotkey.com/docs/v2/lib/DllCall.htm#Int|`Integer`}: `Int64`, `Int`, `Short`, `Char`  
 * - Float: `Float`, `Double`  
 * - {@link https://www.autohotkey.com/docs/v2/lib/DllCall.htm#unsigned|`Unsigned numbers`}: `UInt`, `UShort`, `UChar`, `UPtr` (only 32-bit pointers)
 * - {@link https://www.autohotkey.com/docs/v2/lib/DllCall.htm#ptr|`Pointer`}: `Ptr`, `* or P [suffix]`  
 * - {@link https://www.autohotkey.com/docs/v2/lib/DllCall.htm#HRESULT|`COM`}: `HRESULT`  
 * 
 * There can be be multiple `type, arg` pairs listed sequentially.  
 * @param {(String)} [ArgN] - The argument being passed.  
 * There can be be multiple `type, arg` pairs listed sequentially.  
 * @param {(String)} [ReturnType] - Specify the expected returned data type.  
 * ReturnType can be omitted if the return type is `Int`, `BOOL`, or nothing,  
 * `Cdecl` can be be included before the return type for C calling conventions, but this only works on 32-bit versions of AHK.  
 * Most C++ object-oriented functions use `thiscall` which is NOT supported by AHK.  
 * @param {(String)} [ReturnType] - If omitted, return type defaults to {@link https://www.autohotkey.com/docs/v2/lib/DllCall.htm#HRESULT|`HRESULT`}  
 * If there is no return type (such as C's `void`), specify `Int` or another numeric type.  
 * `Cdecl` is supported but is generally not used by COM interface methods.
 * @throws {(PropertyError)} - An object passed to DLLNameOrPath is missing or has an invalid `Ptr` property  
 * @throws {(OSError)} - {@link https://www.autohotkey.com/docs/v2/lib/DllCall.htm#HRESULT|`HRESULT`} type used and function {@link https://learn.microsoft.com/windows/win32/api/winerror/nf-winerror-failed|returned error}.  
 * @throws {(TypeError)} - The DLLNameOrPath parameter is a floating point number. A string or positive integer is required.  
 * @throws {(ValueError)} - The {@link https://www.autohotkey.com/docs/v2/lib/DllCall.htm#types|return type} or one of the specified {@link https://www.autohotkey.com/docs/v2/lib/DllCall.htm#types|arg types} is invalid.  
 * @throws {(TypeError)} - An argument was passed a value of an unexpected type.  
 * @throws {(Error)} - The specified DllFile could not be accessed or loaded.  
 * @throws {(Error)} - The specified function could not be found inside the DLL.  
 * @throws {(Error)} - The function was called but it aborted with a fatal exception.  
 * The {@link https://www.autohotkey.com/docs/v2/lib/Error.htm#Extra|`Error.Extra`} property contains the exception code.  
 * @throws {(Error)} - Too many or too few arguments were passed to the function.  
 * The {@link https://www.autohotkey.com/docs/v2/lib/Error.htm#Extra|`Error.Extra`} property contains the number of bytes the data type was off by.  
 * @returns {(Primitive)} The value returned by Function.  
 * If Function return type does not return a value, the result is an undefined value of ReturnType.  
 * @see {@link https://www.autohotkey.com/docs/v2/Compat.htm#DllCall|`Binary Compatibility`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Buffer.htm|`Buffer object`},
 * {@link https://www.autohotkey.com/docs/v2/lib/ComCall.htm|`ComCall()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/PostMessage.htm|`PostMessage()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/OnMessage.htm|`OnMessage()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/CallbackCreate.htm|`CallbackCreate()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Run.htm|`Run()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/VarSetStrCapacity.htm|`VarSetStrCapacity()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SysGet.htm|`SysGet()`},
 * {@link https://www.autohotkey.com/docs/v2/Functions.htm|`Functions`},
 * {@link https://www.autohotkey.com/docs/v2/lib/_DllLoad.htm|`#DllLoad`},
 * {@link https://learn.microsoft.com/windows/win32/apiindex/windows-api-list|`Windows API Index`}
 * @example <caption>  
 * </caption>
 */
DllCall(DLLNameOrPath [, TypeN:=unset, ArgN:=unset, ReturnType:='Int']) => String

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/Download.htm|`Download()`} downloads a file from the Internet.  
 * Any proxies configured for IE are used.  
 * @param {(String)} URL - URL to download.  
 * FTP and Gopher URLS are supported.  
 * @param {(String)} SaveFile - Path to save downloaded file.  
 * If a full path isn't used, SaveFile is assumed to start in {@link https://www.autohotkey.com/docs/v2/Variables.htm#WorkingDir|`A_WorkingDir`}.  
 * To download to a variable, see {@link https://www.autohotkey.com/docs/v2/lib/Download.htm#ExWHR|`this example`}.  
 * @returns {(String)} An empty string is always returned.  
 * @throws {(Error)} - An exception is thrown on failure.  
 * Note that a download may seem successful only because an "error page" is returned.  
 * That error page is what gets saved.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/FileRead.htm|`FileRead()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileCopy.htm|`FileCopy()`}
 * @example <caption>  
 * </caption>
 */
Download(URL, SaveFile) => String 

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/DriveEject.htm|`DriveEject()`} ejects the tray of the specified CD/DVD drive, or ejects a removable drive.  
 * This function waits fo the ejection or retraction to completel before continuing.  
 * @param {(String)} [Drive] - The path to an optical drive.  
 * Drive letter can be used. `:` and `\` are optional. `E`, `E:`, `E:\`  
 * Device paths can be used and gotten from {@link https://learn.microsoft.com/windows-server/administration/windows-commands/mountvol|`mountvol`}. `\\?\Volume{...}`
 * @returns {(String)} An empty string is always returned.  
 * @throws {(Error)} - No drive was found  
 * The underlying system functions do not always report failure.  
 * An exception may or may not be thrown.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/Drive.htm|`Drive functions`}
 * {@link https://www.autohotkey.com/docs/v2/lib/DriveGetStatusCD.htm|`DriveGetStatusCD()`},
 * @example <caption>  
 * </caption>
 */
DriveEject([Drive:=unset]) => EmptyString 

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/DriveGetCapacity.htm|`DriveGetCapacity()`} returns the total capacity of the drive which contains the specified path, in megabytes.  
 * @param {(String)} Path - Any path contained by the drive.  
 * May work with UNC paths and mapped drives.  
 * @returns {(Integer)} Total capacity of the drive in megabytes.  
 * @throws {(Error)} - An exception is thrown on failure.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/Drive.htm|`Drive functions`},
 * {@link https://www.autohotkey.com/docs/v2/lib/DriveGetSpaceFree.htm|`DriveGetSpaceFree()`}
 * @example <caption>  
 * </caption>
 */
DriveGetCapacity(Path) => Integer 

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/DriveGetFileSystem.htm|`DriveGetFileSystem()`} returns the type of the specified drive's file system.  
 * @param {(String)} Drive - Drive letter followed by a colon. Backslash is optional.  
 * @returns {(String)} The file system type for the provided Drive.  
 * Including (but not limited to): `NTFS`, `HPFS`, `FAT32`, `FAT`, `CDFS`, `UDF`
 * @throws {(Error)} - An exception is thrown on failure
 * @see {@link https://www.autohotkey.com/docs/v2/lib/Drive.htm|`Drive functions`}
 * @example <caption>  
 * </caption>
 */
DriveGetFileSystem(Drive) => String 

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/DriveGetLabel.htm|`DriveGetLabel()`} returns the volume label of the specified drive.  
 * @param {(String)} Drive - Drive letter followed by a colon. Backslash is optional.  
 * UNC names are allowed. `\srv1\dir1`  
 * @returns {(String)} - Volume name of Drive
 * @throws {(Error)} - An exception is thrown on failure
 * @see {@link https://www.autohotkey.com/docs/v2/lib/Drive.htm|`Drive functions`},
 * {@link https://www.autohotkey.com/docs/v2/lib/DriveSetLabel.htm|`DriveSetLabel()`}
 * @example <caption>  
 * </caption>
 */
DriveGetLabel(drive) => String 

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/DriveGetList.htm|`DriveGetList()`} returns a string of letters.  
 * There is no separators between characters.  
 * @param {(String)} [DriveType] - Omit DriveType to retrieve all types.  
 * Or use one of the following words:  
 * - `CDROM`
 * - `REMOVABLE`
 * - `FIXED`
 * - `NETWORK`
 * - `RAMDISK`
 * - `UNKNOWN`
 * @returns {(String)} String of drive letters.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/Drive.htm|`Drive functions`},
 * @example <caption>  
 * Show all system drive letters.</caption>
 * List := DriveGetList()
 * MsgBox(list)
 */
DriveGetList([DriveType:=unset]) => String 

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/DriveGetSerial.htm|`DriveGetSerial()`} returns the volume serial number of the specified drive.  
 * @param {(String)} Drive - Drive letter followed by a colon. Backslash is optional.  
 * UNC names are allowed. `\srv1\dir1`  
 * @returns {(Integer)} Drive's volume serial.  
 * To convert to hex, use {@link https://www.autohotkey.com/docs/v2/lib/Format.htm|`Format()`}. See example below.  
 * @throws {(Error)} - An exception is thrown on failure
 * @see {@link https://www.autohotkey.com/docs/v2/lib/Drive.htm|`Drive functions`},
 * @example <caption>  
 * </caption>
 * serial := DriveGetSerial('C:')
 * hex_serial := Format('{:X}', serial)
 * MsgBox('Serial: ' serial '`nHex: ' hex_serial)
 */
DriveGetSerial(Drive) => Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/DriveGetSpaceFree.htm|`DriveGetSpaceFree()`} returns the free disk space of the drive which contains the specified path, in megabytes.  
 * @param {(String)} Path - Any path contained by the drive.  
 * May work with UNC paths and mapped drives.  
 * @returns {(Integer)} The free amount of disk space on the drive Path belongs to in megabytes.  
 * @throws {(Error)} - An exception is thrown on failure  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/Drive.htm|`Drive functions`},
 * {@link https://www.autohotkey.com/docs/v2/lib/DriveGetCapacity.htm|`DriveGetCapacity()`}
 * @example <caption>  
 * </caption>
 */
DriveGetSpaceFree(Path) => Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/DriveGetStatus.htm|`DriveGetStatus()`} returns the status of the drive which contains the specified path.  
 * @param {(String)} Path - Any path contained by the drive.  
 * May work with UNC paths and mapped drives.  
 * @returns {(String)} The status of the drive that Path belongs to.  
 * - `Ready` = This is the most common.
 * - `NotReady` = Typical for removable drives that don't contain media.
 * - `Unknown` = Might indicate unformatted/RAW file system.
 * - `Invalid` = Path does not exist or is a network drive that is presently inaccessible, etc.
 * @throws {(Error)} - An exception is thrown on failure  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/Drive.htm|`Drive functions`}
 * @example <caption>  
 * </caption>
 */
DriveGetStatus(Path) => String 

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/DriveGetStatusCD.htm|`DriveGetStatusCD()`} returns the media status of the specified CD/DVD drive.  
 * @param {(String)} [Drive] - Drive letter followed by a colon.  
 * If omitted, the default CD/DVD drive will be used.  
 * @returns {(String)} The media status of Drive
 * - `not ready` = The drive is not ready to be accessed or is busy.  
 *   Known limitation: Can occur when drive contains a DVD instead of a CD.  
 * - `open` = The drive contains no disc, or the tray is ejected.  
 * - `playing` = The drive is playing a disc.  
 * - `paused` = The previously playing audio or video is now paused.  
 * - `seeking` = The drive is seeking.  
 * - `stopped` = The drive contains a CD but is not currently accessing it.  
 * @throws {(Error)} - An exception is thrown on failure  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/Drive.htm|`Drive functions`},
 * {@link https://www.autohotkey.com/docs/v2/lib/DriveEject.htm|`DriveEject()`}
 * @example <caption>  
 * </caption>
 */
DriveGetStatusCD([Drive:=unset]) => String 

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/DriveGetType.htm|`DriveGetType()`} returns the type of the drive which contains the specified path.  
 * @param {(String)} Path - Any path contained by the drive.  
 * May work with UNC paths and mapped drives.  
 * @returns {(String)} The type of drive that Path belongs to.  
 * An empty string is returned if Path is invalid. Otherwise: 
 * - `Unknown`
 * - `Removable`
 * - `Fixed`
 * - `Network`
 * - `CDROM`
 * - `RAMDisk`
 * @throws {(Error)} - An exception is thrown on failure  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/Drive.htm|`Drive functions`},
 * @example <caption>  
 * </caption>
 */
DriveGetType(Path) => String 

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/DriveLock.htm|`DriveLock()`} prevents the eject feature of the specified drive from working.  
 * To unlock a drive, call {@link https://www.autohotkey.com/docs/v2/lib/DriveUnlock.htm|`DriveUnlock()`}.  
 * @param {(String)} Drive - Drive letter followed by a colon. Backslash is optional.  
 * May work with UNC paths and mapped drives.  
 * @returns {(String)} An empty string is always returned.  
 * @throws {(Error)} - Drive does not exist or does not support the locking feature  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/Drive.htm|`Drive functions`},
 * {@link https://www.autohotkey.com/docs/v2/lib/DriveUnlock.htm|`DriveUnlock()`}
 * @example <caption>  
 * </caption>
 */
DriveLock(Drive) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/DriveEject.htm|`DriveEject()`} ejects the tray of the specified CD/DVD drive, or ejects a removable drive.  
 * This function waits fo the ejection or retraction to completel before continuing.  
 * @param {(String)} [Drive] - The path to an optical drive.  
 * Drive letter can be used. `:` and `\` are optional. `E`, `E:`, `E:\`  
 * Device paths can be used and gotten from {@link https://learn.microsoft.com/windows-server/administration/windows-commands/mountvol|`mountvol`}. `\\?\Volume{...}`
 * @returns {(String)} An empty string is always returned.  
 * @throws {(Error)} - No drive was found  
 * The underlying system functions do not always report failure.  
 * An exception may or may not be thrown.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/Drive.htm|`Drive functions`}
 * {@link https://www.autohotkey.com/docs/v2/lib/DriveGetStatusCD.htm|`DriveGetStatusCD()`},
 * @example <caption>  
 * </caption>
 */
DriveRetract([Drive:=unset]) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/DriveSetLabel.htm|`DriveSetLabel()`} changes the volume label of the specified drive.  
 * @param {(String)} Drive - Drive letter followed by a colon. Backslash is optional.  
 * May work with UNC paths and mapped drives.  
 * @param {(String)} [NewLabel] - New drive label.  
 * If omitted, drive label is blanked.  
 * @returns {(String)} An empty string is always returned.  
 * @throws {(Error)} - An exception is thrown on failure  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/Drive.htm|`Drive functions`},
 * {@link https://www.autohotkey.com/docs/v2/lib/DriveGetLabel.htm|`DriveGetLabel()`}  
 * @example <caption>  
 * </caption>
 */
DriveSetLabel(Drive [, NewLabel:=unset]) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/DriveUnlock.htm|`DriveUnlock()`} restores the eject feature of the specified drive.  
 * This may need to be called multiple times if the drive was locked multiple times.  
 * @param {(String)} Drive - Drive letter followed by a colon. Backslash is optional.  
 * May work with UNC paths and mapped drives.  
 * @returns {(String)} An empty string is always returned.  
 * @throws {(Error)} - An exception is thrown on failure  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/Drive.htm|`Drive functions`},  
 * {@link https://www.autohotkey.com/docs/v2/lib/DriveLock.htm|`DriveLock()`}
 * @example <caption>  
 * </caption>
 */
DriveUnlock(Drive) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/Edit.htm|`Edit()`} opens the current script for editing in the default editor.  
 * Uses the associated "edit" verb in the registry. Notepad by default.  
 * Registry location: `HKCU\Software\Classes\AutoHotkeyScript\shell\edit\command`  
 * @returns {(String)} An empty string is always returned.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/Reload.htm|`Reload()`},
 * {@link https://www.autohotkey.com/docs/v2/Program.htm#edit|`How to edit a script`},
 * {@link https://www.autohotkey.com/docs/v2/misc/Editors.htm|`Editors with AutoHotkey support`}
 * @example <caption>  
 * </caption>
 */
Edit() => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/EditGetCurrentCol.htm|`EditGetCurrentCol()`} returns the column number in an Edit control where the caret (text insertion point) resides.  
 * @param {(String|Integer|Object)} Control - A control's ClassNN,  
 * Text, HWND (handle), or an object with an HWND. See {@link https://www.autohotkey.com/docs/v2/lib/Control.htm#Parameter|`Control Parameter`}.
 * @param {(String|Integer|Object)} [WinTitle] - A string using a {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`} to match a window.  
 * Types: {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_exe|`ahk_exe`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_class|`ahk_class`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_id|`ahk_id`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_pid|`ahk_pid`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_group|`ahk_group`}  
 * If the string is the letter `A`, the current active window is used.  
 * If all `Win` params are omited, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#LastFoundWindow|`Last Found Window`} is used.  
 * @param {(String)} [WinText] - Text that must be found in the window.  
 * Use WindowSpy to view window text.  
 * @param {(String)} [NoWinTitle] - Window title must not contain this text.  
 * @param {(String)} [NoWinText] - Window text must not contain this text.
 * Use WindowSpy to view window text.
 * @returns {(Integer)} The column number in the Edit control where the caret resides.  
 * @throws {(Error)} - Window or control could not be found
 * @see {@link https://www.autohotkey.com/docs/v2/lib/EditGetCurrentLine.htm|`EditGetCurrentLine()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/EditGetLineCount.htm|`EditGetLineCount()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/EditGetLine.htm|`EditGetLine()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/EditGetSelectedText.htm|`EditGetSelectedText()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/EditPaste.htm|`EditPaste()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Control.htm|`Control functions`},
 * {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SetTitleMatchMode.htm|`SetTitleMatchMode()`}
 * @example <caption>  
 * </caption>
 */
EditGetCurrentCol(Control [, WinTitle:='', WinText:='', NoWinTitle:='', NoWinText:='']) => Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/EditGetCurrentLine.htm|`EditGetCurrentLine()`} returns the line number in an Edit control where the caret (text insert point) resides.  
* @param {(String|Integer|Object)} Control - A control's ClassNN,  
 * Text, HWND (handle), or an object with an HWND. See {@link https://www.autohotkey.com/docs/v2/lib/Control.htm#Parameter|`Control Parameter`}.
 * @param {(String|Integer|Object)} [WinTitle] - A string using a {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`} to match a window.  
 * Types: {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_exe|`ahk_exe`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_class|`ahk_class`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_id|`ahk_id`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_pid|`ahk_pid`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_group|`ahk_group`}  
 * If the string is the letter `A`, the current active window is used.  
 * If all `Win` params are omited, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#LastFoundWindow|`Last Found Window`} is used.  
 * @param {(String)} [WinText] - Text that must be found in the window.  
 * Use WindowSpy to view window text.  
 * @param {(String)} [NoWinTitle] - Window title does not contain this text.  
 * @param {(String)} [NoWinText] - Text that must not appear in the window.
 * Use WindowSpy to view window text.
 * @returns {(Integer)} The line number in the Edit control where the caret resides.  
 * @throws {(Error)} - Window or control could not be found  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/EditGetCurrentCol.htm|`EditGetCurrentCol()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/EditGetLineCount.htm|`EditGetLineCount()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/EditGetLine.htm|`EditGetLine()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/EditGetSelectedText.htm|`EditGetSelectedText()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/EditPaste.htm|`EditPaste()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Control.htm|`Control functions`},
 * {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SetTitleMatchMode.htm|`SetTitleMatchMode()`}
  * @example <caption>  
 * </caption>
 */
EditGetCurrentLine(Control [, WinTitle:='', WinText:='', NoWinTitle:='', NoWinText:='']) => Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/EditGetLine.htm|`EditGetLine()`} returns the text of the specified line in an Edit control.  
 * @param {(Integer)} N - Number of the line to get.  
 * @param {(String|Integer|Object)} Control - A control's ClassNN,  
 * Text, HWND (handle), or an object with an HWND. See {@link https://www.autohotkey.com/docs/v2/lib/Control.htm#Parameter|`Control Parameter`}.
 * @param {(String|Integer|Object)} [WinTitle] - A string using a {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`} to match a window.  
 * Types: {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_exe|`ahk_exe`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_class|`ahk_class`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_id|`ahk_id`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_pid|`ahk_pid`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_group|`ahk_group`}  
 * If the string is the letter `A`, the current active window is used.  
 * If all `Win` params are omited, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#LastFoundWindow|`Last Found Window`} is used.  
 * @param {(String)} [WinText] - Text that must be found in the window.  
 * Use WindowSpy to view window text.  
 * @param {(String)} [NoWinTitle] - Window title does not contain this text.  
 * @param {(String)} [NoWinText] - Text that must not appear in the window.
 * Use WindowSpy to view window text.
 * @returns {(String)} Text from line N of the Edit control.  
 * May end in `` `r `` or `` `r`n ``, depending on the control.  
 * @throws {(TargetError)} - Window or control could not be found  
 * @throws {(ValueError)} - N is out of range or otherwise invalid  
 * @throws {(OSError)} - Message could not be sent to the control  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/EditGetCurrentCol.htm|`EditGetCurrentCol()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/EditGetCurrentLine.htm|`EditGetCurrentLine()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/EditGetLineCount.htm|`EditGetLineCount()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/EditGetSelectedText.htm|`EditGetSelectedText()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/EditPaste.htm|`EditPaste()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Control.htm|`Control functions`},
 * {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SetTitleMatchMode.htm|`SetTitleMatchMode()`}
 * @example <caption>  
 * </caption>
 */
EditGetLine(N, Control [, WinTitle:='', WinText:='', NoWinTitle:='', NoWinText:='']) => String

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/EditGetLineCount.htm|`EditGetLineCount()`} returns the number of lines in an Edit control.  
 * @param {(String|Integer|Object)} Control - A control's ClassNN,  
 * Text, HWND (handle), or an object with an HWND. See {@link https://www.autohotkey.com/docs/v2/lib/Control.htm#Parameter|`Control Parameter`}.
 * @param {(String|Integer|Object)} [WinTitle] - A string using a {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`} to match a window.  
 * Types: {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_exe|`ahk_exe`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_class|`ahk_class`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_id|`ahk_id`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_pid|`ahk_pid`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_group|`ahk_group`}  
 * If the string is the letter `A`, the current active window is used.  
 * If all `Win` params are omited, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#LastFoundWindow|`Last Found Window`} is used.  
 * @param {(String)} [WinText] - Text that must be found in the window.  
 * Use WindowSpy to view window text.  
 * @param {(String)} [NoWinTitle] - Window title does not contain this text.  
 * @param {(String)} [NoWinText] - Text that must not appear in the window.
 * Use WindowSpy to view window text.
 * @returns {(Integer)} The number of lines in an Edit control.  
 * All Edit controls have at least 1 line, even if it has no text. 
 * @throws {(TargetError)} - Window or control could not be found  
 * @throws {(OSError)} - Message could not be sent to the control  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/EditGetCurrentCol.htm|`EditGetCurrentCol()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/EditGetCurrentLine.htm|`EditGetCurrentLine()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/EditGetLine.htm|`EditGetLine()`}
 * {@link https://www.autohotkey.com/docs/v2/lib/EditGetSelectedText.htm|`EditGetSelectedText()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/EditPaste.htm|`EditPaste()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Control.htm|`Control functions`},
 * {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SetTitleMatchMode.htm|`SetTitleMatchMode()`}
 * @example <caption>  
 * </caption>
 */
EditGetLineCount(Control [, WinTitle:='', WinText:='', NoWinTitle:='', NoWinText:='']) => Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/EditGetSelectedText.htm|`EditGetSelectedText()`} returns the selected text in an Edit control.  
 * @param {(String|Integer|Object)} Control - A control's ClassNN,  
 * Text, HWND (handle), or an object with an HWND. See {@link https://www.autohotkey.com/docs/v2/lib/Control.htm#Parameter|`Control Parameter`}.
 * @param {(String|Integer|Object)} [WinTitle] - A string using a {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`} to match a window.  
 * Types: {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_exe|`ahk_exe`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_class|`ahk_class`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_id|`ahk_id`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_pid|`ahk_pid`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_group|`ahk_group`}  
 * If the string is the letter `A`, the current active window is used.  
 * If all `Win` params are omited, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#LastFoundWindow|`Last Found Window`} is used.  
 * @param {(String)} [WinText] - Text that must be found in the window.  
 * Use WindowSpy to view window text.  
 * @param {(String)} [NoWinTitle] - Window title does not contain this text.  
 * @param {(String)} [NoWinText] - Text that must not appear in the window.
 * Use WindowSpy to view window text.
 * @returns {(String)} The selected text in the Edit control.  
 * An empty string is returned if no text is selected.  
 * @throws {(TargetError)} - Window or control could not be found  
 * @throws {(Error|OSError)} - There was a problem retrieving the text  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/EditGetCurrentCol.htm|`EditGetCurrentCol()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/EditGetCurrentLine.htm|`EditGetCurrentLine()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/EditGetLine.htm|`EditGetLine()`}
 * {@link https://www.autohotkey.com/docs/v2/lib/EditPaste.htm|`EditPaste()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/EditGetLineCount.htm|`EditGetLineCount()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Control.htm|`Control functions`},
 * {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SetTitleMatchMode.htm|`SetTitleMatchMode()`}
 * @example <caption>  
 * </caption>
 */
EditGetSelectedText(Control [, WinTitle:='', WinText:='', NoWinTitle:='', NoWinText:='']) => String

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/EditPaste.htm|`EditPaste()`} pastes the specified string at the caret in an Edit control.  
 * @param {(String)} Text - String to paste into Edit control.  
 * @param {(String|Integer|Object)} Control - A control's ClassNN,  
 * Text, HWND (handle), or an object with an HWND. See {@link https://www.autohotkey.com/docs/v2/lib/Control.htm#Parameter|`Control Parameter`}.
 * @param {(String|Integer|Object)} [WinTitle] - A string using a {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`} to match a window.  
 * Types: {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_exe|`ahk_exe`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_class|`ahk_class`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_id|`ahk_id`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_pid|`ahk_pid`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_group|`ahk_group`}  
 * If the string is the letter `A`, the current active window is used.  
 * If all `Win` params are omited, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#LastFoundWindow|`Last Found Window`} is used.  
 * @param {(String)} [WinText] - Text that must be found in the window.  
 * Use WindowSpy to view window text.  
 * @param {(String)} [NoWinTitle] - Window title does not contain this text.  
 * @param {(String)} [NoWinText] - Text that must not appear in the window.
 * Use WindowSpy to view window text.
 * @returns {(String)} An empty string is always returned.  
 * @throws {(TargetError)} - Window or control could not be found  
 * @throws {(OSError)} - A message could not be sent to the control  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/ControlSetText.htm|`ControlSetText()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Control.htm|`Control functions`},
 * {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SetTitleMatchMode.htm|`SetTitleMatchMode()`}
 * @example <caption>  
 * </caption>
 */
EditPaste(Text, Control [, WinTitle:='', WinText:='', NoWinTitle:='', NoWinText:='']) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/EnvGet.htm|`EnvGet()`} retrieves an environment variable.  
 * @param {(String)} EnvVar - Name of the environment variable.
 * @returns {(String)} The value of EnvVar.  
 * An empty string is returned if EnvVar has no value.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/EnvSet.htm|`EnvSet()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Run.htm|`Run()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Run.htm|`RunWait()`}
 * @example <caption>  
 * </caption>
 */
EnvGet(EnvVar) => String

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/EnvSet.htm|`EnvSet()`} writes a value to a variable contained in the environment.  
 * @param {(String)} EnvVar - Name of the environment variable.  
 * @param {(String)} [Value] - Value to write.  
 * Omitting value deletes the variable.  
 * @returns {(String)} An empty string is always returned.  
 * @throws {(OSError)} - Any failure  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/EnvGet.htm|`EnvGet()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Run.htm|`Run()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Run.htm|`RunWait()`}
 * @example <caption>  
 * </caption>
 */
EnvSet(EnvVar [, Value:=unset]) => String

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/Exit.htm|`Exit()`} exits the {@link https://www.autohotkey.com/docs/v2/misc/Threads.htm|`current thread`}.  
 * @param {(Integer)} [ExitCode] - Any integer between -2147483648 and 2147483647.  
 * This code is accessible to any program that spawned the script.  
 * @returns {(String)} An empty string is always returned.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/ExitApp.htm|`ExitApp()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/OnExit.htm|`OnExit()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Return.htm|`Return()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Persistent.htm|`Persistent()`}
 * {@link https://www.autohotkey.com/docs/v2/Functions.htm|`Functions`},
 * {@link https://www.autohotkey.com/docs/v2/misc/Threads.htm|`Threads`},
 * @example <caption>  
 * </caption>
 */
Exit([ExitCode:=0]) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/ExitApp.htm|`ExitApp()`} terminates the script.  
 * @param {(Integer)} [ExitCode] - Any integer between -2147483648 and 2147483647.  
 * This code is accessible to any program that spawned the script.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/Exit.htm|`Exit()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/OnExit.htm|`OnExit()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Persistent.htm|`Persistent()`}
 * @example <caption>  
 * Example of a kill switch.</caption>
 * ; Extremely useful to have a way to always end the script
 * *Esc::ExitApp()
 */
ExitApp([ExitCode:=0]) => String

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/Math.htm#Exp|`Exp()`} returns the result of raising e/Euler's number (2.71828182845905) to the Nth power.  
 * This is not for exponents. See the {@link https://www.autohotkey.com/docs/v2/Variables.htm#pow|`**` exponent operator}.  
 * @param {(Number)} N - The power to raise e to.  
 * N can be negative.  
 * @returns {(Number)} Result of calculation.  
 * @example <caption>  
 * </caption>
 */
Exp(N) => String

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/FileAppend.htm|`FileAppend()`} writes text or binary data to the end of a file.  
 * File is created first if it does not exist.  
 * To overwrite a file, use {@link https://www.autohotkey.com/docs/v2/lib/FileDelete.htm|`FileDelete()`}.  
 * @param {(String|Object)} Text - Text to append to file.  
 * If no text is provided, a new, blank file is still created.  
 * A {@link |`buffer-like`} object can be passed to append raw binary data.  
 * Any object using {@link https://www.autohotkey.com/docs/v2/lib/Buffer.htm#Ptr|`Ptr`} and {@link https://www.autohotkey.com/docs/v2/lib/Buffer.htm#Size|`Size`} properties can be used.  
 * BOM (byte order mark) is only written if `UTF-8` or `UTF-16` encoding is used.  
 * @param {(String)} [Filename] - Name of the file to be appended.  
 * If a full path isn't used, Filename is assumed to start in {@link https://www.autohotkey.com/docs/v2/Variables.htm#WorkingDir|`A_WorkingDir`}.  
 * Use an asterisk `*` as the Filename to send Text to standard out (stdout).  
 * FileName can be omitted if inside a {@link https://www.autohotkey.com/docs/v2/lib/LoopRead.htm|`Loop-Files`} that's using an {@link https://www.autohotkey.com/docs/v2/lib/LoopRead.htm#OutputFile|`OutputFile`}.  
 * @param {(String)} [Options] - Zero or more options separated by spaces/tabs.  
 * - `Encoding` = Any of the {@link https://www.autohotkey.com/docs/v2/lib/FileEncoding.htm#Parameters|`FileEncoding()`} names.
 *   - `CP0`: The system default ANSI code page.
 *   - `UTF-8`: Unicode UTF-8 (equivalent to CP65001).
 *   - `UTF-8-RAW`: UTF-8 but no byte order mark is written when a new file is created.
 *   - `UTF-16`: Unicode UTF-16 with little endian byte order (CP1200).
 *   - `UTF-16-RAW`: UTF-16 but no byte order mark is written when a new file is created.
 *   - `CPnnn`: A code page with numeric identifier nnn. See {@link https://learn.microsoft.com/windows/win32/intl/code-page-identifiers|`Code Page Identifiers`}.  
 *   - `nnn`: A numeric code page identifier.
 * - `RAW` = Write the Text bytes to the file as-is, without any conversion.  
 * - `` `n ``=  Inserts a carriage return `` `r `` before all linefeeds `` `n ``.  
 * @returns {(String)} An empty string is always returned.  
 * @throws {(OSError)} - Thrown on failure.  
 * {@link https://www.autohotkey.com/docs/v2/Variables.htm#LastError|`A_LastError`} is set to the result of the OS's GetLastError().  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/FileEncoding.htm|`FileEncoding()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileOpen.htm|`FileOpen()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileRead.htm|`FileRead()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/OutputDebug.htm|`OutputDebug()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileDelete.htm|`FileDelete()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/IniWrite.htm|`IniWrite()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/LoopRead.htm|`Loop-Files`},
 * {@link https://www.autohotkey.com/docs/v2/lib/File.htm|`File Object`},
 * {@link https://www.autohotkey.com/docs/v2/Scripts.htm#continuation|`Continuation Sections`}
 * @example <caption>  
 * </caption>
 */
FileAppend(Text [, Filename:=unset, Options:='']) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/FileCopy.htm|`FileCopy()`} copies one or more files.  
 * @param {(String)} SourcePattern - Name of a file, a folder, or a wildcard `*` pattern.  
 * If a full path isn't used, SourcePattern is assumed to start in {@link https://www.autohotkey.com/docs/v2/Variables.htm#WorkingDir|`A_WorkingDir`}.  
 * All AHK files: `'folder\*.ahk'`  
 * All files that start with Project: `folder\project*.*`  
 * @param {(String)} DestPattern - Name or pattern of the destination.  
 * If a full path isn't used, DestPattern is assumed to start in {@link https://www.autohotkey.com/docs/v2/Variables.htm#WorkingDir|`A_WorkingDir`}.  
 * An asterisk before the file ext dot will be replaced with the SourcePattern's file name.  
 * An asterisk after the file ext dot will be replaced with the SourcePattern's file ext.  
 * A simple 1:1 copy while retaining the original:
 * 
 *     FileCopy('D:\Scripts\*.ahk', 'D:\Scripts\backup\*.*')
 * @param {(Integer)} [Overwrite]
 * - `0` = Do not overwrite existing files.  
 * - `1` = Overwrite existing files.  
 *   If DestPattern doesn't have a complimentary file/subfolder in SourcePattern, it will not be deleted.  
 * 
 * Other values are reserved for future use.  
 * @returns {(String)} An empty string is always returned.  
 * @throws {(Error)} - If any files failed to be copied.  
 * {@link https://www.autohotkey.com/docs/v2/lib/Error.htm#Extra|`Error.Extra`} is set to the number of failures.  
 * @throws {(Error)} - The specific file was not found.  
 * Patterns using broad matching with `?` and `*` do not error on match failure.  
 * @throws {(Error)} - Copying a file over itself, even with a OverWrite set to 1.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/FileMove.htm|`FileMove()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/DirCopy.htm|`DirCopy()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/DirMove.htm|`DirMove()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileDelete.htm|`FileDelete()`}
 * @example <caption>  
 * </caption>
 */
FileCopy(SourcePattern, DestPattern [, Overwrite:=0]) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/FileCreateShortcut.htm|`FileCreateShortcut()`} creates a shortcut (.lnk) file.  
 * @param {(String)} File - File to create a shortcut for.  
 * File path might not be needed if file is part of the PATH {@link https://www.autohotkey.com/docs/v2/Concepts.htm#environment-variables|`environment variable`}.  
 * @param {(String)} Link - Name of the new shortcut link.  
 * @param {(String)} [WorkingDir] - Dirctory for File's current working directory.  
 * If blank or omitted, the new shortcut has a blank "Start in" field.  
 * @param {(String)} [Args] - Parameters to be passed to Link when launched.  
 * If blank or omitted, Link launches File with no parameters.  
 * @param {(String)} [Description] - Comments describing the new Link.  
 * If blank of omitted, shortcut will have no description.  
 * @param {(String)} [IconFile] - Full path and name of the icon to use for shortcut.  
 * If blank of omitted, shortcut will use File's icon.  
 * @param {(String)} [ShortcutKey] - A single letter, number, or key name from the {@link https://www.autohotkey.com/docs/v2/KeyList.htm|`key list`} to launch the Link.  
 * If blank or omitted, no shortcut key is assigned.  
 * All shortcuts use the `Ctrl+Alt` modifiers and cannot be changed.  
 * @param {(Integer)} [IconNumber] - The number of the icon to use from IconFile.  
 * If blank or omitted, it defaults to 1.  
 * @param {(Integer)} [RunState] - Window state when Link is launched:  
 * - `1` = Normal
 * - `3` = Maximized
 * - `7` = Minimized
 * @returns {(String)} An empty string is always returned.  
 * @throws {(Error)} - Any failure.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/FileGetShortcut.htm|`FileGetShortcut()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileAppend.htm|`FileAppend()`}
 * @example <caption>  
 * </caption>
 */
FileCreateShortcut(File, LinkFile [, WorkingDir:=A_WorkingDir, Args:=unset, Description:='', IconFile:='', ShortcutKey:='', IconNumber:=1, RunState:=1]) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/FileDelete.htm|`FileDelete()`} deletes one or more files.  
 * To delete an entire folder/subfolders, use {@link https://www.autohotkey.com/docs/v2/lib/DirDelete.htm|`DirDelete()`}. 
 * @param {(String)} FilePattern - Name of a file or a wildcard `*` pattern.  
 * If a full path isn't used, FilePattern is assumed to start in {@link https://www.autohotkey.com/docs/v2/Variables.htm#WorkingDir|`A_WorkingDir`}.  
 * @returns {(String)} An empty string is always returned.  
 * @throws {(Error)} - Any files failed to delete.  
 * {@link https://www.autohotkey.com/docs/v2/lib/Error.htm#Extra|`Error.Extra`} is set to the number of failures.  
 * Patterns using broad matching with `?` and `*` do not error on match failure.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/FileRecycle.htm|`FileRecycle()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/DirDelete.htm|`DirDelete()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileCopy.htm|`FileCopy()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileMove.htm|`FileMove()`}
 * @example <caption>  
 * </caption>
 */
FileDelete(FilePattern) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/FileEncoding.htm|`FileEncoding()`} sets the default encoding for {@link https://www.autohotkey.com/docs/v2/lib/FileRead.htm|`FileRead()`}, {@link https://www.autohotkey.com/docs/v2/lib/LoopRead.htm|`Loop-Read`}, {@link https://www.autohotkey.com/docs/v2/lib/FileAppend.htm|`FileAppend()`}, and {@link https://www.autohotkey.com/docs/v2/lib/FileOpen.htm|`FileOpen()`}.  
 * @param {(String)} Encoding - One of the following values:  
 * - `Encoding` = Any of the {@link https://www.autohotkey.com/docs/v2/lib/FileEncoding.htm#Parameters|`FileEncoding()`} names.
 *   - `CP0`: The system default ANSI code page.
 *   - `UTF-8`: Unicode UTF-8 (equivalent to CP65001).
 *   - `UTF-8-RAW`: UTF-8 but no byte order mark is written when a new file is created.
 *   - `UTF-16`: Unicode UTF-16 with little endian byte order (CP1200).
 *   - `UTF-16-RAW`: UTF-16 but no byte order mark is written when a new file is created.
 *   - `CPnnn`: A code page with numeric identifier nnn. See {@link https://learn.microsoft.com/windows/win32/intl/code-page-identifiers|`Code Page Identifiers`}.  
 *   - `nnn`: A numeric code page identifier.
 * - `RAW` = Write the Text bytes to the file as-is, without any conversion.  
 * - `` `n ``=  Inserts a carriage return `` `r `` before all linefeeds `` `n ``.  
 * @returns {(String)} The previous setting.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/FileOpen.htm|`FileOpen()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/StrGet.htm|`StrGet()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/StrPut.htm|`StrPut()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileRead.htm#Binary|`Reading Binary Data`}
 * @example <caption>  
 * </caption>
 */
FileEncoding(Encoding) => String

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/FileExist.htm|`FileExist()`} checks for the existence of a file or folder and returns its attributes.  
 * @param {(String)} FilePattern - The path, filename, or file pattern to check.  
 * If a full path isn't used, FilePattern is assumed to start in {@link https://www.autohotkey.com/docs/v2/Variables.htm#WorkingDir|`A_WorkingDir`}.  
 * @returns {(String)} A string of all attributes found for file or direcotry.  
 * - Empty String = No file or folder was found.  
 * - `R` = ReadOnly  
 * - `A` = Archive  
 * - `S` = System  
 * - `H` = Hidden  
 * - `N` = Normal  
 * - `D` = Directory  
 * - `O` = Offline  
 * - `C` = Compressed  
 * - `T` = Temporary  
 * - `L` = REPARSE_POINT (typically a symbolic link)  
 * - `X` = File has no attributes (rare)
 * @see {@link https://www.autohotkey.com/docs/v2/lib/DirExist.htm|`DirExist()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileGetAttrib.htm|`FileGetAttrib()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/LoopFiles.htm|`Loop-Files`}
 * @example <caption>  
 * </caption>
 */
FileExist(FilePattern) => String

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/FileInstall.htm|`FileInstall()`} includes the specified file inside the {@link https://www.autohotkey.com/docs/v2/Scripts.htm#ahk2exe|`compiled version`} of the script.  
 * @param {(String)} Source - Name of a single file to add to the EXE.  
 * Source must be a string, cannot be a variable of any type, and must be on the same line as the FileInstall() function.  
 * If a full path isn't used, Source is assumed to start in {@link https://www.autohotkey.com/docs/v2/Variables.htm#WorkingDir|`A_WorkingDir`}.  
 * @param {(String)} Dest - Name of the file when it is extracted from the EXE.  
 * If a full path isn't used, Dest is assumed to start in {@link https://www.autohotkey.com/docs/v2/Variables.htm#WorkingDir|`A_WorkingDir`}.  
 * The destination directory *must* already exist.  
 * @param {(Integer)} [Overwrite] - If omitted, 0 is used.  
 * - `0` = Do not overwrite existing files. The operation fails.  
 * - `1` = Overwrite existing files.  
 * 
 * Other values are reserved for future use.  
 * @returns {(String)} An empty string is always returned.  
 * @throws {(Error)} - An exception is thrown on failure  
 * @throws {(Error)} - Any case where the file cannot be written to the destination  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/FileCopy.htm|`FileCopy()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/_Include.htm|`#Include`}
 * @example <caption>  
 * </caption>
 */
FileInstall(Source, Dest [, Overwrite:=0]) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/FileGetAttrib.htm|`FileGetAttrib()`} reports the attributes of a file or folder.  
 * @param {(String)} [Filename] - Name of the file to be appended.  
 * If a full path isn't used, Filename is assumed to start in {@link https://www.autohotkey.com/docs/v2/Variables.htm#WorkingDir|`A_WorkingDir`}.  
 * FileName can be omitted if inside a {@link https://www.autohotkey.com/docs/v2/lib/LoopRead.htm|`Loop-Files`} that's using an {@link https://www.autohotkey.com/docs/v2/lib/LoopRead.htm#OutputFile|`OutputFile`}.  
 * @returns {(String)} A string of all attributes found for file or direcotry.  
 * - Empty String = No file or folder was found.  
 * - `R` = ReadOnly  
 * - `A` = Archive  
 * - `S` = System  
 * - `H` = Hidden  
 * - `N` = Normal  
 * - `D` = Directory  
 * - `O` = Offline  
 * - `C` = Compressed  
 * - `T` = Temporary  
 * - `L` = REPARSE_POINT (typically a symbolic link)  
 * @throws {(OSError)} - Thrown on failure.  
 * {@link https://www.autohotkey.com/docs/v2/Variables.htm#LastError|`A_LastError`} is set to the result of the OS's GetLastError().  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/FileExist.htm|`FileExist()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/DirExist.htm|`DirExist()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileSetAttrib.htm|`FileSetAttrib()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileGetTime.htm|`FileGetTime()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileSetTime.htm|`FileSetTime()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileGetSize.htm|`FileGetSize()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileGetVersion.htm|`FileGetVersion()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/LoopFiles.htm|`Loop-Files`}
 * @example <caption>  
 * </caption>
 */
FileGetAttrib([Filename]) => String

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/FileGetShortcut.htm|`FileGetShortcut()`} retrieves information about a shortcut (.lnk) file, such as its target file.  
 * @param {(VarRef)} LinkFile - Name of the shortcut file to be analyzed. Include the `.lnk` ext.  
 * If a full path isn't used, LinkFile is assumed to start in {@link https://www.autohotkey.com/docs/v2/Variables.htm#WorkingDir|`A_WorkingDir`}.  
 * @param {(VarRef)} [OutFile] - Get target file of the shortcut.  
 * @param {(VarRef)} [OutDir] - Get LinkFile's working directory.  
 * @param {(VarRef)} [OutArgs] - Get function arguments for LinkFile.  
 * @param {(VarRef)} [OutDesc] - Get LinkFile's description.  
 * @param {(VarRef)} [OutIcon] - Get icon file for LinkFile.  
 * @param {(VarRef)} [OutIconNum] - Get the icon number used with the icon file.  
 * Normally, this is 1.  
 * @param {(VarRef)} [OutState] - Get window launch state of LinkFile.  
 * - `1` = Normal
 * - `3` = Maximized
 * - `7` = Minimized
 * @returns {(String)} An empty string is always returned.  
 * @throws {(OSError)} - Thrown on failure  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/FileCreateShortcut.htm|`FileCreateShortcut()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SplitPath.htm|`SplitPath()`}
 * @example <caption>  
 * </caption>
 */
FileGetShortcut(LinkFile [, &OutFile, &OutDir, &OutArgs, &OutDesc, &OutIcon, &OutIconNum, &OutState]) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/FileGetSize.htm|`FileGetSize()`} retrieves the size of a file.  
 * @param {(String)} [Filename] - Name of the file to get the size of.  
 * If a full path isn't used, Filename is assumed to start in {@link https://www.autohotkey.com/docs/v2/Variables.htm#WorkingDir|`A_WorkingDir`}.  
 * FileName can be omitted if inside a {@link https://www.autohotkey.com/docs/v2/lib/LoopRead.htm|`Loop-Files`} that's using an {@link https://www.autohotkey.com/docs/v2/lib/LoopRead.htm#OutputFile|`OutputFile`}.  
 * @param {(String)} [Units] - Unit type to return:  
 * - `B` or Omitted = Bytes
 * - `K` = Kilobytes
 * - `M` = Megabytes
 * @returns {(Integer)} The size of the specified file, rounded down to the nearest whole number.  
 * @throws {(OSError)} - Thrown on failure.  
 * {@link https://www.autohotkey.com/docs/v2/Variables.htm#LastError|`A_LastError`} is set to the result of the OS's GetLastError().  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/FileGetAttrib.htm|`FileGetAttrib()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileSetAttrib.htm|`FileSetAttrib()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileGetTime.htm|`FileGetTime()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileSetTime.htm|`FileSetTime()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileGetVersion.htm|`FileGetVersion()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/LoopFiles.htm|`Loop-Files`},
 * @example <caption>  
 * </caption>
 */
FileGetSize([Filename:=unset, Units:='B']) => Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/FileGetTime.htm|`FileGetTime()`} retrieves the datetime stamp of a file or folder.  
 * @param {(String)} [Filename] - Name of the file to get the size of.  
 * If a full path isn't used, Filename is assumed to start in {@link https://www.autohotkey.com/docs/v2/Variables.htm#WorkingDir|`A_WorkingDir`}.  
 * FileName can be omitted if inside a {@link https://www.autohotkey.com/docs/v2/lib/LoopRead.htm|`Loop-Files`} that's using an {@link https://www.autohotkey.com/docs/v2/lib/LoopRead.htm#OutputFile|`OutputFile`}.  
 * @param {(String)} [TimeType] - Speicfy which time type to change:  
 * - `M` or Omitted = Modification time
 * - `C` = Creation time
 * - `A` = Last Access time
 * @returns {(String)} Get file time in {@link https://www.autohotkey.com/docs/v2/lib/FileSetTime.htm#YYYYMMDD|`YYYYMMDDHH24MISS`} format.  
 * Time is in local time, not UTC/GMT.  
 * @throws {(OSError)} - Thrown on failure.  
 * {@link https://www.autohotkey.com/docs/v2/Variables.htm#LastError|`A_LastError`} is set to the result of the OS's GetLastError().  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/FileSetTime.htm|`FileSetTime()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FormatTime.htm|`FormatTime()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileGetAttrib.htm|`FileGetAttrib()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileSetAttrib.htm|`FileSetAttrib()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileGetSize.htm|`FileGetSize()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileGetVersion.htm|`FileGetVersion()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/DateAdd.htm|`DateAdd()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/DateDiff.htm|`DateDiff()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/LoopFiles.htm|`Loop-Files`}
 * @example <caption>  
 * </caption>
 */
FileGetTime([Filename:=unset, TimeType:='M']) => String

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/FileGetVersion.htm|`FileGetVersion()`} retrieves the version of a file.  
 * @param {(String)} [Filename] - Name of the file to get the version of.  
 * If a full path isn't used, this function uses the search sequence specified by the system {@link https://learn.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-loadlibrarya|`LoadLibrary`} function.  
 * FileName can be omitted if inside a {@link https://www.autohotkey.com/docs/v2/lib/LoopRead.htm|`Loop-Files`} that's using an {@link https://www.autohotkey.com/docs/v2/lib/LoopRead.htm#OutputFile|`OutputFile`}.  
 * @returns {(String)} Version number of the specified file
 * @throws {(OSError)} - Thrown on failure.  
 * {@link https://www.autohotkey.com/docs/v2/Variables.htm#LastError|`A_LastError`} is set to the result of the OS's GetLastError().  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/FileSetTime.htm|`FileSetTime()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileGetTime.htm|`FileGetTime()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileGetAttrib.htm|`FileGetAttrib()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileSetAttrib.htm|`FileSetAttrib()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileGetSize.htm|`FileGetSize()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/LoopFiles.htm|`Loop-Files`}
 * @example <caption>  
 * </caption>
 */
FileGetVersion([Filename]) => String

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/FileMove.htm|`FileMove()`} moves or renames one or more files.  
 * @param {(String)} SourcePattern - Name of a file or a wildcard `*` pattern.  
 * If a full path isn't used, SourcePattern is assumed to start in {@link https://www.autohotkey.com/docs/v2/Variables.htm#WorkingDir|`A_WorkingDir`}.  
 * @param {(String)} DestPattern - Name or pattern of the destination.  
 * If a full path isn't used, DestPattern is assumed to start in {@link https://www.autohotkey.com/docs/v2/Variables.htm#WorkingDir|`A_WorkingDir`}.  
 * An asterisk before the file ext dot will be replaced with the SourcePattern's file name.  
 * An asterisk after the file ext dot will be replaced with the SourcePattern's file ext.  
 * A simple 1:1 move retaining the original file names:
 * 
 *     FileMove('D:\Scripts\*.ahk', 'D:\Scripts\backup\*.*')
 * @param {(Integer)} [Overwrite]
 * - `0` = Do not overwrite existing files.  
 * - `1` = Overwrite existing files.  
 *   If DestPattern doesn't have a complimentary file/subfolder in SourcePattern, it will not be deleted.  
 * 
 * Other values are reserved for future use.  
 * @returns {(String)} An empty string is always returned.  
 * @throws {(Error)} - If any files failed to be moved.  
 * {@link https://www.autohotkey.com/docs/v2/lib/Error.htm#Extra|`Error.Extra`} is set to the number of failures.  
 * Patterns using broad matching with `?` and `*` do not error on match failure.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/FileCopy.htm|`FileCopy()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/DirCopy.htm|`DirCopy()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/DirMove.htm|`DirMove()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileDelete.htm|`FileDelete()`}
 * @example <caption>  
 * </caption>
 */
FileMove(SourcePattern, DestPattern [, Overwrite:=0]) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/FileOpen.htm|`FileOpen()`} opens a file to read specific content from it and/or to write new content into it.  
 * @param {(String)} Filename - The path of the file to open.  
 * If a full path isn't used, Filename is assumed to start in {@link https://www.autohotkey.com/docs/v2/Variables.htm#WorkingDir|`A_WorkingDir`}.  
 * To used stdin, stdout, or stderr:  
 * - `stdin` Standard In:
 * 
 *       FileOpen('*', 'r')`
 * - `stdout` Standard Out:
 * 
 *       FileOpen('*', 'w')
 * - `stderr` Error stream:  
 * 
 *       FileOpen('**', 'w')
 * @param {(String|Integer)} Flags - This can be either a string of flag characters or an integer sum of the desired options options.  
 * Integer can be decimal or hexidecimal.  
 * ### {@link https://www.autohotkey.com/docs/v2/lib/FileOpen.htm#Access_modes|Access modes (mutually-exclusive)}
 * - | Flag   | Dec# | Hex# | Description |
 *   | :---   | :--- | :--- | :--- |
 *   | r      | 0    | 0x0  | Read: Fails if the file doesn't exist. |
 *   | w      | 1    | 0x1  | Write: Create a new file, overwriting existing file. |
 *   | a      | 2    | 0x2  | Append: Create a new file, otherwise move file pointer to end of file. |
 *   | rw     | 3    | 0x3  | Read/Write: Creates a new file if the file didn't exist. |
 *   | h      |      |      | Indicates that Filename is a file handle to wrap in an object. {@link https://www.autohotkey.com/docs/v2/lib/FileOpen.htm#Access_modes|More info.}|
 * ### {@link https://www.autohotkey.com/docs/v2/lib/FileOpen.htm#Sharing_mode_flags|Sharing mode flags}
 * - | Flag   | Dec# | Hex# | Description |
 *   | :---   | :---- | :----- | :----- |
 *   | -rwd   |       |        | Locks the file for read, write and/or delete access. Any combination of r, w and d may be used. |
 *   | -      |       |        | Infers -rwd. |
 *   |        |0      | 0x0    | If Flags is numeric, the absence of sharing mode flags causes the file to be locked. |
 *   |        |256    | 0x100  | Shares read access. |
 *   |        |512    | 0x200  | Shares write access. |
 *   |        |1024   | 0x400  | Shares delete access. |
 * ### {@link https://www.autohotkey.com/docs/v2/lib/FileOpen.htm#EOL_options|End of line (EOL) options}
 * - | Flag   | Dec# | Hex# | Description |
 *   | :---   | :---- | :----- | :----- |
 *   | `n     | 4     | 0x4    | Reading: Replace `` `r`n `` with `` `n ``Writing: Replace `` `n `` with `r`n when writing. |
 *   | `r     | 8     | 0x8    | Replace standalone `r with `n when reading. |
 * @param {(String|Integer)} Encoding - One of the following values:  
 * - `Encoding` = Any of the {@link https://www.autohotkey.com/docs/v2/lib/FileEncoding.htm#Parameters|`FileEncoding()`} names.  
 *   - `CP0`: The system default ANSI code page.  
 *   - `UTF-8`: Unicode UTF-8 (equivalent to CP65001).  
 *   - `UTF-8-RAW`: UTF-8 but no byte order mark is written when a new file is created.  
 *   - `UTF-16`: Unicode UTF-16 with little endian byte order (CP1200).  
 *   - `UTF-16-RAW`: UTF-16 but no byte order mark is written when a new file is created.  
 *   - `CPnnn`: A code page with numeric identifier nnn. See {@link https://learn.microsoft.com/windows/win32/intl/code-page-identifiers|`Code Page Identifiers`}.  
 *   - `nnn`: A numeric code page identifier.  
 * - `RAW` = Write the Text bytes to the file as-is, without any conversion.  
 * - `` `n ``=  Inserts a carriage return `` `r `` before all linefeeds `` `n ``.  
 * @returns {(File)} A new {@link https://www.autohotkey.com/docs/v2/lib/File.htm|`File` object} to handle the file.  
 * A File object uses properties and methods to work with a text file.  
 * @throws {(OSError)} - The file cannot be opened  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/FileEncoding.htm|`FileEncoding()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileRead.htm|`FileRead()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/File.htm|`File Object`}
 * @example <caption>  
 * </caption>
 */
FileOpen(Filename, Flags [, Encoding]) => File

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/FileRead.htm|`FileRead()`} retrieves the contents of a file.  
 * @param {(String)} Filename - name of the file to read  
 * If a full path isn't used, Filename is assumed to start in {@link https://www.autohotkey.com/docs/v2/Variables.htm#WorkingDir|`A_WorkingDir`}.  
 * @param {(String)} [Options] - Zero or more options, separated by spaces/tabs
 * - `Encoding` = 
 *   - `CP0`: The system default ANSI code page.  
 *   - `UTF-8`: Unicode UTF-8 (equivalent to CP65001).  
 *   - `UTF-8-RAW`: UTF-8 but no byte order mark is written when a new file is created.  
 *   - `UTF-16`: Unicode UTF-16 with little endian byte order (CP1200).  
 *   - `UTF-16-RAW`: UTF-16 but no byte order mark is written when a new file is created.  
 *   - `CPnnn`: A code page with numeric identifier nnn. See {@link https://learn.microsoft.com/windows/win32/intl/code-page-identifiers|`Code Page Identifiers`}.  
 *   - `nnn`: A numeric code page identifier.  
 * - `m#` = Memory limitation where `#` is the number of bytes.  
 *   Only the leading part up to that amount is loaded from the file.  
 *   If omitted, the entire file is loaded
 * - `RAW` = Write the Text bytes to the file as-is, without any conversion.  
 * - `` `n ``=  Inserts a carriage return `` `r `` before all linefeeds `` `n ``.  
 * @returns {(String|Object)} Returns the contents of the of Filename.  
 * If the `RAW` option is used, a {@link https://www.autohotkey.com/docs/v2/lib/Buffer.htm|`Buffer` object} is returned.  
 * Otherwise, a string is returned.  
 * An empty string is returned if the file does not exist or cannot be opened.  
 * @throws {(OSError)} - Problem opening or reading the file  
 * @throws {(MemoryError)} - A file is greater than 4GB in size  
 * @throws {(MemoryError)} - The program is unable to allocate enough memory for the requested size  
 * {@link https://www.autohotkey.com/docs/v2/Variables.htm#LastError|`A_LastError`} is set to the result of the OS's GetLastError().  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/FileEncoding.htm|`FileEncoding()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileOpen.htm|`FileOpen()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileGetSize.htm|`FileGetSize()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileAppend.htm|`FileAppend()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/IniRead.htm|`IniRead()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Sort.htm|`Sort()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Download.htm|`Download()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/File.htm|`File Object`},
 * {@link https://www.autohotkey.com/docs/v2/lib/LoopRead.htm|`Loop-Files`}
 * @example <caption>  
 * </caption>
 */
FileRead(Filename [, Options]) => String | Object

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/FileRecycle.htm|`FileRecycle()`} sends a file or directory to the recycle bin if possible, or permanently deletes it.  
 * @param {(String)} FilePattern - Name of a file, a folder, or a wildcard `*` pattern.  
 * To recycle an entire directory, provide the name without a trailing backslash.  
 * If a full path isn't used, FilePattern is assumed to start in {@link https://www.autohotkey.com/docs/v2/Variables.htm#WorkingDir|`A_WorkingDir`}.  
 * @returns {(String)} An empty string is always returned.  
 * @throws {(Error)} - An exception is thrown on failure.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/FileRecycleEmpty.htm|`FileRecycleEmpty()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileDelete.htm|`FileDelete()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileCopy.htm|`FileCopy()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileMove.htm|`FileMove()`}
 * @example <caption>  
 * </caption>
 */
FileRecycle(FilePattern) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/FileRecycleEmpty.htm|`FileRecycleEmpty()`} empties the recycle bin.  
 * @param {(String)} [DriveLetter] - Drive letter followed by a colon. Backslash is optional.  
 * Omit DriveLetter to empty all drive recycle bins.  
 * @returns {(String)} An empty string is always returned.  
 * @throws {(OSError)} - Thrown on failure.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/FileRecycle.htm|`FileRecycle()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileDelete.htm|`FileDelete()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileCopy.htm|`FileCopy()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileMove.htm|`FileMove()`}
 * @example <caption>  
 * </caption>
 */
FileRecycleEmpty([DriveLetter:=unset]) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/FileSelect.htm|`FileSelect()`} displays a standard dialog that allows the user to open or save file(s).  
 * @param {(String|Integer)} [Options] - Zero or more options separted by spaces/tabs.  
 * - `0` = No options  
 *   Same as an empty string.
 * - `D` = Directory Select  
 *   Select a folder instead of a file.  
 *   The Filter param must be empty.
 * - `M` = Multi Select  
 *   More than one file can be selected via shift+click, alt+click, etc.
 * - `S` = Save Dialog  
 *   Changes the `Open` button to a `Save` button.
 * - Any sum of these number options:
 *   - `1` = File must exist.
 *   - `2` = Path must exist.
 *   - `8` = Prompt to create new file.
 *   - `16` = Propt to overwrite file.  
 *     Also forces `S` option.
 *   - `32` = Shortcuts are targeted instead of resolving to their target file.
 * @param {(String)} [RootOrFilename] - Root directory, filename, or both.  
 * - `Root` = A path to use as a starting directory for the dialog box.  
 *   If a full path isn't used, Root is assumed to start in {@link https://www.autohotkey.com/docs/v2/Variables.htm#WorkingDir|`A_WorkingDir`}.  
 * - `Filename` = Default text to show in the file name edit box.  
 *   This does not have to be a valid file name. Any text will show.  
 * - `Root\Filename` = Root directory followed by the default Filename: `Root\Filename.ext`  
 *   Root sets the starting directory. Everything past the last backslash populates the file name edit box.  
 *   Do not treat this as a full file path.
 * @param {(String)} [Title] - Title of the window.  
 * If omited, `'Select File - ' A_ScriptName` is used.  
 * @param {(String)} [Filter] - Restricts which file types to show.  
 * - Filter format:  
 * 
 *       FileSelect(,,, 'Text File (*.txt)')
 * - Multiple type format:  
 * 
 *       FileSelect(,,, 'AHK Script (*.ahk; *.ah2; *.ahk2)')
 * - Omit filter: If no filter is provided, All Files is used
 * 
 *       FileSelect(,,, 'All Files (*.*)')
 * @returns {(String|Array)} Returns the path of the select filed.  
 * A string of paths is returned if multi-select is in use.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/DirSelect.htm|`DirSelect()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/MsgBox.htm|`MsgBox()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/InputBox.htm|`InputBox()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/ToolTip.htm|`ToolTip()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SplitPath.htm|`SplitPath()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm|`GUI`},
 * {@link https://www.autohotkey.com/docs/v2/misc/CLSID-List.htm|`CLSID List`},
 * {@link https://www.autohotkey.com/docs/v2/lib/LoopParse.htm|`Loop-Parse`}
 * @example <caption>  
 * </caption>
 */
FileSelect([Options:=0, RootOrFilename:=, Title:='Select File - ' A_ScriptName, Filter:='']) => String | Array

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/FileSetAttrib.htm|`FileSetAttrib()`} changes the attributes of one or more files or folders. Wildcards are supported.  
 * @param {(String)} Attributes - Alter an attribute.  
 * Add `+`, remove `-`, or toggle `^` an attribute.  
 * - `R` = READONLY
 * - `A` = ARCHIVE
 * - `S` = SYSTEM
 * - `H` = HIDDEN
 * - `N` = NORMAL (Only works when used by itself)
 * - `O` = OFFLINE
 * - `T` = TEMPORARY
 * @param {(String)} [FilePattern] - Name of the file to get the version of.  
 * If a full path isn't used, FilePattern is assumed to start in {@link https://www.autohotkey.com/docs/v2/Variables.htm#WorkingDir|`A_WorkingDir`}.  
 * FilePattern can be omitted if inside a {@link https://www.autohotkey.com/docs/v2/lib/LoopRead.htm|`Loop-Files`} that's using an {@link https://www.autohotkey.com/docs/v2/lib/LoopRead.htm#OutputFile|`OutputFile`}.  
 * @param {(String)} [Mode]
 * - `D` = Directory. Includes folders  
 * - `F` = Files. Include files  
 * - `R` = Recurse. Recurses into all sub-folders  
 * @returns {(String)} An empty string is always returned.  
 * @throws {(Error)} - Any files failed to be changed.  
 * {@link https://www.autohotkey.com/docs/v2/lib/Error.htm#Extra|`Error.Extra`} is set to the number of failures.  
 * {@link https://www.autohotkey.com/docs/v2/Variables.htm#LastError|`A_LastError`} is set to 0 if files are found, otherwise it gets the OS's GetLastError().  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/FileGetAttrib.htm|`FileGetAttrib()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileGetTime.htm|`FileGetTime()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileSetTime.htm|`FileSetTime()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileGetSize.htm|`FileGetSize()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileGetVersion.htm|`FileGetVersion()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/LoopFiles.htm|`Loop-Files`}
 * @example <caption>  
 * </caption>
 */
FileSetAttrib(Attributes [, FilePattern:=unset, Mode:='F']) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/FileSetTime.htm|`FileSetTime()`} changes the datetime stamp of one or more files or folders. Wildcards are supported.  
 * @param {(String)} [DateTimeStamp] - A date-time in {@link https://www.autohotkey.com/docs/v2/lib/FileSetTime.htm#Remarks|YYYYMMDDHH24MISS} format.  
 * @param {(String)} [FilePattern] - Name of the file to change time of.  
 * If a full path isn't used, FilePattern is assumed to start in {@link https://www.autohotkey.com/docs/v2/Variables.htm#WorkingDir|`A_WorkingDir`}.  
 * FilePattern can be omitted if inside a {@link https://www.autohotkey.com/docs/v2/lib/LoopRead.htm|`Loop-Files`} that's using an {@link https://www.autohotkey.com/docs/v2/lib/LoopRead.htm#OutputFile|`OutputFile`}.  
 * @param {(String)} [TimeType] - Speicfy which time type to change:  
 * - `M` or Omitted = Modification time
 * - `C` = Creation time
 * - `A` = Last Access time
 * @param {(String)} [Mode]
 * - `D` = Directory. Includes folders  
 * - `F` = Files. Include files  
 * - `R` = Recurse. Recurses into all sub-folders  
 * @returns {(String)} An empty string is always returned.  
 * @throws {(Error)} - Any files failed to be changed.  
 * {@link https://www.autohotkey.com/docs/v2/lib/Error.htm#Extra|`Error.Extra`} is set to the number of failures.  
 * {@link https://www.autohotkey.com/docs/v2/Variables.htm#LastError|`A_LastError`} is set to 0 if files are found, otherwise it gets the OS's GetLastError().  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/FileGetTime.htm|`FileGetTime()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileGetAttrib.htm|`FileGetAttrib()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileSetAttrib.htm|`FileSetAttrib()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileGetSize.htm|`FileGetSize()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileGetVersion.htm|`FileGetVersion()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FormatTime.htm|`FormatTime()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/DateAdd.htm|`DateAdd()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/DateDiff.htm|`DateDiff()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/LoopFiles.htm|`Loop-Files`}
 * @example <caption>  
 * </caption>
 */
FileSetTime([DateTimeStamp:=A_Now, FilePattern:=unset, TimeType:='M', Mode:='F']) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/Math.htm#Floor|`Floor()`} returns the specified number rounded down to the nearest integer.  
 * @param {(Number)} Num - The number to round down.  
 * @returns {(Integer)} The floored value of Num.  
 * @example <caption>  
 * </caption>
 */
Floor(Num) => Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/Format.htm|`Format()`} takes in varaibles and creates custom-formatted string.  
 * Can be used to tranform data types, align, pad, prefix, or build entire strings.  
 * @param {(String)} FormStr - A string describing the desired new format.  
 * Any text can be used. Variables are inserted, and optionally altered, using a curly brace format.  
 * To use literal curly braces, wrap them in curly braces `{{}` `{}}`.  
 * `{ParamNum:NewForm}`  
 * - `ParamNum`  
 *   The `Value` parameter number, starting at 1.  
 *   If `Value1*` is an array, ParaNum is used as an index.  
 *   Omitting `ParamNum` will use parameter numbers in order. 1, 2, 3, ...  
 * 
 * - `NewForm` = A string made up of one or more options, in order, with no separators  
 *   `Flags Width .Precision StrCase DataType`  
 * 
 * ### Flags  
 * Alignment, prefix, padding, and display options:  
 * - `-` = Left align text within `Width`.  
 *   Empty areas are filled with spaces.  
 *   Right alignment is used when this flag is omitted.  
 * 
 *       Format('{1:-5}', 1) => '1    '
 * - `+` = Show positive sign.  
 * 
 *       Format('{1:+d}', 100) => '+100'
 * - `0` = Pad with zeroes.  
 *   The left align `-` flag overrides this flag.  
 * 
 *       Format('{1:+04}', 1) => '0001'
 * - ` ` Space = Add space if signed and positive.  
 *   The show positive sign `+` flag overrides this flag.  
 * 
 *       Format('{1: 04i}', 1) => ' 001'
 * - `#` = Show prefix or decimal  
 *   Dependant on `DataType`:  
 *   - `c` `d` `i` `u` `s` = No effect.  
 *   - `o` = Add octal `0` prefix.  
 * 
 *         Format('{1:#o}', 128) => '0200'
 *   - `x`/`X` = Add hex `0x`/`0X` prefix.  
 * 
 *         Format('{1:#x}', 255) => '0xff'
 *         Format("0x{1:X}", 1194684) => '0xABC123'
 *   - `e` `E` `f` `a` `A` = Force decimal point to show.  
 * 
 *         Format('{1:#.0f}', 10) => '10.'
 *   - `g` `G` = Force decimal point to show and trailing zeroes are not truncated.  
 * 
 *         Format('{1:g}', 4.2e01) => '42'
 *         Format('{1:#g}', 4.2e01) => '42.000'
 * 
 * ### Width  
 * - The expected width in characters after any changes are made.  
 *   Value is padded with spaces and right-aligned.  
 *   Use `-` flag to align left and `0` flag to pad with zeroes.  
 *
 *       Format('{1:7d}', 1234) => '   1234'
 *       Format('{1:-7d}', 1234) => '1234   '
 *       Format('{1:07d}', 1234) => '0001234'
 * 
 * ### .Precision 
 * - Precision of the value. The dot `.` is required.  
 *   Dependant on `DataType`:  
 *   - `f` `e` `E` = Set decimal point length.  
 *     Default: 6
 *
 *         Format('{1:.3f}', 0.123456) => '0.123'
 *         Format('{1:.0f}', 42) => '42.0'
 *   - `g` `G` = Sets max signficant digits.  
 *     Default: 6
 *
 *         Format('{1:.4g}', 123456) => '1235e+05'
 *   - `s` = Set max number of characters to use.  
 *
 *         Format('{1:.7s}', 'Hello World') => 'Hello W'
 *   - `d` `i` `u` `x` `X` `o` = Set width, pad with zeroes.  
 *     This will override `0` Flag + Width.  
 *     Default: 1
 * 
 *         Format('|{1:#.6x}|', 0xABC) => '0x000abc'
 *         Format('|{1:010.5d}|', 123) => '00123'
 * 
 * ### StrCase
 * Adjust the case type of a string.  
 * `DataType` must be `s`  
 * - `U` = STRING UPPERCASE.  
 * - `L` = string lowercase.  
 * - `T` = String Title Case.  
 * 
 * ### DataType
 * Set the type of `Value`:  
 * - Integer 
 *   - `d` `i` = Signed Decimal   
 * 
 *         Format('{1:d}', -1.5) => '1'
 *   - `u` = Unsigned Decimal  
 * 
 *         Format('{1:u}', -1.5) => '18446744073709551615'
 *   - `x` `X` = Unsigned Hexadecimal  
 *     Case of `x`/`X` sets hex case `abcdef`/`ABCDEF`
 * 
 *         Format('{1:x}', 1194684) => '123abc'
 *         Format('0x{1:X}', 1194684) => '0xABC123'
 *   - `o` = Unsigned Octal
 * 
 *         Format('{1:o}', 128) => '200'
 *   - `p` = Hexidecimal Address  
 *     Width is determined by pointer size.  
 * 
 *         Format('{:p}', 956887554989) => '000000DECAF15BAD' ; 64-bit
 *         Format('{:p}', 1194684) => '00123ABC' ; 32-bit
 * - Floating-point  
 *   Decimal length is set by `.Precision`  
 *   - `f` = Float  
 *     `[-]123456789.000000`  
 * 
 *         Format('{1:f}', 123) => '123.000000'
 *   - `e` `E` = Float with exponent  
 *     `[-]123456789.000000[eE][-+]000`  
 *     Exponent is always 2-3 digits.  
 *     `e`/`E` case sets exponent symbol case `e`/`E`  
 * 
 *         Format('{:e}', 12345.6789) => '1.234568e+04'
 *   - `g` `G` = General format  
 *     Uses `e` or `f` format, whichever is more compact.  
 *     `e` is used if exponent is less than e-4 or greater than .Preciion.  
 *     `g`/`G` case sets exponent symbol case `e`/`E`.  
 * 
 *         Format('{:.4g}', 0.0000042) => '4.2e-06'
 *         Format('{:.4g}', 1.2e+02) => '120'
 *   - `a` `A` = Hexadecimal double precision  
 *     `[-]0xFEDCBA987.654321[pP][-+]0`  
 *     Exponent is denoted with p/P as e/E is a hex value.  
 *     `a`/`A` case sets exponent symbol case `p`/`P`.  
 * 
 *         Format('{:A}', -255.8) => '-0x1.ff9999999999aP+7'
 * - String  
 *   - `s` String  
 *     Numeric values are converted to string.  
 *     `Width` affects total chars, adding spaces for padding
 *     `.Precision` determines number of chars to use from `ParamNum`
 * 
 *         Format('{2:.4s}{1:.6s}', 'Hotkey()', 'Automation') => 'AutoHotkey'  
 *   - `c` Character Code  
 *     Converts number to its ordinal value just like {@link https://www.autohotkey.com/docs/v2/lib/Chr.htm|`Chr()`}
 * 
 *         Format('{:c}{:c}{:c}', 65, 72, 75) => 'AHK'  
 *         Format('¯\_({1:c})_/¯', 0x30C4) => '¯\_(ツ)_/¯'  
 * @param {(Primitive|Array)} [Value1] - A primitive value.  
 * This is `ParamNum` 1, going up by one for each additional Value parameter.  
 * Value1 can be an array of primitives if declared {@link https://www.autohotkey.com/docs/v2/Functions.htm#VariadicCall|`variadic`}:
 * 
 *     arr := ['World', 'Hello']
 *     Format('{2}, {1}!', arr*) => 'Hello, World!'
 * @param {(Primitive)} [ValueN] - Any number of additional parameters containing primitive values.  
 * @returns {(String)} The string after formatting.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/FormatTime.htm|`FormatTime()`}
 * @example <caption>  
 * </caption>
 */
Format(FormStr [, Value1:=Any, ValueN:=Any]) => String

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/FormatTime.htm|`FormatTime()`} transforms a YYYYMMDDHH24MISS timestamp into the specified date/time format.  
 * @param {(String)} [DateTimeStamp] - All or the leading part of a {@link https://www.autohotkey.com/docs/v2/lib/FileSetTime.htm#YYYYMMDD|`YYYYMMDDHH24MISS`} date time stamp.  
 * If omitted, A_Now (the current DTS) is used.  
 * Any of the following options can be included after the date timestamp:
 * - `R` = Reverse. The time and date order when `Form` is blank.  
 * - `L#` = Set Locale, where `#` is a {@link https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-lcid/70feba9f-294e-491e-b6eb-56532684c37f|local identifier (LCID)}.  
 *   Use `LSys` to use the system locale.  
 *   If omitted, user's current locale is used.  
 * - `D#` = Date options, where `#` is one of the following numbers:
 *   - `0` = Force default options to be used. Short date is used.
 *   - `1` = Use short date. Incompatible with `D2` or `D8`. Only usable when `Form` is blank.  
 *   - `2` = Use long date. Incompatible with `D1` or `D8`. Only usable when `Form` is blank.  
 *   - `4` = Use alternate calendar (if any).  
 *   - `8` = User Year-Month format. Incompatible with `D1` or `D2`. Only usable when `Form` is blank.  
 *   - `0x10` = Add left-to-right reading order layout marks.
 *   - `0x20` = Add right-to-left reading order layout marks.
 *   - `0x40000000` = For string translation, use system ANSI code page instead of locale's code page.
 *   - `0x80000000` = Ignore all user overrides in effect for the system's default date format.  
 * - `T#` = Time options, where `#` is one of the following numbers:  
 *   - `0` = Force default options to be used. Minutes and seconds are shown.  
 *   - `1` = Omit minutes and seconds.  
 *   - `2` = Omit seconds.  
 *   - `4` = Omit time marker (AM/PM).  
 *   - `8` = Always use 24-hour time.  
 *   - `12` = Combination of options `4` and `8`.  
 *   - `0x40000000` = For string translation, use system ANSI code page instead of locale's code page.
 *   - `0x80000000` = Ignore all user overrides in effect for the system's default time format.  
 * @param {(String)} [Form] - The desired format.  
 * If omitted, `Time` + `LongDate` are used.  
 * To put literal text in the string without having it formatted should be enclosed in single quotes.  
 * To make a literal single quote, use two in a row `''`
 * 
 *       FormatTime(A_Now, "'Date:' MM/dd/yy 'Time:' hh:mm:ss tt") => 'Date: 12/03/23 Time: 05:03:58 PM'  
 * ### {@link https://www.autohotkey.com/docs/v2/lib/FormatTime.htm#Date_Formats|Date Formats}  
 * - `d` = Day of the month: `1-31`
 * - `dd` = 2 digit day of the month: `01-31`
 * - `ddd` = Day name abbr (based on language): `Sun-Sat`
 * - `dddd` = Day name (based on language): `Sunday-Saturday`
 * - `M` = Month of the year: `1-12`
 * - `MM` = 2 digit month of the year: `01-12`
 * - `MMM` = Month name abbr (based on language): `Jan-Dec`
 * - `MMMM` = Month name (based on language): `Januar-December`
 * - `y` = Year, no century: `0-99`
 * - `yy` = 2 digit year, no century: `00-99`
 * - `yyyy` = Full year: `1601-9999`
 * - `gg` = Period/era: `A.D.`
 * ### {@link https://www.autohotkey.com/docs/v2/lib/FormatTime.htm#Time_Formats|Time Formats}  
 * - `h` = 12 hour format: `1-12`
 * - `hh` = 2 digit 12 hour format: `01-12`
 * - `H` = 24 hour format: `0-23`
 * - `HH` = 2 digit 24 hour format: `00-23`
 * - `m` = Minutes: `0-59`
 * - `mm` = 2 digit minutes: `00-59`
 * - `s` = Seconds: `0-59`
 * - `ss` = 2 digit seconds: `00-59`
 * - `t` = Locale time marker abbr: `A-P`
 * - `tt` = Locale time marker full: `AM-PM`
 * ### {@link https://www.autohotkey.com/docs/v2/lib/FormatTime.htm#Standalone_Formats|Premade Formats}  
 * - Empty String = `Time` and `LongDate` are used:  
 * 
 *       FormatTime(v2_release) => '02:16 PM Monday, December 12, 2022'
 * - `Time` = Locale time  
 * 
 *       FormatTime(A_Now, 'Time') => '3:40 PM'
 * - `ShortDate` = Locale short date
 * 
 *       FormatTime(A_Now, 'ShortDate') => '11/30/2023'
 * - `LongDate` = Locale long date
 * 
 *       FormatTime(unix_epoch, 'LongDate') => 'Thursday, January 1, 1970'
 * - `YearMonth` = Month followed by year
 * 
 *       FormatTime(judge_day, 'YearMonth') => 'August 1977'
 * - `YDay` = Day of the year: 1-366
 * 
 *       FormatTime(heart_day, 'YDay') => '45'
 * - `YDay0` = 3-digit day of the year: 001-366
 * 
 *       FormatTime(heart_day, 'YDay0') => '045'
 * - `WDay` = Current day of the week.  
 *   1 = Sunday, 7 = Saturday
 * 
 *       FormatTime(hump_day, 'WDay') => '4'  
 * - `YWeek` = {@link https://www.rfc-editor.org/rfc/rfc3339#ref-ISO8601|ISO 8601} year/week YYYYWW number format.  
 *   The first week of January must have 4 days to be considered week 1.  
 *   Otherwise, that week is considered part of the prior year.  
 * 
 *       FormatTime(A_Now, 'YWeek') => '202348'
 * @returns {(String)} Formatted date timestamp.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/Format.htm|`Format()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileGetTime.htm|`FileGetTime()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm#DateTime|`Gui.DateTime`},
 * {@link https://www.autohotkey.com/docs/v2/Variables.htm#date|`Built-in Date and Time Variables`}
 * @example <caption>  
 * </caption>
 */
FormatTime([DateTimeStamp:=A_Now, Form:=unset]) => String

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/GetKeyName.htm|`GetKeyName()`} retrieves the name/text of a key.  
 * @param {(String)} KeyName - A key from the {@link https://www.autohotkey.com/docs/v2/KeyList.htm|`Key List`}.  
 * Or a virtual key `vkFF`, scan code `sc01D`, or combination of the two in hexadecimal format.  
 * 
 *     GetKeyName('vk1Bsc001') => 'Escape'
 * @returns {(String)} Name of the key  
 * An empty string is returned if the key is invalid or unnamed.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/GetKeyVK.htm|`GetKeyVK()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/GetKeySC.htm|`GetKeySC()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/GetKeyState.htm|`GetKeyState()`},
 * {@link https://www.autohotkey.com/docs/v2/KeyList.htm|`Key List`}
 * @example <caption>  
 * </caption>
 */
GetKeyName(KeyName) => String

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/GetKeyVK.htm|`GetKeyVK()`} retrieves the virtual key code of a key.  
 * @param {(String)} KeyName - A key from the {@link https://www.autohotkey.com/docs/v2/KeyList.htm|`Key List`}.  
 * Or a virtual key `vkFF`, scan code `sc01D`, or combination of the two in hexadecimal format.  
 * 
 *     GetKeyVK('Escape') => '27'
 * @returns {(Integer)} The virtual key code of the specified key.  
 * 0 is returned if key is invalid or has no virtual key code.  
 * Convert to hexadecimal to use with AHK functions like {@link https://www.autohotkey.com/docs/v2/lib/Hotkey.htm|`Hotkey()`} or {@link https://www.autohotkey.com/docs/v2/lib/GetKeyState.htm|`GetKeyState()`}.  
 * 
 *     Format('vk{:X}', GetKeyVK('Escape')) => 'vk1B'
 * @see {@link https://www.autohotkey.com/docs/v2/lib/GetKeySC.htm|`GetKeySC()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/GetKeyName.htm|`GetKeyName()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/GetKeyState.htm|`GetKeyState()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Format.htm|`Format()`},
 * {@link https://www.autohotkey.com/docs/v2/KeyList.htm|`Key List`}
 * @example <caption>  
 * </caption>
 */
GetKeyVK(KeyName) => Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/GetKeySC.htm|`GetKeySC()`} retrieves the scan code of a key.  
 * @param {(String)} KeyName - A key from the {@link https://www.autohotkey.com/docs/v2/KeyList.htm|`Key List`}.  
 * Or a virtual key `vkFF`, scan code `sc01D`, or combination of the two in hexadecimal format.  
 * 
 *     GetKeySC('Escape') => '1'
 * @returns {(Integer)} The scan code of the specified key.  
 * 0 is returned if key is invalid or has no scan code.  
 * Convert to hexadecimal to use with AHK functions like {@link https://www.autohotkey.com/docs/v2/lib/Hotkey.htm|`Hotkey()`} or {@link https://www.autohotkey.com/docs/v2/lib/GetKeyState.htm|`GetKeyState()`}.  
 * 
 *     Format('sc{:03X}', GetKeySC('Escape')) => 'sc001'
 * @see {@link https://www.autohotkey.com/docs/v2/lib/GetKeyVK.htm|`GetKeyVK()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/GetKeyName.htm|`GetKeyName()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/GetKeyState.htm|`GetKeyState()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Format.htm|`Format()`},
 * {@link https://www.autohotkey.com/docs/v2/KeyList.htm|`Key List`}
 * @example <caption>  
 * </caption>
 */
GetKeySC(KeyName) => Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/GetKeyState.htm|`GetKeyState()`} gets the physical, logical, or toggle status of keyboard keys, mouse buttons, and controller joys.  
 * @param {(String)} KeyName - A key from the {@link https://www.autohotkey.com/docs/v2/KeyList.htm|`Key List`}.  
 * Or a virtual key `vkFF`, scan code `sc01D`, or combination of the two in hexadecimal format.  
 * @param {(String)} [Mode] - The type of state to get.  
 * Mode is ignored when getting controller status.   
 * - Omitted = Get logical state of the key/button.  
 * - `P` = Physical  
 *   Check if key/button is physically held down.  
 *   Keys/buttons must be hooked for this to register.  
 * - `T` = Toggle  
 *   Get toggle status of `CapsLock`, `NumLock`, or `ScrollLock`.  
 * @returns {(Primitive)} 
 * - Key/button/joy:
 *   - `1` = Down/toggled on
 *   - `0` = Up/toggled off
 * - Controller Axis
 *   - `0-100` = Percent of range depressed.  
 * - Controller POV `0-35900`
 *   - `-1` = No angle to report
 *   - `0` = forward POV
 *   - `9000` = 90 degrees POV right
 *   - `18000` = 180 degrees POV backward
 *   - `27000` = 270 degrees POV left
 * - `JoyName` `JoyButtons` `JoyAxes` `JoyInfo`  
 *   Value varies. See {@link https://www.autohotkey.com/docs/v2/KeyList.htm#Controller|`Game Controllers`}.
 * @throws {(ValueError)} - An invalid parameter is detected.  
 * KeyName does not exist on the current keyboard.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/GetKeyVK.htm|`GetKeyVK()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/GetKeySC.htm|`GetKeySC()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/GetKeyName.htm|`GetKeyName()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/KeyWait.htm|`KeyWait()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/KeyHistory.htm|`KeyHistory()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/InstallKeybdHook.htm|`InstallKeybdHook()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/InstallMouseHook.htm|`InstallMouseHook()`}
 * {@link https://www.autohotkey.com/docs/v2/lib/_UseHook.htm|`#UseHook`},
 * {@link https://www.autohotkey.com/docs/v2/misc/RemapController.htm|`Controller remapping`},
 * {@link https://www.autohotkey.com/docs/v2/KeyList.htm|`Key List`},
 * @example <caption>  
 * </caption>
 */
GetKeyState(KeyName [, Mode]) => String

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/GetMethod.htm|`GetMethod()`} retrieves the implementation function of a method.  
 * @param {(Any)} Value - Any value except {@link https://www.autohotkey.com/docs/v2/lib/ComObject.htm|`ComObject`}.
 * @param {(String)} [Name] - Name of the method to retrieve.  
 * If omitted, validation is performed on the Value param and Value is returned if successful.  
 * @param {(Integer)} [ParamCount] - Number of parameters caller will be passing in.  
 * This value must not be less than {@link https://www.autohotkey.com/docs/v2/lib/Func.htm#MinParams|`Func.MinParams`} or greater than {@link https://www.autohotkey.com/docs/v2/lib/Func.htm#MaxParams|`Func.MaxParams`}.  
 * ParamCount should never include the hidden `this` param that all methods have.  
 * If omitted or paramcount failed, a basic check for a `Call()` method is done.
 * @returns {(FuncObj)} A function object containing a reference to the method.  
 * @throws {(MethodError)} - Method was not found or cannot be retrieved
 * @throws {(ValueError|MethodError)} - Validation failed
 * @see {@link https://www.autohotkey.com/docs/v2/Objects.htm|`Objects`},
 * {@link https://www.autohotkey.com/docs/v2/lib/HasMethod.htm|`HasMethod()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/HasBase.htm|`HasBase()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/HasProp.htm|`HasProp()`}
 * @example <caption>  
 * </caption>
 */
GetMethod(Value [, Name, ParamCount]) => Func

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/GroupActivate.htm|`GroupActivate()`} activates the next window in a {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_group|`Window Group`}.  
 * @param {(String)} GroupName - The name given to the group by {@link https://www.autohotkey.com/docs/v2/lib/GroupAdd.htm|`GroupAdd()`}.  
 * @param {(String)} [Mode] - Which window to activate.  
 * - Omit or Empty String = Activate the next window in the group.  
 * - `R` = Resume. If the current active window doesn't belong to the group, go back to the most recently active group window instead of going to the next.  
 * @returns {(Integer)} The {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_id|`HWND (handle)`} of the activated window is returned.  
 * `0` is returned if no window was found to activate or if the current active window is the only match.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/GroupAdd.htm|`GroupAdd()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/GroupDeactivate.htm|`GroupDeactivate()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/GroupClose.htm|`GroupClose()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/_WinActivateForce.htm|`#WinActivateForce`}
 * @example <caption>  
 * </caption>
 */
GroupActivate(GroupName [, Mode:='']) => Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/GroupAdd.htm|`GroupAdd()`} adds a window specification to a window group, creating the group if necessary.  
 * @param {(String)} GroupName - The name of the group to add the window ID.  
 * The group is created if it doesn't exist and GroupName is not case-sensitive.  
 * @param {(String|Integer|Object)} [WinTitle] - A string using a {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`} to match a window.  
 * Types: {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_exe|`ahk_exe`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_class|`ahk_class`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_id|`ahk_id`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_pid|`ahk_pid`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_group|`ahk_group`}  
 * If the string is the letter `A`, the current active window is used.  
 * If all `Win` params are omited, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#LastFoundWindow|`Last Found Window`} is used.  
 * @param {(String)} [WinText] - Text that must be found in the window.  
 * Use WindowSpy to view window text.  
 * @param {(String)} [NoWinTitle] - Window title does not contain this text.  
 * @param {(String)} [NoWinText] - Text that must not appear in the window.
 * Use WindowSpy to view window text.
 * @returns {(String)} An empty string is always returned.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/GroupActivate.htm|`GroupActivate()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/GroupDeactivate.htm|`GroupDeactivate()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/GroupClose.htm|`GroupClose()`}
 * @example <caption>  
 * </caption>
 */
GroupAdd(GroupName [, WinTitle:='', WinText:='', NoWinTitle:='', NoWinText:='']) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/GroupClose.htm|`GroupClose()`} close the current active group window or all group windows.  
 * The next window in the series is then activated.  
 * @param {(String)} GroupName - The name given to the group by {@link https://www.autohotkey.com/docs/v2/lib/GroupAdd.htm|`GroupAdd()`}.  
 * @param {(String)} [Mode] - Which window to close.  
 * - Empty String = Close the active window.  
 * - `R` = Resume. If the current active window doesn't belong to the group, go back to the most recently active group window instead closing it.  
 * - `A` = All. Closes all members of a group.  
 *   Same as: `WinClose('ahk_group GroupName')`
 * @returns {(String)} An empty string is always returned.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/GroupActivate.htm|`GroupActivate()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/GroupDeactivate.htm|`GroupDeactivate()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/GroupAdd.htm|`GroupAdd()`}
 * @example <caption>  
 * </caption>
 */
GroupClose(GroupName [, Mode:='']) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/GroupDeactivate.htm|`GroupDeactivate()`} activates the next window that does NOT belong to the group.  
 * @param {(String)} GroupName - The name given to the group by {@link https://www.autohotkey.com/docs/v2/lib/GroupAdd.htm|`GroupAdd()`}.  
 * @param {(String)} [Mode] - Which window to activate.  
 * - Empty String = Activate the next window that doesn't belong to the group.  
 * - `R` = Resume. If the current active window doesn't belong to the group, go back to the most recently active group window instead of going to the next.  
 * @returns {(String)} An empty string is always returned.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/GroupActivate.htm|`GroupActivate()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/GroupClose.htm|`GroupClose()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/GroupAdd.htm|`GroupAdd()`}
 * @example <caption>  
 * </caption>
 */
GroupDeactivate(GroupName [, Mode:='']) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/GuiCtrlFromHwnd.htm|`GuiCtrlFromHwnd()`} gets the {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm|`GuiControl object`} of a GUI control from its HWND.  
 * @param {(Integer)} Hwnd - The window handle (HWND) of an AHK GUI control or a child window of such a control.  
 * @returns {(Gui.Control|String)} A GuiControl object for the specified HWND.  
 * An empty string is returned if HWND is invalid or isn't for a GuiControl.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/GuiFromHwnd.htm|`GuiFromHwnd()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/ListView.htm|`ListView()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/TreeView.htm|`TreeView()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/MsgBox.htm|`MsgBox()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileSelect.htm|`FileSelect()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/DirSelect.htm|`DirSelect()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm|`Control Types`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Control.htm|`Control functions`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Menu.htm|`Menu object`},
 * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm|`GuiControl object`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm|`Gui object`}
 * @example <caption>  
 * </caption>
 */
GuiCtrlFromHwnd(Hwnd) => Gui.Control

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/GuiFromHwnd.htm|`GuiFromHwnd()`} retrieves the Gui object of a GUI window associated with the specified HWND.  
 * @param {(Integer)} Hwnd - The window handle (HWND) of an AHK GUI.  
 * If RecurseParent is true, Hwnd can be a child window of another AHK GUI.
 * @param {(Boolean)} [RecurseParent] - If true, Hwnd can be a child window which is not a GUI.  
 * GuiFromHwnd will search for the closest AHK GUI parent window and returns an object for it.  
 * @returns {(Gui|String)} The {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm|`Gui object`} that belongs to Hwnd.  
 * An empty string is returned if HWND is invalid or isn't for a Gui.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/GuiCtrlFromHwnd.htm|`GuiCtrlFromHwnd()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/ListView.htm|`ListView()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/TreeView.htm|`TreeView()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/MsgBox.htm|`MsgBox()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileSelect.htm|`FileSelect()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/DirSelect.htm|`DirSelect()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/GuiControls.htm|`Control Types`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Control.htm|`Control functions`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Menu.htm|`Menu object`},
 * {@link https://www.autohotkey.com/docs/v2/lib/GuiControl.htm|`GuiControl object`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm|`Gui object`}
 * @example <caption>  
 * </caption>
 */
GuiFromHwnd(Hwnd [, RecurseParent]) => Gui

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/HasBase.htm|`HasBase()`} returns a non-zero number if the specified value is derived from the specified base object.  
 * @param {(Any)} Value - Any value of any type.  
 * @param {(Object)} BaseObj - The object to check for in the inheritance chain of `Value`.  
 * @returns {(Boolean)} `1` if `BaseObj` is found in the inheritance chain of `Value`, otherwise `0`.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/Any.htm#GetBase|`ObjGetBase()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/HasMethod.htm|`HasMethod()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/HasProp.htm|`HasProp()`},
 * {@link https://www.autohotkey.com/docs/v2/Objects.htm|`Objects`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Object.htm#Base|`Obj.Base`}
 * @example <caption>  
 * </caption>
 */
HasBase(Value, BaseObj) => Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/HasMethod.htm|`HasMethod()`} returns a non-zero number if the specified value has a method by the specified name.  
 * @param {(Any)} Value - Any value of any type except ComObject.  
 * @param {(String)} [Name] - The method name to check for.  
 * If omitted, `Value` is checked to see if it is callable.  
 * @param {(Integer)} [ParamCount] - Number of parameters caller will be passing in.  
 * This value must not be less than {@link https://www.autohotkey.com/docs/v2/lib/Func.htm#MinParams|`Func.MinParams`} or greater than {@link https://www.autohotkey.com/docs/v2/lib/Func.htm#MaxParams|`Func.MaxParams`}.  
 * ParamCount should never include the hidden `this` param that all methods have.  
 * If omitted or paramcount failed, a basic check for a `Call()` method is done.
 * @returns {(Boolean)} `1` if method was found and passed validation, otherwise `0`
 * @see {@link https://www.autohotkey.com/docs/v2/lib/HasBase.htm|`HasBase()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/GetMethod.htm|`GetMethod()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/HasProp.htm|`HasProp()`},
 * {@link https://www.autohotkey.com/docs/v2/Objects.htm|`Objects`},
 * @example <caption>  
 * </caption>
 */
HasMethod(Value [, Name:=unset, ParamCount:=unset]) => Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/HasProp.htm|`HasProp()`} returns a non-zero number if the value passed in has a property by the specified name.  
 * @param {(Any)} Value - Any value of any type except ComObject.  
 * @param {(String)} [Name] - The property name to check for.  
 * @returns {(Boolean)} `1` if property was found, otherwise `0`
 * @see {@link https://www.autohotkey.com/docs/v2/lib/HasBase.htm|`HasBase()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/HasMethod.htm|`HasMethod()`},
 * {@link https://www.autohotkey.com/docs/v2/Objects.htm|`Objects`}
 * @example <caption>  
 * </caption>
 */
HasProp(Value, Name) => String

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/HotIf.htm|`HotIf()`} sets the criteria for when a subsequently created {@link https://www.autohotkey.com/docs/v2/lib/Hotkey.htm|`Hotkey()`}/{@link https://www.autohotkey.com/docs/v2/lib/Hotstring.htm|`Hotstring()`} is enabled or disabled.  
 * This works similarly to how {@link https://www.autohotkey.com/docs/v2/lib/_HotIf.htm|`#HotIf`} works with {@link https://www.autohotkey.com/docs/v2/Hotkeys.htm|`Hotkey::`}.  
 * All calls to Hotkey() or Hotstring() will resepct the last declared HotIf().  
 * @param {(String|FuncObj)} [ExpressionOrCallback] - Something that evaluates to true or false.  
 * When this evaluation returns true, the hotkey or hotstring is enabled and usable.  
 * - **Omitted**  
 *   Omitting this param resets any HotIf criteria and makes future hotkeys/hotstrings work globally.  
 * - **Expression**  
 *   A string expression that references an existing {@link https://www.autohotkey.com/docs/v2/lib/_HotIf.htm|`#HotIf`} expression.  
 *   If a `#HotIf` directive for that expression doesn't exist, a Callback should be used instead.  
 * - **Callback** (FuncObj)  
 *   A {@link https://www.autohotkey.com/docs/v2/misc/Functor.htm|`Function Object`} that returns a true or false statement.  
 *   The last parameter of the callback receives the hotkey/hotstring name and comes after any parameters provided by a {@link https://www.autohotkey.com/docs/v2/misc/Functor.htm#BoundFunc|`BoundFunc`}.  
 * 
 *       hotkey_callback(HotName)
 *       hotkey_callback(OtherParams, HotName)
 *   A {@link https://www.autohotkey.com/docs/v2/Variables.htm#fat-arrow|`fat-arrow`} callback can be used to quickly define a HotIf():
 * 
 *       HotIf((HotName) => some_func(HotName))
 * @returns {(String)} An empty string is always returned.  
 * @throws {(Error)} - A parameter is invalid.  
 * No matchine expression found or callback was invalid.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/Hotkey.htm|`Hotkey()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Hotstring.htm|`Hotstring()`},
 * {@link https://www.autohotkey.com/docs/v2/Hotkeys.htm|`Hotkey::`},
 * {@link https://www.autohotkey.com/docs/v2/Hotstrings.htm|`::Hotstring::`},
 * {@link https://www.autohotkey.com/docs/v2/lib/_HotIf.htm|`#HotIf`},
 * {@link https://www.autohotkey.com/docs/v2/misc/Threads.htm|`Threads`},
 * @example <caption>  
 * </caption>
 */
HotIf([ExpressionOrCallback]) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/HotIf.htm|`HotIfWinActive()`} controls when a subsequently created {@link https://www.autohotkey.com/docs/v2/lib/Hotkey.htm|`Hotkey()`}/{@link https://www.autohotkey.com/docs/v2/lib/Hotstring.htm|`Hotstring()`} is enabled or disabled based on a specific window being active.  
 * @param {(String)} [WinTitle] - A string using a {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`} to match a window.  
 * Types: {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_exe|`ahk_exe`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_class|`ahk_class`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_id|`ahk_id`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_pid|`ahk_pid`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_group|`ahk_group`}  
 * If the string is the letter `A`, the current active window is used.  
 * Omitting both params resets any HotIf criteria and makes future hotkeys/hotstrings work globally.  
 * @param {(String)} [WinText] - Text that must be found in the window.  
 * Use WindowSpy to view window text.  
 * @returns {(String)} An empty string is always returned.  
 * @throws {(Error)} - A parameter is invalid.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/Hotkey.htm|`Hotkey()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Hotstring.htm|`Hotstring()`},
 * {@link https://www.autohotkey.com/docs/v2/Hotkeys.htm|`Hotkey::`},
 * {@link https://www.autohotkey.com/docs/v2/Hotstrings.htm|`::Hotstring::`},
 * {@link https://www.autohotkey.com/docs/v2/lib/_HotIf.htm|`#HotIf`},
 * {@link https://www.autohotkey.com/docs/v2/misc/Threads.htm|`Threads`},
 * @example <caption>  
 * </caption>
 */
HotIfWinActive([WinTitle:='', WinText:='']) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/HotIf.htm|`HotIfWinExist()`} controls when a subsequently created {@link https://www.autohotkey.com/docs/v2/lib/Hotkey.htm|`Hotkey()`}/{@link https://www.autohotkey.com/docs/v2/lib/Hotstring.htm|`Hotstring()`} is enabled or disabled based on a specific window existing.  
 * @param {(String)} [WinTitle] - A string using a {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`} to match a window.  
 * Types: {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_exe|`ahk_exe`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_class|`ahk_class`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_id|`ahk_id`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_pid|`ahk_pid`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_group|`ahk_group`}  
 * If the string is the letter `A`, the current active window is used.  
 * Omitting both params resets any HotIf criteria and makes future hotkeys/hotstrings work globally.  
 * @param {(String)} [WinText] - Text that must be found in the window.  
 * Use WindowSpy to view window text.  
 * @returns {(String)} An empty string is always returned.  
 * @throws {(Error)} - A parameter is invalid.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/Hotkey.htm|`Hotkey()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Hotstring.htm|`Hotstring()`},
 * {@link https://www.autohotkey.com/docs/v2/Hotkeys.htm|`Hotkey::`},
 * {@link https://www.autohotkey.com/docs/v2/Hotstrings.htm|`::Hotstring::`},
 * {@link https://www.autohotkey.com/docs/v2/lib/_HotIf.htm|`#HotIf`},
 * {@link https://www.autohotkey.com/docs/v2/misc/Threads.htm|`Threads`},
 * @example <caption>  
 * </caption>
 */
HotIfWinExist([WinTitle:='', WinText:='']) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/HotIf.htm|`HotIfWinNotActive()`} controls when a subsequently created {@link https://www.autohotkey.com/docs/v2/lib/Hotkey.htm|`Hotkey()`}/{@link https://www.autohotkey.com/docs/v2/lib/Hotstring.htm|`Hotstring()`} is enabled or disabled based on a specific window not being active.  
 * @param {(String)} [WinTitle] - A string using a {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`} to match a window.  
 * Types: {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_exe|`ahk_exe`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_class|`ahk_class`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_id|`ahk_id`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_pid|`ahk_pid`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_group|`ahk_group`}  
 * If the string is the letter `A`, the current active window is used.  
 * Omitting both params resets any HotIf criteria and makes future hotkeys/hotstrings work globally.  
 * @param {(String)} [WinText] - Text that must be found in the window.  
 * Use WindowSpy to view window text.  
 * @returns {(String)} An empty string is always returned.  
 * @throws {(Error)} - A parameter is invalid.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/Hotkey.htm|`Hotkey()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Hotstring.htm|`Hotstring()`},
 * {@link https://www.autohotkey.com/docs/v2/Hotkeys.htm|`Hotkey::`},
 * {@link https://www.autohotkey.com/docs/v2/Hotstrings.htm|`::Hotstring::`},
 * {@link https://www.autohotkey.com/docs/v2/lib/_HotIf.htm|`#HotIf`},
 * {@link https://www.autohotkey.com/docs/v2/misc/Threads.htm|`Threads`},
 * @example <caption>  
 * </caption>
 */
HotIfWinNotActive([WinTitle:='', WinText:='']) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/HotIf.htm|`HotIfWinNotExist()`} controls when a subsequently created {@link https://www.autohotkey.com/docs/v2/lib/Hotkey.htm|`Hotkey()`}/{@link https://www.autohotkey.com/docs/v2/lib/Hotstring.htm|`Hotstring()`} is enabled or disabled based on a specific window not existing.  
 * @param {(String)} [WinTitle] - A string using a {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`} to match a window.  
 * Types: {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_exe|`ahk_exe`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_class|`ahk_class`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_id|`ahk_id`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_pid|`ahk_pid`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_group|`ahk_group`}  
 * If the string is the letter `A`, the current active window is used.  
 * Omitting both params resets any HotIf criteria and makes future hotkeys/hotstrings work globally.  
 * @param {(String)} [WinText] - Text that must be found in the window.  
 * Use WindowSpy to view window text.  
 * @returns {(String)} An empty string is always returned.  
 * @throws {(Error)} - A parameter is invalid.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/Hotkey.htm|`Hotkey()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Hotstring.htm|`Hotstring()`},
 * {@link https://www.autohotkey.com/docs/v2/Hotkeys.htm|`Hotkey::`},
 * {@link https://www.autohotkey.com/docs/v2/Hotstrings.htm|`::Hotstring::`},
 * {@link https://www.autohotkey.com/docs/v2/lib/_HotIf.htm|`#HotIf`},
 * {@link https://www.autohotkey.com/docs/v2/misc/Threads.htm|`Threads`},
 * @example <caption>  
 * </caption>
 */
HotIfWinNotExist([WinTitle:='', WinText:='']) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/Hotkey.htm|`Hotkey()`} creates, modifies, enables, or disables a hotkey.  
 * @param {(String)} KeyName - A {@link https://www.autohotkey.com/docs/v2/KeyList.htm|`key name`}, including any {@link https://www.autohotkey.com/docs/v2/Hotkeys.htm#Symbols|`modifier symbols`}.  
 * If `KeyName` is already declared, the old hotkey is replaced with the new one.  
 * Modifier order doesn't matter but `KeyName` must match the original spelling. `Escape` won't replace `Esc`.  
 * **Modifier Symbols**  
 * - `#` = {@link https://www.autohotkey.com/docs/v2/Hotkeys.htm|`Window key`}  
 * - `!` = {@link https://www.autohotkey.com/docs/v2/Hotkeys.htm|`Alt key`}  
 * - `^` = {@link https://www.autohotkey.com/docs/v2/Hotkeys.htm|`Control key`}  
 * - `+` = {@link https://www.autohotkey.com/docs/v2/Hotkeys.htm|`Shift key`}  
 * - `<` = Use {@link https://www.autohotkey.com/docs/v2/Hotkeys.htm#LeftRight|`left side key`} of a key pair  
 *   `LAlt`, `LShift`, `LControl`, `LWin`
 * - `>` = Use {@link https://www.autohotkey.com/docs/v2/Hotkeys.htm#LeftRight|`right side key`} of a key pair  
 *   `RAlt`, `RShift`, `RControl`, `RWin`
 * - `<^>!` = The {@link https://www.autohotkey.com/docs/v2/Hotkeys.htm#AltGr|`AltGr`} key. AKA: AltGraphic, AltGraph  
 *   Windows usually sees this as `Ctrl+Alt`  
 * - `$` = {@link https://www.autohotkey.com/docs/v2/Hotkeys.htmprefixdollar|`Hook`} hotkey to prevent {@link https://www.autohotkey.com/docs/v2/lib/Send.htm|`Send()`} from activating this hotkey.  
 *   Mouse button hotkeys are automatically hooked.  
 * - `*` = {@link https://www.autohotkey.com/docs/v2/Hotkeys.htm#wildcard|`Wildcard`} allows hotkey activation even if other keys are being held  
 *   This option hooks the hotkey  
 * - `~` = {@link https://www.autohotkey.com/docs/v2/Hotkeys.htm#Tilde|`Send hotkey`} keystroke before running the hotkey `Action`  
 *   This option hooks the hotkey  
 * - `&` = Create a 2-key {@link https://www.autohotkey.com/docs/v2/Hotkeys.htm#combo|`Custom Combination`}
 *   This option hooks the hotkey  
 * - `Up` = Hotkey activates on release instead of on press.  
 *   The word `Up` must be 
 *   This option hooks the hotkey  
 * @param {(FuncObj|String)} [Action] - The action to take on hotkey activation.  
 * This can be a callback, the name of a {@link https://www.autohotkey.com/docs/v2/Hotkeys.htm|`Hotkey::`}, or one of the following keywords:  
 * - `On` = The hotkey becomes enabled  
 * - `Off` = The hotkey becomes disabled  
 * - `Toggle` = The hotkey is switched between enabled and disabled  
 * - Special {@link https://www.autohotkey.com/docs/v2/Hotkeys.htm#alttab|`AltTab`} options:  
 *   - `AltTab` = Move AltTab menu selection forward if shown, otherwise show menu  
 *     Only works with hotkeys using two keys  
 *   - `ShiftAltTab` = Move AltTab menu selection backward if shown, otherwise show menu  
 *     Only works with hotkeys using two keys  
 *   - `AltTabMenu` = Show or hide AltTab menu  
 *   - `AltTabAndMenu` = Move AltTab menu selection forward if shown, otherwise show menu  
 *   - `AltTabMenuDismiss` = Close the AltTab menu  
 * 
 * `Action` can be omitted when only updating a hotkey's `Options` parameter.  
 * @param {(String)} [Options] - Zero or more of the following options. Space separators are optional.  
 * - `On` = Enable hotkey
 * - `Off` =  Disable hotkey
 * - `B` = Buffers hotkey as described in {@link https://www.autohotkey.com/docs/v2/lib/_MaxThreadsBuffer.htm|`#MaxThreadsBuffer`}  
 *   Use `B0` to disable this
 * - `P#` = Set Priority of hotkey where `#` is the {@link https://www.autohotkey.com/docs/v2/misc/Threads.htm|`thread priority number`}  
 *   The default of is `P0`
 * - `S` = Gives the hotkey {@link https://www.autohotkey.com/docs/v2/lib/_SuspendExempt.htm|exemption} from {@link https://www.autohotkey.com/docs/v2/lib/Suspend.htm|`Suspend()`}  
 *   Use `S0` to disable exemption
 * - `T#` = Set Thread number, where `#` is the max number of thread to allow
 * - `I#` = Set Input level, where `#` is the hotkey's {@link https://www.autohotkey.com/docs/v2/lib/_InputLevel.htm|`input level`}
 * @returns {(String)} An empty string is always returned.  
 * @throws {(ValueError)} - Invalid key name
 * @throws {(ValueError)} - Unsupported prefix key
 * @throws {(ValueError)} - AltTab hotkey must have exactly one modifier/prefix
 * @throws {(ValueError)} - SltTab hotkey must specify a Left or Right side key
 * @throws {(TargetError)} - Nonexistent hotkey
 * @throws {(TargetError)} - Nonexistent hotkey variant
 * @throws {(Error)} - Max amount of hotkeys created
 * @see {@link https://www.autohotkey.com/docs/v2/lib/HotIf.htm|`HotIf()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Suspend.htm|`Suspend()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Thread.htm|`Thread()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Critical.htm|`Critical()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SetTimer.htm|`SetTimer()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Return.htm|`Return`},
 * {@link https://www.autohotkey.com/docs/v2/misc/Threads.htm|`Threads`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Menu.htm|`Menu object`},
 * {@link https://www.autohotkey.com/docs/v2/Variables.htm#ThisHotkey|`A_ThisHotkey`},
 * {@link https://www.autohotkey.com/docs/v2/Hotkeys.htm#Symbols|`Hotkey Symbols`},
 * {@link https://www.autohotkey.com/docs/v2/lib/_MaxThreadsBuffer.htm|`#MaxThreadsBuffer`},
 * {@link https://www.autohotkey.com/docs/v2/lib/_MaxThreadsPerHotkey.htm|`#MaxThreadsPerHotkey`}
 * @example <caption>  
 * </caption>
 */
Hotkey(KeyName [, Action, Options]) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/Hotstring.htm|`Hotstring()`} creates, modifies, enables, or disables a hotstring.  
 * The case used to type the hotstring (UPPERCASE, lowercase, Title Case) carries over to the auto-replce text.
 * @param {(String)} Option  
 * - Hotstring = The trigger string and options for a hotstring, using the {@link https://www.autohotkey.com/docs/v2/Hotstrings.htm|`::Hotstring`} format.  
 *   This creates (or updates an already existing) hotstring.  
 *   Options should be placed between the double colons `::` and are listed below in the `NewOptions` section  
 * 
 *       ; Typing '/new' inserts #Requires and a kill switch to a new script
 *       Hotstring(':?*:/new', '{#}Requires AutoHotkey v2.0{+}`n*Esc::ExitApp()')
 *       ; Typing '!quit!' exits the script
 *       Hotstring(':?*X:!quit!', (*) => ExitApp())
 * - {@link https://www.autohotkey.com/docs/v2/lib/Hotstring.htm#EndChars|`"EndChars"`} = Set or get the string of ending characters used by hotstrings. See `Value` param.  
 * - {@link https://www.autohotkey.com/docs/v2/lib/Hotstring.htm#MouseReset|`"MouseReset"`} = Set or get the current setting for mouse clicks resetting the hotstring recognizer. See `Value` param.  
 * - {@link https://www.autohotkey.com/docs/v2/lib/Hotstring.htm#Reset|`"Reset"`} = Immediately reset the hotstring recognizer.  
 * - NewOptions = A string of {@link https://www.autohotkey.com/docs/v2/Hotstrings.htm#Options|`hotstring options`} to set as the new default for future hotstrings.  
 *   An example of each option can be found in the example section  
 *   - `*` = {@link https://www.autohotkey.com/docs/v2/Hotstrings.htm#Asterisk|`Wildcard`}. Hotstring fires as soon as a match is made, without the need of an {@link https://www.autohotkey.com/docs/v2/Hotstrings.htm#EndChars|`EndChar`}.  
 *   - `?` = {@link https://www.autohotkey.com/docs/v2/Hotstrings.htm#Question|`Verbatim`}. Hotstring fires whenever it is typed, including while inside another word  
 *   - `B0` = {@link https://www.autohotkey.com/docs/v2/Hotstrings.htm#b0|`Backspacing`} disable. The replacement text from `Value` is sent without deleting the hotstring  
 *     To re-enabled backspacing, use `B`  
 *   - `C` = {@link https://www.autohotkey.com/docs/v2/Hotstrings.htm#C|`Case-sensitive hotstring`}. A hotstring must be typed exactly as defined to be activated.  
 *     This can be disabled using `C0`.  
 *   - `C1` = {@link https://www.autohotkey.com/docs/v2/Hotstrings.htm#C1|`Case mirroring`} disable. The {@link https://www.autohotkey.com/docs/v2/Hotstrings.htm#auto|`auto-replace`} text is sent **exactly** as typed.  
 *     This overrides the default behavior where typing a hotstring in a certain case (UPPERCASE or Title Case) causes the a lowercase replacement text to conform to that case type.  
 *     Case mirroring can be enabled using `C0`.  
 *   - `K#` = {@link https://www.autohotkey.com/docs/v2/Hotstrings.htm#Kn|`Key-delay`}. Sets delay between {@link https://www.autohotkey.com/docs/v2/Hotstrings.htm#auto|`auto-replace`} keystrokes, where `#` is the time in ms or `-1` for no delay  
 *     This delay includes the keystrokes for backspacing the hotstring text.  
 *     The {@link https://www.autohotkey.com/docs/v2/Hotstrings.htm#SendMode|`send mode`} affects Key-Delay behavior:  
 *     - `SE` SendEvent = Sets the delay between keystrokes  
 *     - `SP` SendPlay = Sets the {@link https://www.autohotkey.com/docs/v2/lib/SetKeyDelay.htm#dur|`press duration`} of each keystroke, but not the delay between them  
 *     - `SI` SendInput = Key-delay can only affect SendInput when it's in {@link https://www.autohotkey.com/docs/v2/lib/Send.htm#SendInputUnavail|`unavailable mode`} because it defaults to SendEvent mode.  
 *   - `O` = {@link https://www.autohotkey.com/docs/v2/Hotstrings.htm#O|`Omit`}. The {@link https://www.autohotkey.com/docs/v2/Hotstrings.htm#EndChars|`EndChar`} of an {@link https://www.autohotkey.com/docs/v2/Hotstrings.htm#auto|`auto-replace hotstring`} is omitted  
 *   - `P#` = {@link https://www.autohotkey.com/docs/v2/Hotstrings.htm#Pn|`Priority`}. Set the {@link https://www.autohotkey.com/docs/v2/misc/Threads.htm|`priority`} level of the hotstring, where `#` is the level number  
 *     This has no affect on {@link https://www.autohotkey.com/docs/v2/Hotstrings.htm#auto|`auto-replace hotstring`} and is rarely used.  
 *   - `S` = {@link https://www.autohotkey.com/docs/v2/Hotstrings.htm#SuspendExempt|`Suspend`}. Makes the hotstring {@link https://www.autohotkey.com/docs/v2/lib/_SuspendExempt.htm|`exempt`} from {@link https://www.autohotkey.com/docs/v2/lib/Suspend.htm|`Suspend()`}  
 *     Use `S1` to disable this setting, making Suspend() affect this hotstring  
 *   - `SI` `SE` `SP` = {@link https://www.autohotkey.com/docs/v2/Hotstrings.htm#SendMode|`Send mode`}. Choose between {@link https://www.autohotkey.com/docs/v2/lib/Send.htm#SendInputDetail|`SendInput`}, {@link https://www.autohotkey.com/docs/v2/lib/Send.htm#SendEvent|`SendEvent`}, and {@link https://www.autohotkey.com/docs/v2/lib/Send.htm#SendPlayDetail|`SendPlay`}  
 *   - `T` `R` = {@link https://www.autohotkey.com/docs/v2/Hotstrings.htm#T|`Text`} / {@link https://www.autohotkey.com/docs/v2/Hotstrings.htm#raw|`Raw`} mode. {@link https://www.autohotkey.com/docs/v2/Hotstrings.htm#auto|`Auto-replace hotstrings`} are not converted and all keystrokes are sent as typed  
 *     {@link https://www.autohotkey.com/docs/v2/misc/EscapeChar.htm|Escape sequences} still work and must be escaped using ``` `` ```  
 *     [`{Text} mode`](https://www.autohotkey.com/docs/v2/lib/Send.htm#Text) is similar to [`{RAW} mode`](https://www.autohotkey.com/docs/v2/lib/Send.htm#Raw), but no attempt is made to translate characters (other than `` `n ``, `` `r ``, `` `t ``, and `` `b ``)  
 *     `T0` and `R0` can be used to disable these modes.  
 *     Text may be more reliable than Raw  
 *   - `X` = {@link https://www.autohotkey.com/docs/v2/Hotstrings.htm#X|`Execute`}. Instead of replacement text, `Value` is treated as AHK code  
 *     This allows hotstrings to activate code just like a hotkey  
 *   - `Z` = {@link https://www.autohotkey.com/docs/v2/Hotstrings.htm#z|`Zeroize`}. When the hotstring fires, the hotstring recognizer is reset.  
 *     All previous keystrokes are cleared, preventing them from being considered as the start of other hotstrings.  
 * @param {(String|FuncObj)} [Value] - Depends on the current `Option` being used.  
 * - `Hotstring` = The hotstring's replacement text or code to run (`X` option).  
 *   This param can be omitted when working with the `Enabled` param.  
 * - `"EndChars"` = The string of characters to use as hotstring ending chars.  
 *   If omitted, a string of the current `EndChars` are returned by the function.  
 * - `"MouseReset"` = Set `Value` to `1` to enable and `0` to disable.  
 *   If omitted, the current `MouseReset` setting is returned by the function.  
 * - `NewOptions` = The `Value` param isn't with this option.  
 * - `"Reset"` = The `Value` param isn't with this option.  
 * @param {(String|Integer)} [Enabled] - Only used with the hotstring `Option`.  
 * Sets the enable state of a hotstring
 * - `1` = Enable hotstring
 * - `0` = Disable hotstring
 * - `-1` `Toggle` = Switch state between enabled and disabled.
 * @returns {(String|Integer)} If using `"EndChars"` without the `Value` param, a string of ending characters is returned.  
 * If using `"MouseReset"` without a `Value` param, a `1` is returned for on, otherwise `0`.  
 * An empty string is returned for everything else.  
 * @throws {(Error)} - A parameter is invalid or memory allocation failed.  
 * @throws {(TargetError)} - `Option` was a hotstring that hasn't previously been declared and `Value` was omitted.  
 * The only time a hotstring value is omitted is when `Enabled` is being altered.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/Suspend.htm|`Suspend()`},
  * {@link https://www.autohotkey.com/docs/v2/lib/Thread.htm|`Thread()`},
  * {@link https://www.autohotkey.com/docs/v2/lib/Critical.htm|`Critical()`},
  * {@link https://www.autohotkey.com/docs/v2/Hotstrings.htm|`::Hotstring::`},
  * {@link https://www.autohotkey.com/docs/v2/Variables.htm#ThisHotkey|`A_ThisHotkey`},
  * {@link https://www.autohotkey.com/docs/v2/lib/_MaxThreadsPerHotkey.htm|`#MaxThreadsPerHotkey`},
  * {@link https://www.autohotkey.com/docs/v2/misc/Threads.htm|`Threads`},
  * {@link https://www.autohotkey.com/docs/v2/lib/_HotIf.htm|`#HotIf`}
 * @example <caption>  
 * Option Examples</caption>
 * ; * Wildcard
 * ; Typing 'ahk' produces 'AutoHotkey' without needing an EndChar
 * Hotstring(':*:ahk', 'AutoHotkey')
 * 
 * ; ? Verbatim
 * ; Typing 'AutoHotkey ' produces 'AutoHotstring '
 * Hotstring(':?:key', 'string')
 * 
 * ; B0 Backspacing (disable): 
 * ; Typing 'for ' doesn't erase the word 'for '
 * ; 'For' is included as part of the desired replacement
 * Hotstring(':B0:for', 'key, value in object')
 * 
 * ; C Case-sensitive hotstrings
 * ; Typing 'ABC ' activates hotstring but 'abc ' does not  
 * Hotstring(':C:ABC', 'ALL CAPS')
 * 
 * ; C1 Case mirroring (disable)
 * ; 'Case ' and 'CASE ' produce 'test '
 * ; Normally, 'Case ' and 'CASE ' would produce 'Test ' and 'TEST '
 * Hotstring(':C1:CASE', 'test')
 * 
 * ; K# Key delay
 * ; Puts a 1/2 second pause between each keystroke  
 * Hotstring(':SE k500:sek', 'event')
 * ; Each keystroke is held down for 1/2 a second
 * Hotstring(':SP k500:spk', 'play')
 * ; Puts a 1/2 second pause between each keystroke when in unavailable mode
 * Hotstring(':SI k500:sik', 'input')
 * 
 * ; O Omit
 * ; Typing '{esc.' produces '{Escape}', ignoring the end char
 * Hotstring(':O:`{esc', '{{}Escape{}}')
 * 
 * ; P Priority
 * ; Typing '/kill' immediately exits the script  
 * Hotstring(':XP100?*:/kill', (*) => ExitApp())
 * 
 * ; S Suspend exemption
 * ; Typing '/suspend' can turn suspension both on and off
 * ; Without S, it could not turn off suspend as the hotstring would be suspended
 * Hotstring(':SX*:/suspend', (*) => Suspend())
 * 
 * ; T Text Mode
 * ; Typing '{esc ' produces '{Escape} ' instead of sending the Escape keystroke
 * Hotstring(':T:{esc', '{Escape}')
 * 
 * ; X Execution 
 * ; Typing 'greet ' calls a boundfunc
 * Hotstring(':X:greet', (*) => MsgBox('Hello'))
 * 
 * ; Z Zeroize
 * ; Typing 'zz' produces 'zz00z' instead of 'zz00z00'
 * ; The recognizer is reset preventing the last z from acting as the first z of another hotstring
 * Hotstring(':B0*?XZ:zz', (*) => Send('00'))
 */
Hotstring(Option [, Value, Enabled]) => String | Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/ListView.htm#IL_Create|`IL_Create()`} creates a new ImageList that is initially empty.
 * @param {(Integer)} [InitialCount] - The intial size of the list. Later, this can expand as needed.  
 * The default value is 2.  
 * @param {(Integer)} [GrowCount] - The amount of additional slots to add when list expansion is needed.  
 * The default value is 5.  
 * @param {(Boolean)} [LargeIcons] - Use large icons or small icons  
 * - `0` or Omitted = ImageList will contain small icons
 * - `1` = ImageList will contain large icons
 * @returns {(Integer)} On success, a unique ID for the ImageList, otherwise `0`  
 * @throws {()} - 
 * @example <caption>__
 * </caption>
 */
IL_Create([InitialCount:=2, GrowCount:=5, LargeIcons:=0]) => Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/ListView.htm#IL_Add|`IL_Add()`} adds an icon or picture to the specified ImageList.  
 * @param {(Integer)} ImageListID - The identifying number of an image list generated by {@link https://www.autohotkey.com/docs/v2/lib/ListView.htm#IL_Create|`IL_Create()`}.
 * @param {(String)} IconOrPic - Filename to an icon or picture file  
 * - `Icon` = .ICO .CUR .ANI .EXE .DLL .CPL .SCR {@link https://www.autohotkey.com/docs/v2/misc/ImageHandles.htm|`Icon Handle "HICON:"`} or another icon resource
 * - `Pic` = .BMP .GIF .JPG .PNG .TIF .Exif .WMF .EMF or a {@link https://www.autohotkey.com/docs/v2/misc/ImageHandles.htm|`Bitmap Handle "HBITMAP:"`}  
 * @param {(Integer)} Num - Dependant on Icon or Pic
 * - `Icon` = Num is the icon number to use  
 *   If this is no sign, the number indicates the icon group to use  
 *   A negative sign indicates the number is used as a resource ID for an icon inside an executable  
 *   Num can be omitted when using an icon and will default to `1`  
 * - `Pic` = A transparency mask color in hex  
 *   The color white `0xFFFFFF` works well for most pictures  
 * @param {(Boolean)} Resize  
 * - `1` = Picture is scaled to become a single icon  
 * - `0` = Picture is divided into a number of icons that fit inside the given width  
 * @returns {(Integer)} On success, the ImageList index position of the icon was stored is returned
 * @returns {(Integer)} A `0` is returned on failure  
 * Otherwise, the index (1, 2, 3, ...) where the icon was stored in the ImageList is returned  
 * @example <caption>__
 * </caption>
 * IL_Add(ImageListID, 'C:\Path\to\application.exe', 2)
 * IL_Add(ImageListID, 'C:\Path\to\image.bmp', 0xFFFFFF, )
 */
IL_Add(ImageListID, IconOrPic, Num, Resize) => Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/ListView.htm#IL_Destroy|`IL_Destroy()`} deletes the specified ImageList.  
 * ListViews are automatically destroyed when the ListView parent window is destroyed. Rarely do they need to be manually destroyed.  
 * @param {(Integer)} ImageListID - The identifying number of an image list generated by {@link https://www.autohotkey.com/docs/v2/lib/ListView.htm#IL_Create|`IL_Create()`}.
 * @returns {(Boolean)} `1` on success, otherwise `0`.  
 * @example <caption>__
 * il_id := IL_Create()
 * result := IL_Destroy(il_id)
 * if result
 *     MsgBox('Image list destroyed')
 * else MsgBox('Failed to destroy image list')
 * </caption>
 */
IL_Destroy(ImageListID) => Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/ImageSearch.htm|`ImageSearch()`} searches a region of the screen for an image.  
 * @param {(VarRef)} OutputVarX - Receives the X coordinate of the upper left corner of the image match
 * If no match is found, var is set to an empty string.  
 * @param {(VarRef)} OutputVarY - Receives the X coordinate of the upper left corner of the image match
 * If no match is found, var is set to an empty string.  
 * @param {(Integer)} X1 - X coordinate of the left edge of the area to search
 * @param {(Integer)} Y1 - Y coordinate of the top edge of the area to search
 * @param {(Integer)} X2 - X coordinate of the right edge of the area to search
 * @param {(Integer)} Y2 - Y coordinate of the bottom edge of the area to search
 * @param {(String)} ImageFile - Options followed by an image file name or path to an image file.  
 * If a full path isn't used, ImageFile is assumed to start in {@link https://www.autohotkey.com/docs/v2/Variables.htm#WorkingDir|`A_WorkingDir`}.  
 * Supported formats: .ANI .BMP .CUR .EMF .Exif .GIF .ICO .JPG .PNG .TIF .WMF .EXE .DLL .CPL .SCR and other icon resources  
 * **Options**  
 * A string of zero or options separated by spaces/tabs may be added before the file path  
 * - `*Icon#` = Set icon group number to use, where `#` is the specific number 
 * - `*#` = The allowed variance in color to still match the image, where `#` is between 0 and 255  
 *   Default is 0  
 * - `*Trans#` = Makes images easier to find by specifying a transparency color for a picture where `#` is a {@link https://www.autohotkey.com/docs/v2/misc/Colors.htm|`Valid Color Name`} or an RGB color with optional hex prefix.  
 *   These are all the same: `*TransWhite`, `*TransFFFFFF`, `*Trans0xFFFFFF`  
 *   Commonly used with .PNG .GIF and .TIF files that have some transparent area.  
 *   `*TransWhite` works well for .GIF files while `*TransBlack` works well for .PNG and .TIF files  
 * - `*W#` `*H#` = Width and Height to scale the image, where `#` is the new size in pixels.  
 *   If both are omitted, icons load to 16x16 and pictures load to their actual size.  
 *   To preserve aspect ratio, set a width or height and use `-1` for the other: `*W300 *H-1`  
 * @returns {(Integer)} `1` if the image was found, otherwise `0`
 * @throws {(ValueError)} - An invalid parameter was detected or the image could not be loaded
 * @throws {(OSError)} - An OS internal function call failed
 * @see {@link https://www.autohotkey.com/docs/v2/lib/PixelSearch.htm|`PixelSearch()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/PixelGetColor.htm|`PixelGetColor()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/CoordMode.htm|`CoordMode()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/MouseGetPos.htm|`MouseGetPos()`}
 * @example <caption>__
 * </caption>
 */
ImageSearch(&OutputVarX, &OutputVarY, X1, Y1, X2, Y2, ImageFile) => Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/IniDelete.htm|`IniDelete()`} deletes a value from a standard format .ini file.  
 * @param {(String)} FileLocation - The file name or path to an .INI file.  
 * If a full path isn't used, FileLocation is assumed to start in {@link https://www.autohotkey.com/docs/v2/Variables.htm#WorkingDir|`A_WorkingDir`}.  
 * @param {(String)} Section - The name of a section in the .INI file.  
 * @param {(String)} [Key] - The name of the key-value pair to delete.  
 * If omitted, all keys in the section are deleted.  
 * @returns {(String)} An empty string is always returned.  
 * @throws {(OSError)} - Thrown on failure.  
 * Regardless of an error, {@link https://www.autohotkey.com/docs/v2/Variables.htm#LastError|`A_LastError`} is set to the result of the OS's GetLastError().  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/IniRead.htm|`IniRead()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/IniWrite.htm|`IniWrite()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/RegDelete.htm|`RegDelete()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/RegDeleteKey.htm|`RegDeleteKey()`}
 * @example <caption>__
 * </caption>
 * ; Standard INI file format:
 * 
 * ; INI comments start with semicolons
 * ; Just like AHK comments
 * [Section Names Go In Square Brackets]
 * Key_Name = Some saved data
 * Another_Key = 0
 */
IniDelete(FileLocation, Section [, Key]) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/IniRead.htm|`IniRead()`} reads a value, section or list of section names from a standard format .ini file.  
 * @param {(String)} FileLocation - The file name or path to an .INI file.  
 * If a full path isn't used, FileLocation is assumed to start in {@link https://www.autohotkey.com/docs/v2/Variables.htm#WorkingDir|`A_WorkingDir`}.  
 * @param {(String)} [Section] - The name of a section in the .INI file.  
 * If `Section` is omitted, a newline delimited list of all sections in the file is returned.  
 * @param {(String)} [Key] - The name of a key to get the value of.  
 * If `Key` is omitted, a newline delimited list of all keys in that section is returned.  
 * @param {(String)} [Default] - If the Key name doesn't exist in the specified Section, this value is returned.  
 * @returns {(String)} The value of the specified `Key` is returned.  
 * If `Key` not found, the value of `Default` is returned  
 * If no default value was provided, an error is thrown  
 * If `Key` is omitted, a list of all keys from the specified section is returned  
 * If `Section` is omitted, a list of all sections from the specified INI file is returned  
 * @throws {(OSError)} - Thrown if key doesn't exist and no default was provided  
 * Regardless of an error, {@link https://www.autohotkey.com/docs/v2/Variables.htm#LastError|`A_LastError`} is set to the result of the OS's GetLastError().  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/IniWrite.htm|`IniWrite()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/IniDelete.htm|`IniDelete()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/RegRead.htm|`RegRead()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileRead.htm|`FileRead()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/LoopRead.htm|`Loop-Files`}
 * @example <caption>__
 * </caption>
 * ; Standard INI file format:
 * 
 * ; INI comments start with semicolons
 * ; Just like AHK comments
 * [Section Names Go In Square Brackets]
 * Key_Name = Some saved data
 * Another_Key = 0 */
IniRead(FileLocation [, Section, Key, Default]) => String

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/IniWrite.htm|`IniWrite()`} writes a value or section to a standard format .ini file.  
 * Values longer than 65,535 characters can be written to the file, but cannot be read correctly by {@link https://www.autohotkey.com/docs/v2/lib/IniRead.htm|`IniRead()`}.  
 * INI files are created as UTF-16 with BOM. To have the INI file encoded otherwise, create it before writing to it.  
 * @param {(String)} Value - Either a single value to write to a key or an entire section of key=value pair(s).  
 * If writing a section of key=value pairs, `key = value` format should be used for each line and there can be no blank lines.  
 * @param {(String)} FileLocation - The file name or path to an .INI file.  
 * If a full path isn't used, FileLocation is assumed to start in {@link https://www.autohotkey.com/docs/v2/Variables.htm#WorkingDir|`A_WorkingDir`}.  
 * @param {(String)} Section - The name of a section in the .INI file to write to.  
 * @param {(String)} Key - The name of the key to assign `Value` to.  
 * Key **must** be omitted when `Value` is a section of key=value pairs.  
 * @returns {(String)} An empty string is always returned.  
 * @throws {(OSError)} - Thrown on failure.  
 * Regardless of an error, {@link https://www.autohotkey.com/docs/v2/Variables.htm#LastError|`A_LastError`} is set to the result of the OS's GetLastError().  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/IniRead.htm|`IniRead()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/IniDelete.htm|`IniDelete()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/RegWrite.htm|`RegWrite()`}
 * @example <caption>__
 * </caption>
 * ; Writing a single value to a key
 * IniWrite('true', A_Desktop '\test.ini', 'Test Section', 'my_key')
 * 
 * ; Writing multiple key=value pairs
 * data := 'language = "AutoHotkey"'
 *     . '`nversion = "2.0.10"'
 *     . '`ndate = 2023-12-06'
 * IniWrite(data, A_Desktop '\test.ini', 'Code Info')
 * 
 * ;=================
 * ; INI file format:
 * ; INI comments start with semicolons just like AHK comments
 * [Section Names Go In Square Brackets]
 * Key_Name = Data goes right of the = sign
 * number_1000 = 1000
 */
IniWrite(Value, FileLocation, Section, Key) => String

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/InputBox.htm|`InputBox()`} displays a popup box to get input from the user.  
 * @param {(String)} [Prompt] - Text to display to the user above the edit input control.  
 * If omitted, the text area remains blank.  
 * @param {(String)} [Title] - A title to give to the input box GUI.  
 * If omitted, {@link https://www.autohotkey.com/docs/v2/Variables.htm#ScriptName|`A_ScriptName`} is used.  
 * @param {(String)} [Options] - Zero or more of the following options, separated by spaces/tabs  
 * - `X#` `Y#` = Set the X and/or Y coordinates of the input box's upper-left corner, where `#` is a coordinate number.  
 *   If either is omitted, the input box will be centered on that axis.  
 * - `W#` `H#` = The width and height of the input box's client area, where `#` is the number of pixels.  
 * - `T#` = Set a timeout to occur, where `#` is the number of seconds to wait.  
 *   If timeout occurs, the return object sets `Result` to the word `Timeout` and `Value` to whatever the user had entered.  
 * - `Password#` = Masks the characters of the input box to prevent others from viewing what's being typed.  
 *   Setting `#` to a character will use that character as the symbol mask  
 *   Using `Password*` will show a `*` each time a character is typed.  
 *   If no character is provided after the word `Password`, a default circle is used.  
 * @param {(String)} [DefaultText] - Specify any default text to show in the edit control of the input box.  
 * If omitted or an empty string, no text will show in the control box.  
 * @returns {(Object)} An object is returned with 2 properties.  
 * `obj.Value` contains the user's submitted text  
 * `obj.Result` contains how the input box was closed: `OK`, `Cancel`, or `Timeout`  
 * @throws {()} - 
 * @see {@link https://www.autohotkey.com/docs/v2/lib/MsgBox.htm|`MsgBox()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileSelect.htm|`FileSelect()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/DirSelect.htm|`DirSelect()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/ToolTip.htm|`ToolTip()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm|`Gui object`},
 * {@link https://www.autohotkey.com/docs/v2/lib/InputHook.htm|`InputHook object`}
 * @example <caption>__
 * </caption>
 */
InputBox([Prompt:='', Title:=A_ScriptName, Options:='', DefaultText:='']) => Object

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/InstallKeybdHook.htm|`InstallKeybdHook()`} installs or uninstalls the keyboard hook.  
 * The hook monitors keystrokes hotstring activaiton, hotkeys not supported by Window's {@link https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-registerhotkey|`RegisterHotkey()`}, and supports {@link https://www.autohotkey.com/docs/v2/lib/InputHook.htm|`InputHook`}.  
 * The keyboard hook is automatically installed when a script has a hotstring, a hooked hotkey, the {@link https://www.autohotkey.com/docs/v2/lib/SetNumScrollCapsLockState.htm|`Set[Caps/Scroll/Num]LockState()`} function, or has an active InputHook.  
 * @param {(Boolean)} [Install]  
 * - `1` = Hook is required to be installed.  
 * - `0` = Previously set requirements by this function are removed.  
 *   This may cause the hook to uninstall completely.  
 * @param {(Boolean)} [Force]  
 * - `1` = This depends on the `Install` param.  
 *   If `Install` is true, the hook is uninstalled and reinstalled.  
 *   If `Install` is false, the hook is completely uninstalled, even if needed by something else.  
 *   A hotkey or hotstring relying on the hook is disabled until the hook is reinstalled.  
 * - `0` = An internal variable is changed to indicate if the hook is required by the script.  
 * @returns {(String)} An empty string is always returned.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/InstallMouseHook.htm|`InstallMouseHook()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Hotkey.htm|`Hotkey()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/InputHook.htm|`InputHook()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/KeyHistory.htm|`KeyHistory()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Hotstring.htm|`Hotstring()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/GetKeyState.htm|`GetKeyState()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/KeyWait.htm|`KeyWait()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/_UseHook.htm|`#UseHook`}
 * {@link https://www.autohotkey.com/docs/v2/Hotkeys.htm|`Hotkeys::`},
 * {@link https://www.autohotkey.com/docs/v2/Hotstrings.htm|`::Hotstrings::`},
 * @example <caption>__
 * </caption>
 */
InstallKeybdHook([Install:=1, Force:=0]) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/InstallMouseHook.htm|`InstallMouseHook()`} installs or uninstalls the mouse hook.  
 * The hook monitors mouse clicks for the purpose of activating mouse {@link https://www.autohotkey.com/docs/v2/Hotkeys.htm|`mouse hotkeys`} and {@link https://www.autohotkey.com/docs/v2/Hotstrings.htm#NoMouse|`facilitating hotstrings`}.  
 * The mouse hook is automatically installed when a script has a hotstring or a mouse hotkey.  
 * @param {(Boolean)} [Install]  
 * - `1` = Hook is required to be installed.  
 * - `0` = Previously set requirements by this function are removed.  
 *   This may cause the hook to uninstall completely.  
 * @param {(Boolean)} [Force]  
 * - `1` = This depends on the `Install` param.  
 *   If `Install` is true, the hook is uninstalled and reinstalled.  
 *   If `Install` is false, the hook is completely uninstalled, even if needed by something else.  
 *   A hotkey or hotstring relying on the hook is disabled until the hook is reinstalled.  
 * - `0` = An internal variable is changed to indicate if the hook is required by the script.  
 * @returns {(String)} An empty string is always returned.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/InstallKeybdHook.htm|`InstallKeybdHook()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Hotkey.htm|`Hotkey()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/InputHook.htm|`InputHook()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/KeyHistory.htm|`KeyHistory()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Hotstring.htm|`Hotstring()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/GetKeyState.htm|`GetKeyState()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/KeyWait.htm|`KeyWait()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/_UseHook.htm|`#UseHook`}
 * {@link https://www.autohotkey.com/docs/v2/Hotkeys.htm|`Hotkeys::`},
 * {@link https://www.autohotkey.com/docs/v2/Hotstrings.htm|`::Hotstrings::`},
 * @example <caption>__
 * </caption>
 */
InstallMouseHook([Install:=1, Force:=0]) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/InStr.htm|`InStr()`} searches inside a string for an instance of the provided string.  
 * The search is done from left to right but can be changed with the `StartPos` and `Occurrence` parameters.  
 * @param {(String)} Haystack - The string to search inside of.  
 * @param {(String)} Needle - The string to search for.  
 * @param {(Integer|String)} [CaseSense]  
 * - `1` `On` = Search is case-sensitive. `A` does not match `a`.  
 * - `0` `Off` = Search is not case-sensitive. `A` matches `a`.  
 * - `Locale` = Case-sensitivity is based on the rules of the user's locale.  
 *   Locale can be x1-x8 slower than using `Off`.  
 * @param {(Integer)} [StartPos] - The position in the string to start the search at.  
 * If omitted, `1` is used.  
 * - Positive Number  
 *   Starting position is counted left to right. 1 = first char, 2 = second, ...
 *   Search direction is set to left to right  
 * - Negative Number  
 *   Starting position is counted in reverse. -1 = last char, -2 = second from last, ...
 *   Search direction is set right to left
 * 
 * The `Occurrence` parameter can override these search direction settings.  
 * @param {(Integer)} [Occurrence] - Get the position of the Nth occurrence.  
 * It's the number of times `Needle` must be found before a position is returned.  
 * If omitted, `1` is used.  
 * - Positive Number = Search is done left to right.  
 * - Negative Number = Search is done right to left.  
 * 
 * This setting overrides the search direction set by `StartPos`.
 * @returns {(Integer)} The position in the string the of the first found instance.  
 * If `Occurrence` is set, the position reflects the position of that 
 * @throws {(ValueError)} - `Needle` is an empty string (zero-length)
 * @throws {(ValueError)} - `CaseSense` is invalid
 * @throws {(ValueError)} - `Occurrence` or `StartPos` is not a number greater than 0
 * @see
RegExMatch
Is functions
 * @example <caption>__
 * </caption>
 */
InStr(Haystack, Needle [, CaseSense:=0, StartPos:=1, Occurrence]) => Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/Is.htm#IsAlnum|`IsAlnum()`} checks if `Value` contains only alphanumeric characters.  
 * Alphanumeric character is defined as: `abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789`  
 * @param {(String)} Value - A string to check.  
 * @param {(String)} Locale - By default, only ASCII characters are considered.  
 * Specifying the word `Locale` to use the user's locale rules.  
 * @returns {(Boolean)} `1` if `Value` is only alphanumeric characters or is an empty string, otherwise `0`
 * @see {@link https://www.autohotkey.com/docs/v2/lib/Is.htm|`Is functions`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Type.htm|`Type()`},
 * {@link https://www.autohotkey.com/docs/v2/Functions.htm#ByRef|`ByRef prameters`}
 * @example <caption>  
 * </caption>
 */
IsAlnum(Value [, Locale:=unset]) => Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/Is.htm#alpha|`IsAlpha()`} checks if `Value` contains only alphabetic characters.  
 * Alphabetic character is defined as: `abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ`  
 * @param {(String)} Value - A string to check.  
 * @param {(String)} Locale - By default, only ASCII characters are considered.  
 * Specifying the word `Locale` to use the user's locale rules.  
 * @returns {(Boolean)} `1` if `Value` is only alphabetic characters or is an empty string, otherwise `0`
 * @see {@link https://www.autohotkey.com/docs/v2/lib/Is.htm|`Is functions`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Type.htm|`Type()`},
 * {@link https://www.autohotkey.com/docs/v2/Functions.htm#ByRef|`ByRef prameters`}
 * @example <caption>  
 * </caption>
 */
IsAlpha(Value [, Locale:=unset]) => Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/Is.htm#digit|`IsDigit()`} checks if `Value` contains only digits.  
 * Digit is defined as: `0123456789`
 * @param {(String|Integer)} Value - A string or integer.  
 * @returns {(Boolean)} `1` if `Value` is only digits or is an empty string, otherwise `0`
 * @see {@link https://www.autohotkey.com/docs/v2/lib/Is.htm|`Is functions`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Type.htm|`Type()`},
 * {@link https://www.autohotkey.com/docs/v2/Functions.htm#ByRef|`ByRef prameters`}
 * @example <caption>  
 * </caption>
 */
IsDigit(Value) => Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/Is.htm#float|`IsFloat()`} check if `Value` is float type or a string representing a valid float.  
 * Spaces and tabs around the float are ignored. ` 2.1 `  
 * A string float can start with a plus `+` or minus `-` sign, or a decimal `.`. `.7`  
 * @param {(Any)} Value - The input to check.  
 * @returns {(Boolean)} `1` if valid float, otherwise `0`
 * @see {@link https://www.autohotkey.com/docs/v2/lib/Is.htm|`Is functions`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Type.htm|`Type()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Integer.htm|`Integer`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Float.htm|`Float`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Number.htm|`Number`},
 * {@link https://www.autohotkey.com/docs/v2/lib/String.htm|`String`},
 * {@link https://www.autohotkey.com/docs/v2/Objects.htm#primitive|`Primitive`},
 * {@link https://www.autohotkey.com/docs/v2/Concepts.htm#values|`Values`},
 * {@link https://www.autohotkey.com/docs/v2/Language.htm#expressions|`Expressions`}
 * @example <caption>  
 * </caption>
 */
IsFloat(Value) => Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/Is.htm#integer|`IsInteger()`} check if `Value` is integer type or a string representing a valid integer.
 * Spaces and tabs around the integer are ignored. ` 5 `  
 * A string integer can start with a plus `+` or minus `-` sign. `-5`  
 * @param {(Any)} Value - The input to check.  
 * @returns {(Boolean)} `1` if valid integer, otherwise `0`
 * @see {@link https://www.autohotkey.com/docs/v2/lib/Is.htm|`Is functions`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Type.htm|`Type()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Integer.htm|`Integer`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Float.htm|`Float`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Number.htm|`Number`},
 * {@link https://www.autohotkey.com/docs/v2/lib/String.htm|`String`},
 * {@link https://www.autohotkey.com/docs/v2/Objects.htm#primitive|`Primitive`},
 * {@link https://www.autohotkey.com/docs/v2/Concepts.htm#values|`Values`},
 * {@link https://www.autohotkey.com/docs/v2/Language.htm#expressions|`Expressions`}
 * @example <caption>  
 * </caption>
 */
IsInteger(Value) => Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/IsLabel.htm|`IsLabel()`} checks if `Value` is a valid {@link https://www.autohotkey.com/docs/v2/misc/Labels.htm|`label`} name within the current scope.  
 * @param {(String)} Value - The label name to check.  
 * @returns {(Boolean)} `1` if label name is valid, otherwise `0`
 * @see {@link https://www.autohotkey.com/docs/v2/lib/Is.htm|`Is functions`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Type.htm|`Type()`},
 * {@link https://www.autohotkey.com/docs/v2/misc/Labels.htm|`Labels`},
 * @example <caption>  
 * </caption>
 */
IsLabel(Value) => Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/Is.htm#lower|`IsLower()`} checks if `Value` contains only lowercase characters.  
 * Lowercase character is defined as: `abcdefghijklmnopqrstuvwxyz`  
 * @param {(String)} Value - A string to check.  
 * @param {(String)} Locale - By default, only ASCII characters are considered.  
 * Specifying the word `Locale` to use the user's locale rules.  
 * @returns {(Boolean)} `1` if `Value` is only lowercase characters or is an empty string, otherwise `0`
 * @see {@link https://www.autohotkey.com/docs/v2/lib/Is.htm|`Is functions`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Type.htm|`Type()`},
 * {@link https://www.autohotkey.com/docs/v2/Functions.htm#ByRef|`ByRef prameters`}
 * @example <caption>  
 * </caption>
 */
IsLower(Value [, Locale:=unset]) => Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/Is.htm#number|`IsNumber()`} check if `Value` is float or integer type or a string representing a valid float or integer.  
 * Spaces and tabs around the number are ignored. ` 7 `  
 * A string number can start with a plus `+` or minus `-` sign, or a decimal `.`. `-7.5`  
 * @param {(Any)} Value - The input to check.  
 * @returns {(Boolean)} `1` if valid number, otherwise `0`
 * @see {@link https://www.autohotkey.com/docs/v2/lib/Is.htm|`Is functions`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Type.htm|`Type()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Integer.htm|`Integer`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Float.htm|`Float`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Number.htm|`Number`},
 * {@link https://www.autohotkey.com/docs/v2/lib/String.htm|`String`},
 * {@link https://www.autohotkey.com/docs/v2/Objects.htm#primitive|`Primitive`},
 * {@link https://www.autohotkey.com/docs/v2/Concepts.htm#values|`Values`},
 * {@link https://www.autohotkey.com/docs/v2/Language.htm#expressions|`Expressions`}
 * @example <caption>  
 * </caption>
 */
IsNumber(Value) => Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/IsObject.htm|`IsObject()`} checks if `Value` is any {@link https://www.autohotkey.com/docs/v2/Objects.htm|`object`} type other than a {@link https://www.autohotkey.com/docs/v2/Objects.htm#primitive|`primitive`}.  
 * @param {(Any)} Value - The input to check.  
 * @returns {(Boolean)} `1` if valid object, otherwise `0`
 * @see {@link https://www.autohotkey.com/docs/v2/lib/Is.htm|`Is functions`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Type.htm|`Type()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Object.htm|`Object()`},
 * {@link https://www.autohotkey.com/docs/v2/Objects.htm|`Objects`},
 * @example <caption>  
 * </caption>
 */
IsObject(Value) => Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/IsSet.htm|`IsSet()`} checks if `Var` has been assigned a value (initialized).  
 * @param {(Variable)} Var - The variable to check.  
 * @returns {(Boolean)} `1` if variable has bene assigned a value, otherwise `0`
 * @see {@link https://www.autohotkey.com/docs/v2/lib/Is.htm|`Is functions`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Type.htm|`Type()`},
 * {@link https://www.autohotkey.com/docs/v2/Functions.htm#ByRef|`ByRef prameters`}
 * @example <caption>  
 * </caption>
 */
IsSet(Var) => Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/IsSet.htm|`IsSetRef()`} checks if referenced variable has been assigned a value (initialized).  
 * @param {(VarRef)} Ref - The variable reference to check.  
 * @returns {(Boolean)} `1` if referenced variable has bene assigned a value, otherwise `0`
 * @see {@link https://www.autohotkey.com/docs/v2/lib/Is.htm|`Is functions`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Type.htm|`Type()`},
 * {@link https://www.autohotkey.com/docs/v2/Functions.htm#ByRef|`ByRef prameters`}
 * @example <caption>  
 * </caption>
 */
IsSetRef(&Ref) => Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/Is.htm#IsAlnum|`IsSpace()`} checks if `Value` contains only whitespace characters.  
 * Whitespace character is defined as: `` `t `` Tab, `` `s `` Space, `` `n `` Linefeed, `` `r `` Carriage Return, `` `v `` Vertical Tab, `` `f `` Formfeed
 * @param {(String)} Value - A string to check.  
 * @returns {(Boolean)} `1` if `Value` is only whitespace characters or is an empty string, otherwise `0`
 * @see {@link https://www.autohotkey.com/docs/v2/lib/Is.htm|`Is functions`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Type.htm|`Type()`},
 * {@link https://www.autohotkey.com/docs/v2/Functions.htm#ByRef|`ByRef prameters`}
 * @example <caption>  
 * </caption>
 */
IsSpace(Value) => Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/Is.htm#IsAlnum|`IsTime()`} checks if `Value` contains a valid {@link https://www.autohotkey.com/docs/v2/lib/FileSetTime.htm#YYYYMMDD|`YYYYMMDDHH24MISS` date-time stamp}.  
 * Any partial date-time stamp is if it follows each subsection. `20221220` is valid.  
 * Any year prior to 1601 will return false as the OS does not consider it valid.  
 * @param {(String)} Value - A date-time stamp to check.  
 * @returns {(Boolean)} `1` if `Value` is a valid section or whole date-time stamp is an empty string, otherwise `0`  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/Is.htm|`Is functions`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Type.htm|`Type()`},
 * {@link https://www.autohotkey.com/docs/v2/Functions.htm#ByRef|`ByRef prameters`}
 * @example <caption>  
 * </caption>
 */
IsTime(Value) => Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/Is.htm#upper|`IsUpper()`} checks if `Value` contains only uppercase characters.  
 * Uppercase character is defined as: `ABCDEFGHIJKLMNOPQRSTUVWXYZ`  
 * @param {(String)} Value - A string to check.  
 * @param {(String)} Locale - By default, only ASCII characters are considered.  
 * Specifying the word `Locale` to use the user's locale rules.  
 * @returns {(Boolean)} `1` if `Value` is only uppercase characters or is an empty string, otherwise `0`
 * @see {@link https://www.autohotkey.com/docs/v2/lib/Is.htm|`Is functions`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Type.htm|`Type()`},
 * {@link https://www.autohotkey.com/docs/v2/Functions.htm#ByRef|`ByRef prameters`}
 * @example <caption>  
 * </caption>
 */
IsUpper(Value [, Locale:=unset]) => Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/Is.htm#xdigit|`IsXDigit()`} checks if `Value` contains only hexadecimal digits.  
 * Hexadecimal digit is defined as: `0123456789abcdefABCDEF`  
 * A hex prefix of `0x` or `0X` is allowed.  
 * @param {(String|Integer)} Value - A string or number.  
 * @returns {(Boolean)} `1` if `Value` is a valid hexadecimal number or is an empty string, otherwise `0`
 * @see {@link https://www.autohotkey.com/docs/v2/lib/Is.htm|`Is functions`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Type.htm|`Type()`},
 * {@link https://www.autohotkey.com/docs/v2/Functions.htm#ByRef|`ByRef prameters`}
 * @example <caption>  
 * </caption>
 */
IsXDigit(Value) => Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/KeyHistory.htm|`KeyHistory()`} displays script info and a history of the most recent key/mouse/joypad events.  
 * Useful for detecing scan codes, virtual keys, and exact names for any keyboard key, mouse button, or controller joy.  
 * {@link https://www.autohotkey.com/docs/v2/lib/InstallMouseHook.htm|`Mouse`}/{@link https://www.autohotkey.com/docs/v2/lib/InstallKeybdHook.htm|`Keyboard`} hooks must be installed to show in key history.  
 * @param {(Integer)} [MaxEvents] - Specify the a maximum number of keyboard and mouse events to record.  
 * This number must be between `0-500` with 0 disabling key history.  
 * Omitting `MaxEvents` will open the script's main window and display KeyHistory view.  
 * Default value is 40.
 * @returns {(String)} An empty string is always returned.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/InstallKeybdHook.htm|`InstallKeybdHook()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/InstallMouseHook.htm|`InstallMouseHook()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/ListHotkeys.htm|`ListHotkeys()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/ListLines.htm|`ListLines()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/ListVars.htm|`ListVars()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/GetKeyState.htm|`GetKeyState()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/KeyWait.htm|`KeyWait()`},
 * {@link https://www.autohotkey.com/docs/v2/KeyList.htm#Controller|`Controller`},
 * {@link https://www.autohotkey.com/docs/v2/Variables.htm#PriorKey|`A_PriorKey`}
 * @example <caption>__
 * </caption>
 */
KeyHistory([MaxEvents:=unset]) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/KeyWait.htm|`KeyWait()`} waits for a key or mouse/controller button to be released or pressed down.  
 * @param {(String)} KeyName - The {@link https://www.autohotkey.com/docs/v2/KeyList.htm|name of a key} to wait for.  
 * Controller buttons can be used but none of the others controller inputs.  
 * A virtual code such as `vkFF` can be used for {@link https://www.autohotkey.com/docs/v2/KeyList.htm#SpecialKeys|`special cases`}.  
 * To wait for two or more keys to be released, use KeyWait() consecutively.  
 * @param {(String)} [Options] - 
 * - `D` = Down. Wait for key to be in the down state.  
 * - `L` = Logical. Checks for the logical state of the key, not the physical state.  
 * - `T#` = Timeout. The function stops waiting and returns 0 after `#` seconds have passed.  
 *   A float can be used for a more precise wait time. `T0.5` = 500 ms.  
 *   Timeout must be a decimal value.  
 * @returns {(Boolean)} `0` if KeyWait timed out, otherwise `1`
 * @see {@link https://www.autohotkey.com/docs/v2/lib/GetKeyState.htm|`GetKeyState()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/KeyHistory.htm|`KeyHistory()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/InstallKeybdHook.htm|`InstallKeybdHook()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/InstallMouseHook.htm|`InstallMouseHook()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/ClipWait.htm|`ClipWait()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/WinWait.htm|`WinWait()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/InputHook.htm|`InputHook`},
 * {@link https://www.autohotkey.com/docs/v2/KeyList.htm|`Key List`}
 * @example <caption>__
 * </caption>
 */
KeyWait(KeyName [, Options]) => Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/ListHotkeys.htm|`ListHotkeys()`} displays all hotkeys in use by the current script.  
 * This function opens the script's main window and switches to the Hotkeys view.  
 * @returns {(String)} An empty string is always returned.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/InstallKeybdHook.htm|`InstallKeybdHook()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/InstallMouseHook.htm|`InstallMouseHook()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/KeyHistory.htm|`KeyHistory()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/ListLines.htm|`ListLines()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/ListVars.htm|`ListVars()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/A_MaxHotkeysPerInterval.htm|`A_MaxHotkeysPerInterval`},
 * {@link https://www.autohotkey.com/docs/v2/lib/_MaxThreadsPerHotkey.htm|`#MaxThreadsPerHotkey`},
 * {@link https://www.autohotkey.com/docs/v2/lib/_UseHook.htm|`#UseHook`}
 * @example <caption>__
 * </caption>
 */
ListHotkeys() => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/ListLines.htm|`ListLines()`} enables or disables line logging or displays the script lines most recently executed.  
 * The default starting value is 1.  
 * @param {(Boolean)} [Mode]
 * - Omit = Opens the script's main window and switches to the "Lines most recently executed" view.  
 * - `1` = Start capturing executed lines
 * - `0` = Stop capturing executed lines  
 * 
 * Affects only the behavior of the {@link https://www.autohotkey.com/docs/v2/misc/Threads.htm|current thread}.  
 * @returns {(Boolean)} Previous sentting is returned, either `0` or `1`.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/KeyHistory.htm|`KeyHistory()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/ListHotkeys.htm|`ListHotkeys()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/ListVars.htm|`ListVars()`}
 * @example <caption>__
 * </caption>
 */
ListLines([Mode]) => Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/ListVars.htm|`ListVars()`} displays the names and current contents of the script's {@link https://www.autohotkey.com/docs/v2/Variables.htm|`variables`}.  
 * This function opens the script's main window and switches to the "Variables and their contents" view.  
 * @returns {(String)} An empty string is always returned.  
 * @see

 * @example <caption>__
 * </caption>
 */
ListVars() => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/ListViewGetContent.htm|`ListViewGetContent()`} returns a list of items/rows from a ListView.  
 * @param {(String)} [Options] - Specify what to retrieve.  
 * Include zero or more options separated by spaces/tabs.  
 * - Omit = All text in the ListView is retrieved.  
 * - `Selected` = Selected/highlighted row is retrieved.  
 *   If nothing is selected, an empty string is returned.  
 * - `Focused` = Focused row is retrieved.  
 *   If nothing is focused, an empty string is returned.  
 * - `Col#` = Retrieve the text from the specified column, where `#` is the column number.  
 * - `Count` = Retrieve total number of rows in the ListView.  
 * - `Count Selected` = Retrieve the number of selected/highlighted rows.  
 * - `Count Focused` = Retrieve the number of focused rows.  
 * - `Count Col` = Retrieve total number of columns in the ListView.  
 *   If count cannot be determined, `-1` is returned.  
 * @param {(String|Integer|Object)} [Control] - A control's ClassNN,  
 * Text, HWND (handle), or an object with an HWND. See {@link https://www.autohotkey.com/docs/v2/lib/Control.htm#Parameter|`Control Parameter`}.  
 * If omitted, the main window is targeted.  
 * @param {(String|Integer|Object)} [WinTitle] - A string using a {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`} to match a window.  
 * Types: {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_exe|`ahk_exe`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_class|`ahk_class`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_id|`ahk_id`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_pid|`ahk_pid`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_group|`ahk_group`}  
 * If the string is the letter `A`, the current active window is used.  
 * If all `Win` params are omited, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#LastFoundWindow|`Last Found Window`} is used.  
 * @param {(String)} [WinText] - Text that must be found in the window.  
 * Use WindowSpy to view window text.  
 * @param {(String)} [NoWinTitle] - Window title does not contain this text.  
 * @param {(String)} [NoWinText] - Text that must not appear in the window.
 * Use WindowSpy to view window text.
 * @returns {(String|Integer)} Text representing lists/columns from the ListView.  
 * Each column is separated by a tab `` `t `` and each row is separated by a new line `` `n ``.  
 * An integer is returned for `Col#`, `Count`, and `Count Col` options.  
 * @throws {(TargetError)} - Window or control could not be found  
 * @throws {(OSError)} - A message could not be sent to the control or the ListView could not be opened  
 * @throws {(ValueError)} - Col# specified a nonexistent column  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/ControlGetItems.htm|`ControlGetItems()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/WinGetList.htm|`WinGetList()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Control.htm|`Control functions`},
 * {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SetTitleMatchMode.htm|`SetTitleMatchMode()`}
 * @example <caption>__
 * </caption>
 * ; Include a double parse loop example
 * list := ListViewGetContent()
 * loop parse list, '`n', '`r' {
 *     row_num := A_Index
 *     loop parse row, '`t' {
 *        MsgBox('Row: ' row_num
 *            '`nCol:' A_Index
 *            '`nData:' A_LoopField)
 *     }
 * }
 * @returns {string} 
 */
ListViewGetContent([Options:='', Control:=unset, WinTitle:='', WinText:='', NoWinTitle:='', NoWinText:='']) => String | Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/LoadPicture.htm|`LoadPicture()`} loads a picture from file and returns a bitmap or icon handle.  
 * @param {(String)} Filename - The filename or path of the picture.  
 * If a full path isn't used, Filename is assumed to start in {@link https://www.autohotkey.com/docs/v2/Variables.htm#WorkingDir|`A_WorkingDir`}.  
 * @param {(String)} [Options] - Zero or more of the following options, separated by spaces/tabs  
 * - `W#` `H#` = Load picture to specified size, where `#` is number of pixels.  
 *   To resize and maintain aspect ratio, set `W` or `H` to the desired number and set the other to `-1`.  
 *   Using a `0` will keep the height/width set to its original value
 * - `Icon#` = Icon number to load from the icon group, where `#` is the icon number.  
 *   Specifying `Icon1` will convert a supported image to an icon if the `OutImageType` param is used.  
 * - `GDI+` = Uses GDI+ to load the image, if available.  
 * @param {(VarRef)} [OutImageType] - Reference to a variable that will receive the returned image type
 * - `0` = IMAGE_BITMAP
 * - `1` = IMAGE_ICON
 * - `2` = IMAGE_CURSOR
 * @returns {(Integer)} A {@link https://www.autohotkey.com/docs/v2/misc/ImageHandles.htm|handle to a bitmap or icon}.  
 * @throws {()} - 
 * @see {@link https://www.autohotkey.com/docs/v2/misc/ImageHandles.htm|`Image Handles`}
 * @example <caption>__
 * </caption>
 */
LoadPicture(Filename [, Options, &OutImageType]) => Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/Math.htm#Log|`Log()`} returns the logarithm (base 10) of the specified number.  
 * @param {(Number)} Num - The number to get the log of.  
 * @returns {(Float)} The logarithm of Num.  
 * @throws {(ValueError)} - Num is a negative number
 * @example <caption>__
 * </caption>
 * Log(1.2) => 0.079181
 */
Log(Num) => Float

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/Math.htm#Ln|`Ln()`} returns the natural logarithm (base e) of the specified number.  
 * @param {(Number)} Num - The number to get the natural log of.  
 * @returns {(Float)} The natural logarithm of Num.  
 * @throws {(ValueError)} - Num is a negative number
 * @example <caption>__
 * </caption>
 */
Ln(Num) => Float

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/Math.htm#Max|`Max()`} returns the highest number from a set of numbers.  
 * @param {(Number|Array)} Value1 - A number or an array of numbers  
 * To pass an {@link https://www.autohotkey.com/docs/v2/lib/Array.htm|`array`}, mark the variable as {@link https://www.autohotkey.com/docs/v2/Functions.htm#Variadic|`variadic`}. `Max(arr*)`
 * @param {(Number)} [ValueN] - Any amount of additional numbers. 
 * @returns {(Number)} The highest number provided is returned. 
 * @example <caption>__
 * </caption>
 */
Max(Value1 [, ValueN]) => Number

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/MenuFromHandle.htm|`MenuFromHandle()`} retrieves the Menu or MenuBar object corresponding to a Win32 menu handle.  
 * @param {(Integer)} Handle - Handle to a Win32 menu (HMENU).  
 * @returns {(Menu|String)} A {@link https://www.autohotkey.com/docs/v2/lib/Menu.htm|`menu object`}.  
 * An empty string is returned if the handle does not point to an AHK menu.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/Menu.htm#Call|`Menu()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Menu.htm#Handle|`Menu.Handle`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Menu.htm|`Menu/MenuBar object`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Menu.htm#Win32_Menus|`Win32 Menus`}
 * @example <caption>__
 * </caption>
 */
MenuFromHandle(Handle) => Menu

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/MenuSelect.htm|`MenuSelect()`} invokes a menu item from the menu bar of the specified window.  
 * @param {(String|Integer|Object)} [WinTitle] - A string using a {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm|`WinTitle`} to match a window.  
 * Types: {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_exe|`ahk_exe`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_class|`ahk_class`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_id|`ahk_id`}, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_pid|`ahk_pid`}
 * , {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_group|`ahk_group`}  
 * If the string is the letter `A`, the current active window is used.  
 * If all `Win` params are omited, {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#LastFoundWindow|`Last Found Window`} is used.  
 * @param {(String)} [WinText] - Text that must be found in the window.  
 * Use WindowSpy to view window text.  
 * @param {()} MenuName - The name or prefix of the top-level menu item.  
 * It can also be the listed order of the menu: `1&` is the first menu, `2&` is the second, ...
 * @param {()} [SubMenu1] - The name or position of the submenu item.  
 * In rare cases, this can be omitted if the top-level item does not contain a menu.  
 * @param {()} [SubMenuN] - The name or position of subsequent submenus.  
 * Each submenu name should be put in a new parameter.  
 * @param {(String)} [NoWinTitle] - Window title does not contain this text.  
 * @param {(String)} [NoWinText] - Text that must not appear in the window.
 * Use WindowSpy to view window text.
 * @returns {(String)} An empty string is always returned.  
 * @throws {(TargetError)} - Window or control could not be found  
 * @throws {(TargetError)} - Does not have a standard Win32 menu
 * @throws {(ValueError)} - Menu, submenu, or menu item could not be found  
 * @throws {(ValueError)} - The final menu parameter points to a menu item which opens a submenu
 * @see {@link https://www.autohotkey.com/docs/v2/lib/ControlSend.htm|`ControlSend()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/PostMessage.htm|`PostMessage()`}
 * @example <caption>__
 * </caption>
 */
MenuSelect(WinTitle, WinText, MenuName [, SubMenu1:=unset, SubMenuN:=unset, NoWinTitle:='', NoWinText:='']) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/Math.htm#Min|`Min()`} returns the lowest number from a set of numbers.  
 * @param {(Number|Array)} Value1 - A number or an array of numbers  
 * To pass an {@link https://www.autohotkey.com/docs/v2/lib/Array.htm|`array`}, mark the variable as {@link https://www.autohotkey.com/docs/v2/Functions.htm#Variadic|`variadic`}. `Min(arr*)`
 * @param {(Number)} [ValueN] - Any amount of additional numbers
 * @returns {(Number)} The lowest number provided is returned
 * @example <caption>__
 * </caption>
 */
Min(Value1 [, ValueN]) => Number

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/Math.htm#Mod|`Mod()`} (modulo) returns the remainder of a number (dividend) divided by another number (divisor).  
 * @param {(Number)} Dividend - Number to divide.  
 * @param {(Number)} Divisor - Number to divide by.  
 * @returns {(Number)} Remainder after division occurs.  
 * Return value is integer if the divdend and divisor are both integers.  
 * Otherwise, return value is float.  
 * @throws {(ZeroDivisionError)} - Divisor was set to 0  
 * @example <caption>__
 * </caption>
 */
Mod() => Number

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/MonitorGet.htm|`MonitorGet()`} checks if the specified monitor exists and optionally retrieves its bounding coordinates.  
 * @param {(Integer)} Num - Monitor number to get bounding coordinates of.  
 * The number of monitors can be gotten with {@link https://www.autohotkey.com/docs/v2/lib/MonitorGetCount.htm|`MonitorGetCount()`}.  
 * If omitted, the primary monitor is used.  
 * @param {(VarRef)} Left - A variable to receive the coordinate of the left edge of the monitor.  
 * @param {(VarRef)} Top - A variable to receive the coordinate of the top edge of the monitor.  
 * @param {(VarRef)} Right - A variable to receive the coordinate of the right edge of the monitor.  
 * @param {(VarRef)} Bottom - A variable to receive the coordinate of the bottom edge of the monitor.  
 * @returns {(Integer)} The monitor number used to get the provided coordinates.  
 * This is equal to `Num` if `Num` is provided.  
 * @throws {(Error)} - On failure, an exception is thrown and var refs are not modified
 * @see {@link https://www.autohotkey.com/docs/v2/lib/MonitorGetWorkArea.htm|`MonitorGetWorkArea()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SysGet.htm|`SysGet()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Monitor.htm|`Monitor functions`}
 * @example <caption>__
 * </caption>
 */
MonitorGet([Num, &Left, &Top, &Right, &Bottom]) => Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/MonitorGetCount.htm|`MonitorGetCount()`} returns the total number of monitors.  
 * @returns {(Integer)} Total number of monitors.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/SysGet.htm|`SysGet()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Monitor.htm|`Monitor functions`}
 * @example <caption>__
 * </caption>
 */
MonitorGetCount() => Integer

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/MonitorGetName.htm|`MonitorGetName()`} returns the operating system's name of the specified monitor.  
 * @param {(Integer)} Num - The monitor number to get the name of.  
 * The number of monitors can be gotten with {@link https://www.autohotkey.com/docs/v2/lib/MonitorGetCount.htm|`MonitorGetCount()`}.  
 * If omitted, the primary monitor is used.  
 * @returns {(String)} The operating system's name for the specified monitor.  
 * @throws {(Error)} - Thrown on failure.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/SysGet.htm|`SysGet()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Monitor.htm|`Monitor functions`}
 * @example <caption>__
 * </caption>
 */
MonitorGetName([Num]) => String

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/MonitorGetPrimary.htm|`MonitorGetPrimary()`} returns the number of the primary monitor.  
 * @returns {(Integer)} The number of the primary monitor.  
 * This will always be `1` on a single monitor system.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/SysGet.htm|`SysGet()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Monitor.htm|`Monitor functions`}
 * @example <caption>__
 * </caption>
 */
MonitorGetPrimary() => String

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/MonitorGetWorkArea.htm|`MonitorGetWorkArea()`} checks if the specified monitor exists and optionally retrieves the bounding coordinates of its working area.  
 * The working area is area not reserved or otherwise claimed by taskbars, docked windows, and docked tool bars.  
 * @param {(Integer)} Num - Monitor number to get the workarea bounding coordinates of.  
 * The number of monitors can be gotten with {@link https://www.autohotkey.com/docs/v2/lib/MonitorGetCount.htm|`MonitorGetCount()`}.  
 * If omitted, the primary monitor is used.  
 * @param {(VarRef)} Left - A variable to receive the coordinate of the left edge of the workarea.  
 * @param {(VarRef)} Top - A variable to receive the coordinate of the top edge of the workarea.  
 * @param {(VarRef)} Right - A variable to receive the coordinate of the right edge of the workarea.  
 * @param {(VarRef)} Bottom - A variable to receive the coordinate of the bottom edge of the workarea.  
 * @returns {(Integer)} The monitor number used to get the provided coordinates.  
 * This is equal to `Num` if `Num` is provided.  
 * @throws {(Error)} - On failure, an exception is thrown and var refs are not modified
 * @see {@link https://www.autohotkey.com/docs/v2/lib/MonitorGet.htm|`MonitorGet()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SysGet.htm|`SysGet()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Monitor.htm|`Monitor functions`}
 * @example <caption>__
 * </caption>
 */
MonitorGetWorkArea([Num, &Left, &Top, &Right, &Bottom]) => String

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/MouseClick.htm|`MouseClick()`} clicks or holds down a mouse button, or turns the mouse wheel. Note: The Click function is generally more flexible and easier to use.  
 * {@link https://www.autohotkey.com/docs/v2/lib/CoordMode.htm|`CoordMode()`} dictates where x0 y0 starts at  
 * `Client` is suggested unless working with the desktop  
 * If `Relative` is used, x0 y0 is the mouse cursor.  
 * @param {(String)} [Button] - Mouse button to click:  
 *   - `L`/`Left`, `R`/`Right`, `M`/`Middle`
 *   - `X1` (XButton1), `X2` (XButton2)  
 *   - `WU`/`WheelUp`, `WD`/`WheelDown`, `WR`/`WheelRight`, `WL`/`WheelLeft`  
 * @param {(Integer)} [X] - The X coordinate to click at.  
 * If omitted, the current mouse X value is used
 * @param {(Integer)} [Y] - The Y coordinate to click at  
 * {@link https://www.autohotkey.com/docs/v2/lib/CoordMode.htm|`CoordMode()`} dictates where x0 y0 starts at  
 * If omitted, the current mouse Y value is used
 * @param {(Integer)} [Count] - The number of times to click  
 * If omitted, `1` is used  
 * @param {(Integer)} [Speed] - How fast the mouse is moved to the destination click point.  
 * This number should be between `0` (fastest) and `100` (slowest).  
 * The speed setting only works when {@link https://www.autohotkey.com/docs/v2/lib/SendMode.htm|`SendMode()`} is set to Event.  
 * @param {(String)} [State] - Send the up state, down state, or full click.  
 * - Omit = A full click is sent  
 * - `D` = Down event. The button is logically held down.  
 * - `U` = Up event. The button is logically released.  
 * @param {(String)} [Relative] - Include the letter `R` to click relative to the current mouse position.  
 * `X` and `Y` parameters are used as offsets from the current mouse position.  
 * In other words, the mouse cursor becomes x0 y0.  
 * @returns {(String)} An empty string is always returned.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/CoordMode.htm|`CoordMode()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SendMode.htm|`SendMode()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SetDefaultMouseSpeed.htm|`SetDefaultMouseSpeed()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SetMouseDelay.htm|`SetMouseDelay()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Click.htm|`Click()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/MouseClickDrag.htm|`MouseClickDrag()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/MouseGetPos.htm|`MouseGetPos()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/MouseMove.htm|`MouseMove()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/ControlClick.htm|`ControlClick()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/BlockInput.htm|`BlockInput()`}
 * @example <caption>__
 * </caption>
 */
MouseClick([Button:='L', X:=CurrentX, Y:=CurrentY, Count:=1, Speed:=2, State:=unset, Relative:=unset]) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/MouseClickDrag.htm|`MouseClickDrag()`} clicks and holds the specified mouse button, moves the mouse to the destination coordinates, then releases the button.  
 * {@link https://www.autohotkey.com/docs/v2/lib/CoordMode.htm|`CoordMode()`} dictates where x0 y0 starts at  
 * `Client` is suggested unless working with the desktop  
 * If `Relative` is used, x0 y0 is the mouse cursor.  
 * @param {(String)} [Button] - Mouse button to click:  
 *   - `L`/`Left`, `R`/`Right`, `M`/`Middle`
 *   - `X1` (XButton1), `X2` (XButton2)  
 *   - `WU`/`WheelUp`, `WD`/`WheelDown`, `WR`/`WheelRight`, `WL`/`WheelLeft`  
 * @param {(Integer)} StartX - The X coordinate of the click hold.  
 * @param {(Integer)} StartY - The Y coordinate of the click hold.  
 * @param {(Integer)} EndX - The X coordinate to release the click.  
 * @param {(Integer)} EndY - The Y coordinate to release the click.  
 * @param {(Integer)} [Speed] - How fast the mouse is dragged between the click points.  
 * This number should be between `0` (fastest) and `100` (slowest).  
 * The speed setting only works when {@link https://www.autohotkey.com/docs/v2/lib/SendMode.htm|`SendMode()`} is set to Event.  
 * @param {(String)} [Relative] - Include the letter `R` to click relative to the current mouse position.  
 * `StartX` and `StartY` are treated as offsets from the current mouse position.  
 * `EndX` and `EndY` are treated as offsets of `StartX` and `StartY`, respectively.  
 * @returns {(String)} An empty string is always returned.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/CoordMode.htm|`CoordMode()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SendMode.htm|`SendMode()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SetDefaultMouseSpeed.htm|`SetDefaultMouseSpeed()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SetMouseDelay.htm|`SetMouseDelay()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Click.htm|`Click()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/MouseClick.htm|`MouseClick()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/MouseGetPos.htm|`MouseGetPos()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/MouseMove.htm|`MouseMove()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/BlockInput.htm|`BlockInput()`}
 * @example <caption>__
 * </caption>
 */
MouseClickDrag(Button, StartX, StartY, EndX, EndY [, Speed:=2, Relative:=unset]) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/MouseGetPos.htm|`MouseGetPos()`} retrieves the current position of the mouse cursor, and optionally which window and control it is hovering over.  
 * {@link https://www.autohotkey.com/docs/v2/lib/CoordMode.htm|`CoordMode()`} dictates where x0 y0 starts at  
 * `Client` is suggested unless working with the desktop  
 * On multi-monitor systems with different DPI settings, the returned position may be different than expected due to {@link https://www.autohotkey.com/docs/v2/misc/DPIScaling.htm|`OS DPI scaling`}.
 * @param {(VarRef)} [OutputX] - A variable to receive the X coordinate of the mouse cursor
 * @param {(VarRef)} [OutputY] - A variable to receive the Y coordinate of the mouse cursor
 * @param {(VarRef)} [OutputWin] - A variable to receive the handle of the window under the mouse cursor 
 * @param {(VarRef)} [OutputControl] - A variable to receive the handle of the control under the mouse cursor
 * @param {(Integer)} [ControlFlag] Determines how control is determined:  
 * - `0` = Uses the default method to determine control.  
 * - `1` = Use a simpler method to determine control.    
 *   Can correctly retrieve the active/topmost child window of Multiple Document Interface (MDI) applications like SysEdit or TextPad.  
 *   This is less accurate for other purposes, such as detecting controls inside a GroupBox.  
 * - `2` = `OutputControl` receives the {@link https://www.autohotkey.com/docs/v2/lib/ControlGetHwnd.htm|`control's handle (HWND)`} instead of the {@link https://www.autohotkey.com/docs/v2/lib/ControlGetClassNN.htm|`ClassNN`}.  
 * - `3` = Use both flags `1` and `2`.  
 * @returns {(String)} An empty string is always returned.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/CoordMode.htm|`CoordMode()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SetDefaultMouseSpeed.htm|`SetDefaultMouseSpeed()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Click.htm|`Click()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Win.htm|`Win functions`}
 * @example <caption>__
 * </caption>
 */
MouseGetPos([&OutputX, &OutputY, &OutputWin, &OutputControl, ControlFlag:=0]) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/MouseMove.htm|`MouseMove()`} moves the mouse cursor.  
 * {@link https://www.autohotkey.com/docs/v2/lib/CoordMode.htm|`CoordMode()`} dictates where x0 y0 starts at  
 * `Client` is suggested for most use cases.  
 * @param {(Integer)} X - The X coordinate to move to
 * @param {(Integer)} Y - The Y coordinate to move to
 * @param {(Integer)} [Speed] - How fast the mouse is dragged to the click point.  
 * This number should be between `0` (fastest) and `100` (slowest).  
 * The speed setting only works when {@link https://www.autohotkey.com/docs/v2/lib/SendMode.htm|`SendMode()`} is set to Event.  
 * @param {(String)} [Relative] - Include the letter `R` to click relative to the current mouse position.  
 * `X` and `Y` parameters are used as offsets from the current mouse position.  
 * In other words, the mouse cursor becomes x0 y0.  
 * @returns {(String)} An empty string is always returned.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/CoordMode.htm|`CoordMode()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SendMode.htm|`SendMode()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SetDefaultMouseSpeed.htm|`SetDefaultMouseSpeed()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/SetMouseDelay.htm|`SetMouseDelay()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Click.htm|`Click()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/MouseClick.htm|`MouseClick()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/MouseClickDrag.htm|`MouseClickDrag()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/MouseGetPos.htm|`MouseGetPos()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/BlockInput.htm|`BlockInput()`}
 * @example <caption>__
 * </caption>
 */
MouseMove(X, Y [, Speed, Relative]) => EmptyString

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/MsgBox.htm|`MsgBox()`} displays the specified text in a small window containing one or more customizeable buttons.  
 * @param {(String)} [Text] - Main text to dispaly on the message.  
 * If all params are omitted, `Press OK to Continue` is used otherwise the text is blank.  
 * {@link https://www.autohotkey.com/docs/v2/misc/EscapeChar.htm|`Escape Sequences`} can be used to format the text. ``Line 1`nLine 2``  
 * @param {(String)} [Title] - A title to give the window.  
 * If omitted, {@link https://www.autohotkey.com/docs/v2/Variables.htm#ScriptName|`A_ScriptName`} is used.  
 * @param {(String)} [Options] - Zero or more of the following options:  
 * - `Owner` = Specify a window to make {@link https://www.autohotkey.com/docs/v2/lib/MsgBox.htm#Owner|`owner`} of the message box, where `#` is the {@link https://www.autohotkey.com/docs/v2/misc/WinTitle.htm#ahk_id|`window handle (HWND)`} of the owner.  
 * - `T#` = Timeout. Set a max time for the message box to remain open before closing, where `#` is the number of seconds.  
 *   A float can be used for a more precise wait time. `T2.5` = 2500 ms.  
 *   Timeout must be a decimal value.  
 *   Return value is set to `Timeout` if a message box closes from timing out.  
 * - `MBOpt` = This is the sum of dec OR hex values.  
 *   The string values can be used instead by including them with the string options. `MsgBox('Hi',, '0x4 Icon!')`  
 *   Hex value must be prefixed with a 0x: `0x4`  
 *   Other than Group #5, only one option should be used from each group:  
 *
 *     | Option by Group                                | Decimal   | Hexadecimal | String Value                                |
 *     | :---                                           | :---      | :---        | :---                                        |
 *     | **Group #1: Change button names**              |           |             |                                             |
 *     | `OK`                                           | 0         | 0x0         | `OK` or `O`                                 |
 *     | `OK`, `Cancel`                                 | 1         | 0x1         | `OKCancel`, `O/C`, or `OC`                  |
 *     | `Abort`, `Retry`, `Ignore`                     | 2         | 0x2         | `AbortRetryIgnore`, `A/R/I`, or `ARI`       |
 *     | `Yes`, `No`, `Cancel`                          | 3         | 0x3         | `YesNoCancel`, `Y/N/C`, or `YNC`            |
 *     | `Yes`, `No`                                    | 4         | 0x4         | `YesNo`, `Y/N`, or `YN`                     |
 *     | `Retry`, `Cancel`                              | 5         | 0x5         | `RetryCancel`, `R/C`, or `RC`               |
 *     | `Cancel`, `Try Again`, `Continue`              | 6         | 0x6         | `CancelTryAgainContinue`, `C/T/C`, or `CTC` |
 *     |                                                |           |             |                                             |
 *     | **Group #2: Add Icon**                         |           |             |                                             |
 *     | `Hand` (Stop/Error)                            | 16        | 0x10        | `Iconx`                                     |
 *     | `Question` (?)                                 | 32        | 0x20        | `Icon?`                                     |
 *     | `Exclamation` (!)                              | 48        | 0x30        | `Icon!`                                     |
 *     | `Asterisk` (Info)                              | 64        | 0x40        | `Iconi`                                     |
 *     |                                                |           |             |                                             |
 *     | **Group #3: Set Default Focused Button**       |           |             |                                             |
 *     | `2nd` button                                   | 256       | 0x100       | `Default2`                                  |
 *     | `3rd` button                                   | 512       | 0x200       | `Default3`                                  |
 *     | `4th` button ({@link https://www.autohotkey.com/docs/v2/lib/MsgBox.htm#Help|`Help button`} must be present) | 768 | 0x300 | `Default4`                                 |
 *     |                                                |           |             |                                             |
 *     | **Group #4: Set Modality of Window**           |           |             |                                             |
 *     | `System Modal` (always on top)                 | 4096      | 0x1000      | N/A                                         |
 *     | `Task Modal`                                   | 8192      | 0x2000      | N/A                                         |
 *     | `System Modal, no title bar icon`              | 262144    | 0x40000	  | N/A                                         |
 *     |                                                |           |             |                                             |
 *     | **Group #5: Extras (Include any/all)**         |           |             |                                             |
 *     | Add {@link https://www.autohotkey.com/docs/v2/lib/MsgBox.htm#Help|`Help button`} | 16384 | 0x4000 | N/A                |
 *     | `Right-justified` text                         | 524288    | 0x80000     | N/A                                         |
 *     | `Right-to-left` text direction                 | 1048576   | 0x100000    | N/A                                         |
 *
 * @returns {(String)} The button name clicked is returned  
 * - Empty String = The dialog box couldn't be displayed  
 * - `OK`  
 * - `Cancel`
 * - `Yes`
 * - `No`
 * - `Abort`
 * - `Retry`
 * - `Ignore`
 * - `TryAgain`
 * - `Continue`
 * - `Timeout` = Timeout occurred
 * 
 * Clicking `X` returns different values depending on button names:
 * - `OK` => Returns `OK`
 * - `Cancel` button is present => Returns `Cancel`
 * - `AbortRetryIgnore`, `YesNo` => `X` is disabled and cannot be clicked
 * @throws {(Error)} - `Options` are invalid
 * @throws {(Error)} - {@link https://www.autohotkey.com/docs/v2/lib/MsgBox.htm#max|`MsgBox limit`} has been reached
 * @throws {(Error)} - Message box could not be displayed
 * @see {@link https://www.autohotkey.com/docs/v2/lib/InputBox.htm|`InputBox()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/FileSelect.htm|`FileSelect()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/DirSelect.htm|`DirSelect()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/ToolTip.htm|`ToolTip()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Gui.htm|`Gui object`}
 * @example <caption>__
 * </caption>
 */
MsgBox([Text:='', Title:=A_ScriptName, Options:=0]) => String


/**
 * {@link https://www.autohotkey.com/docs/v2/lib/NumGet.htm|`NumGet()`} returns the binary number stored at the specified address and offset.  
 * @param {(Integer|Buffer)} Source - A memory address or a {@link https://www.autohotkey.com/docs/v2/lib/Buffer.htm|`buffer-like`} object (any object with a {@link https://www.autohotkey.com/docs/v2/lib/Buffer.htm#Ptr|`Ptr`} and {@link https://www.autohotkey.com/docs/v2/lib/Buffer.htm#Size|`Size`} property).  
 * @param {(Integer|String)} OffsetOrDataType - Either an offset or an expected data type  
 * - `Offset` parameter = The number of bytes to offset from `Source` memory address.  
 *   If this is an offset, the `OffsetType` parameter must be set to a data type.  
 * - `DataType` parameter = The data type to get from the beginning of `Source` memory address.  
 *   If this parameter is a data type, the offset is assumed to be `0`.  
 *   Data types:  
 *   - {@link https://www.autohotkey.com/docs/v2/lib/DllCall.htm#Int|`Integer`}: `Int64`, `Int`, `Short`, `Char`  
 *   - {@link https://www.autohotkey.com/docs/v2/lib/DllCall.htm#unsigned|`Unsigned numbers`}: `UInt`, `UShort`, `UChar`  
 *   - Float: `Float`, `Double`  
 *   - {@link https://www.autohotkey.com/docs/v2/lib/DllCall.htm#ptr|`Pointer`}: `Ptr`, `UPtr`
 *   - Unsigned 64-bit integers are not supported as AHK's native type is Int64.  
 *     To work with numbers greater than or equal to `0x8000000000000000`, omit the U prfix and interpret negative values as large integers.  
 * @param {(String)} OffsetType - If `OffsetOrDataType` is an offset, this parameter should be the expected type.  
 * - {@link https://www.autohotkey.com/docs/v2/lib/DllCall.htm#Int|`Integer`}: `Int64`, `Int`, `Short`, `Char`  
 * - {@link https://www.autohotkey.com/docs/v2/lib/DllCall.htm#unsigned|`Unsigned numbers`}: `UInt`, `UShort`, `UChar`  
 * - Float: `Float`, `Double`  
 * - {@link https://www.autohotkey.com/docs/v2/lib/DllCall.htm#ptr|`Pointer`}: `Ptr`, `UPtr`
 * - Unsigned 64-bit integers are not supported as AHK's native type is Int64.  
 *   To work with numbers greater than or equal to `0x8000000000000000`, omit the U prfix and interpret negative values as large integers.  
 * @returns {(Number)} The Integer or Float retrieved from the specified address and offset.  
 * @throws {(Error)} - The `Source` address was not valid  
 * Using a buffer object can help ensure memory addresses are always valid.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/NumPut.htm|`NumPut()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/DllCall.htm|`DllCall()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/VarSetStrCapacity.htm|`VarSetStrCapacity()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Buffer.htm|`Buffer object`}
 * @example <caption>__
 * </caption>
 */
NumGet(Source, [OffsetOrDataType:=0, OffsetType:=unset]) => Number

/**
 * {@link https://www.autohotkey.com/docs/v2/lib/NumPut.htm|`NumPut()`} stores one or more numbers in binary format at the specified address and offset.  
 * @param {(String)} TypePair - The data type of the type-number pair:  
 *   - {@link https://www.autohotkey.com/docs/v2/lib/DllCall.htm#Int|`Integer`}: `Int64`, `Int`, `Short`, `Char`  
 *   - {@link https://www.autohotkey.com/docs/v2/lib/DllCall.htm#unsigned|`Unsigned numbers`}: `UInt`, `UShort`, `UChar`  
 *   - Float: `Float`, `Double`  
 *   - {@link https://www.autohotkey.com/docs/v2/lib/DllCall.htm#ptr|`Pointer`}: `Ptr`, `UPtr`
 *   - Unsigned 64-bit integers are not supported as AHK's native type is Int64.  
 *     To work with numbers greater than or equal to `0x8000000000000000`, omit the U prfix and interpret negative values as large integers.  
 * @param {(Number)} NumberPair - The number of the type-number pair to write to memory.  
 * Any amount of type-number pairs can be passed in before the other parameters:  
 * `NumPut('int', 1, 'int64', 123456, 'float', 2.1, ...)`  
 * @param {(Integer|Buffer)} Target - A memory address or a {@link https://www.autohotkey.com/docs/v2/lib/Buffer.htm|`buffer-like`} object (any object with a {@link https://www.autohotkey.com/docs/v2/lib/Buffer.htm#Ptr|`Ptr`} and {@link https://www.autohotkey.com/docs/v2/lib/Buffer.htm#Size|`Size`} property).  
 * @param {(Integer)} [Offset] - The number of bytes to offset from `Target` memory address.
 * @returns {(Integer)} The next memory address that comes after the data that was just written.  
 * This return value can be used as an offset for repeated NumPut() calls.  
 * If the data is contiguous, it's better to just included multiple `TypePair`-`TypeNumber` declarations.  
 * @throws {(Error)} - The `Target` address was not valid  
 * Using a buffer object can help ensure memory addresses are always valid.  
 * @see {@link https://www.autohotkey.com/docs/v2/lib/NumGet.htm|`NumGet()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/DllCall.htm|`DllCall()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/VarSetStrCapacity.htm|`VarSetStrCapacity()`},
 * {@link https://www.autohotkey.com/docs/v2/lib/Buffer.htm|`Buffer object`}
 * @example <caption>__
 * </caption>
 */
NumPut(TypePair, NumberPair, Target [, Offset:=0]) => Integer

;#endregion
