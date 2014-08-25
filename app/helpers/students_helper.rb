module StudentsHelper

  def full_name(collection)
    if collection.present?
        link_to([collection.name, collection.surname].join(" "), collection)
    end
  end

  def full_university(collection)
    if collection.present? && collection.university
        link_to([collection.university, collection.graduation % 100].join(" '"), collection)
    end
  end

end