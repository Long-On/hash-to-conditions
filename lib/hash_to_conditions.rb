require 'ext/array'
require 'ext/hash'
require 'ext/string'

# The HashToConditions gem provides an easy way to build ActiveRecord Array conditions
# directly from a Hash.
#
# A simple example:
#  > {'age.gt' => 18}.to_conditions => ['(age>?)', 18] 
#
# The *age* field is marked up with the *.gt* operator tag, which is processed by the
# +to_conditions+ method in order to produce the result Array condition.
#
# More practical conditions can be constructed through the use of operator tags in combination
# with the *AND* and *OR* boolean operators.
#
# Below is a list of supported tags:
#
# <table style=\"border-collapse:collapse; border: 1px solid \#999\">
# <tr>
# <th style=\"border: 1px solid \#999; width: 80px\">Tag</th>
# <th style=\"border: 1px solid \#999; width: 150px\">SQL equivalent</th>
# </tr>
# <tr>
# <td style=\"border: 1px solid \#999; padding-left: 4px\">.eq</td>
# <td style=\"border: 1px solid \#999; padding-left: 4px\">=</td>
# </tr>
# <tr>
# <td style=\"border: 1px solid \#999; padding-left: 4px\">.ne</td>
# <td style=\"border: 1px solid \#999; padding-left: 4px\">\<\></td>
# </tr>
# <tr>
# <td style=\"border: 1px solid \#999; padding-left: 4px\">.gt</td>
# <td style=\"border: 1px solid \#999; padding-left: 4px\">\></td>
# </tr>
# <tr>
# <td style=\"border: 1px solid \#999; padding-left: 4px\">.ge</td>
# <td style=\"border: 1px solid \#999; padding-left: 4px\">\>=</td>
# </tr>
# <tr>
# <td style=\"border: 1px solid \#999; padding-left: 4px\">.lt</td>
# <td style=\"border: 1px solid \#999; padding-left: 4px\">\<</td>
# </tr>
# <tr>
# <td style=\"border: 1px solid \#999; padding-left: 4px\">.le</td>
# <td style=\"border: 1px solid \#999; padding-left: 4px\">\<=</td>
# </tr>
# <tr>
# <td style=\"border: 1px solid \#999; padding-left: 4px\">.like</td>
# <td style=\"border: 1px solid \#999; padding-left: 4px\">LIKE</td>
# </tr>
# <tr>
# <td style=\"border: 1px solid \#999; padding-left: 4px\">.null</td>
# <td style=\"border: 1px solid \#999; padding-left: 4px\">IS NULL</td>
# </tr>
# <tr>
# <td style=\"border: 1px solid \#999; padding-left: 4px\">.nnull</td>
# <td style=\"border: 1px solid \#999; padding-left: 4px\">IS NOT NULL</td>
# </tr>
# <tr>
# <td style=\"border: 1px solid \#999; padding-left: 4px\">.in</td>
# <td style=\"border: 1px solid \#999; padding-left: 4px\">IN</td>
# </tr>
# <tr>
# <td style=\"border: 1px solid \#999; padding-left: 4px\">.between</td>
# <td style=\"border: 1px solid \#999; padding-left: 4px\">BETWEEN</td>
# </tr>
# </table>
#
# Examples:
#
#  > h = {'AND' => {'name.eq' => 'Ruby', 'version.ge' => 1.9}}
#  > h.to_conditions => ['(name=? AND version>=?)', 'Ruby', 1.9] 
#
#  > h = {'OR' => {'name.like' => 'Lou%', 'age.gt' => 18}}
#  > h.to_conditions => ['(name LIKE ? OR age>?)', 'Lou%', 18] 
#
# Hash keys are not limited to String. Symbol keys are also supported so :'name.eq' is also a valid key.
#
# == Implicit Tags
#
# *.eq* and *.like* are implicit tags. Implicit means the tag can be omitted so the following are
# equivalent:
#
#  > {'name.like' => 'Lou%'}.to_conditions => ['(name LIKE ?)', 'Lou%']
#  > {'name' => 'Lou%'}.to_conditions => ['(name LIKE ?)', 'Lou%']
#
# Similarly,
#
#  > {'name.eq' => 'Ruby', 'version.eq' => 1.9}.to_conditions => ["(name=? AND version=?)", "Ruby", 1.9]
#  > {'name' => 'Ruby', 'version' => 1.9}.to_conditions => ["(name=? AND version=?)", "Ruby", 1.9]
#
# Note the *AND* boolean operator is omitted in the hashes above. It also is an implicit
# operator, except when used as a nested condition.
#
# Having these as implicits seem natural and can help reduce a few extra key-strokes.
#
# == Nested Conditions
#
# Nested conditions allow more complex queries to be constructed.
#
# For example:
#
#  > nested_h = {'name' => 'Lou%', 'age.gt' => 18}
#  > h = {'OR' => {'AND' => nested_h, 'salary.between' => '50k, 100k'}}
#  > h.to_conditions => ['((name LIKE ? AND age>?) OR salary BETWEEN ? AND ?)', 'Lou%', 18, '50k', '100k'] 
#
# However, one can easily get into trouble nesting with hashes. It is easy to create many nestings or
# a cyclic one. Therefore nesting is limited to a maximum of 42 within a root hash. An
# exception with *nested_too_deep_or_cyclic* message is raised when this happens.
#
# <br />
# ---
# Copyright (c) 2013 Long On, released under the MIT license

module HashToConditions

class HashToConditions
end

end
