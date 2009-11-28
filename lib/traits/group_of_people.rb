module Traits
  # Provides common functionality for groups of people
  # where members are
  #
  # Expectation from hosting class:
  #
  #
  module GroupOfPeople

    #
    # API
    #

    def members
      raise NotImplementedError
    end # members

    def memberships
      raise NotImplementedError
    end # memberships

    def administrators
      self.members.all(:role => :administrator)
    end # administrators

    def regular_members
      self.members.all(:role => :regular_member)
    end # regular_members

    def add_member(person, options = {})
      raise(ArgumentError) unless person
      return if person.member_of?(self)

      role = options.fetch(:role, :regular_member)

      self.memberships.create(:group => self, :person => person, :role => role)
    end # add_member(person, options = {})

    def remove_member(person)
      raise(ArgumentError) unless person
      raise(ArgumentError, "#{person.inspect} is not member of #{self.inspect}") unless person.member_of?(self)

      self.membership_of(person).destroy
    end # remove_member(person)

    #
    # Implementation
    #

    # ...
  end # GroupOfPeople
end # Traits
