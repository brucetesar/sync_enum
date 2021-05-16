# frozen_string_literal: true

# Author: Bruce Tesar

# Allows a collection of enumerators to be iterated over in parallel,
# using the same call to next as a normal enumerator.
class SyncEnum
  # Returns a new SyncEnum, containing each of the enumerators
  # provided as arguments to #new.
  # === Parameters
  # * *enums - each argument is a distinct enumerator, and the returned
  #   arrays of values are ordered exactly as the enumerators are in
  #   the argument list.
  # :call-seq:
  #   new(*enums) -> sync_enum
  def initialize(*enums)
    @enum_bank = enums
  end

  # Returns an array containing the next set of values. The first
  # value in the returned array is the next element of the first
  # enumerator, the second value in the returned array is the next
  # element of the second enumerator, and so forth.
  #
  # A StopIteration exception is raised as soon as next is called and
  # one of the enumerators is out of elements. If no enumerators were
  # provided to the constructor, StopIteration is raised on the first
  # call to next.
  # :call-seq:
  #   next -> array or raise StopIteration
  def next
    raise StopIteration if @enum_bank.empty?

    @enum_bank.map(&:next)
  end
end
