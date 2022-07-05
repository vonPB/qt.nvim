local function header(name, parent)

  local raw = [[
#pragma once
#include <]] .. parent .. [[>

QT_BEGIN_NAMESPACE
namespace Ui { class ]] .. name .. [[; }
QT_END_NAMESPACE

class ]] .. name .. [[ : public ]] .. parent .. [[ {
Q_OBJECT

public:
    explicit ]] .. name .. [[(QWidget *parent = nullptr);

    ~]] .. name .. [[() override;

private:
    Ui::]] .. name .. [[ *ui;
};
]]

  return raw
end

local function implementation(name, parent)
  return [[
#include "]] .. name .. [[.h"
#include "ui_]] .. name .. [[.h"


]] .. name .. [[::]] .. name .. [[(QWidget *parent) :
        ]] .. parent .. [[(parent), ui(new Ui::]] .. name .. [[) {
    ui->setupUi(this);
}

]] .. name .. [[::~]] .. name .. [[() {
    delete ui;
}
]]
end

local function ui(name, parent)
  return [[
<?xml version="1.0" encoding="UTF-8"?>
<ui version="4.0">
    <author/>
    <comment/>
    <exportmacro/>
    <class>]] .. name .. [[</class>
    <widget class="]] .. parent .. [[" name="]] .. name .. [[">
        <property name="geometry">
            <rect>
                <x>0</x>
                <y>0</y>
                <width>400</width>
                <height>300</height>
            </rect>
        </property>
        <property name="windowTitle">
            <string>]] .. name .. [[</string>
        </property>
    </widget>
    <pixmapfunction/>
    <connections/>
</ui>
]]
end

return { header = header, implementation = implementation, ui = ui }
