inherited buildListForm: TbuildListForm
  Caption = 'buildListForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlData: TPanel
    inherited dbgList: TcxGrid
      inherited dbgListView: TcxGridDBTableView
        object dbgListViewguid: TcxGridDBColumn
          DataBinding.FieldName = 'guid'
          Width = 137
        end
        object dbgListViewname: TcxGridDBColumn
          DataBinding.FieldName = 'name'
          Width = 216
        end
        object dbgListVieworganization_name: TcxGridDBColumn
          DataBinding.FieldName = 'organization_name'
          Width = 216
        end
        object dbgListViewis_active: TcxGridDBColumn
          DataBinding.FieldName = 'is_active'
          Width = 20
        end
      end
    end
  end
  inherited bmnList: TdxBarManager
    DockControlHeights = (
      0
      0
      28
      0)
  end
  inherited imlList: TcxImageList
    FormatVersion = 1
  end
  inherited qData: TUniQuery
    SQL.Strings = (
      'SELECT '
      'b.guid'
      ', b.name AS name'
      ', b.is_active'
      ', bo.name AS organization_name'
      'FROM m_building b'
      
        'LEFT JOIN m_building_organization bo ON b.organization_id = bo.i' +
        'd'
      'ORDER BY b.name')
    object qDataguid: TWideStringField
      FieldName = 'guid'
      Size = 36
    end
    object qDataname: TWideStringField
      FieldName = 'name'
      Size = 255
    end
    object qDatais_active: TBooleanField
      FieldName = 'is_active'
    end
    object qDataorganization_name: TWideStringField
      FieldName = 'organization_name'
      ReadOnly = True
      Size = 255
    end
  end
end
