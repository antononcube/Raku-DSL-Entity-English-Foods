=begin comment
#==============================================================================
#
#   Food enities grammar in Raku
#   Copyright (C) 2021  Anton Antonov
#
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#   Written by Anton Antonov,
#   antononcube @ posteo . net,
#   Windermere, Florida, USA.
#
#==============================================================================
#
#   For more details about Raku see https://raku.org/ .
#
#==============================================================================
=end comment

use v6;

use DSL::Shared::Roles::PredicateSpecification;
use DSL::Shared::Roles::ErrorHandling;

use DSL::Entity::Foods::Grammar::EntityNames;

grammar DSL::Entity::Foods::Grammar
        does DSL::Shared::Roles::ErrorHandling
        does DSL::Entity::Foods::Grammar::EntityNames {
    # TOP
    rule TOP {
        <pipeline-command> |
        <food-entity-command> |
        <love-food-entity-command> |
        <cooking-food-entity-command> |
        <data-query-command>
    }

    rule food-entity-command { <entity-food-name> }

    rule love-food-entity-command { 'i' [ 'want' | 'crave' ] <entity-food-name> }

    rule data-query-command { [ 'how' 'many' | 'what' 'count' ] .'of' <entity-food-name> 'is' 'in' 'my' [ 'fridge' | 'refrigerator' ] }

    rule cooking-food-entity-command {
        'i' [ 'want' | 'plan' ] 'to' 'cook' <entity-food-name> |
        [ 'tell' 'me' | 'give' 'directions' ] 'how' 'to' 'cook' <entity-food-name> |
        'instruct' 'me' 'to' 'cook' <entity-food-name>
    }

}

