inherited buildListForm: TbuildListForm
  Caption = #1054#1073#1098#1077#1082#1090#1099
  ExplicitWidth = 603
  ExplicitHeight = 493
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlData: TPanel
    inherited dbgList: TcxGrid
      inherited dbgListView: TcxGridDBTableView
        OnCellDblClick = dbgListViewCellDblClick
        object dbgListViewguid: TcxGridDBColumn
          DataBinding.FieldName = 'guid'
          Visible = False
          VisibleForCustomization = False
          Width = 137
        end
        object dbgListViewname: TcxGridDBColumn
          Caption = #1054#1073#1098#1077#1082#1090
          DataBinding.FieldName = 'name'
          Width = 281
        end
        object dbgListVieworganization_name: TcxGridDBColumn
          Caption = #1058#1080#1087' '#1091#1087#1088#1072#1074#1083#1077#1085#1080#1103
          DataBinding.FieldName = 'organization_name'
          Width = 258
        end
        object dbgListViewis_active: TcxGridDBColumn
          Caption = #1059#1095#1077#1090
          DataBinding.FieldName = 'is_active'
          Width = 50
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
    ImageInfo = <
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000001111114011111140111111400000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000343434FF343434FF343434FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000343434FF343434FF343434FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000343434FF343434FF343434FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000011111140111111401111114011111140343434FF343434FF343434FF1111
          1140111111401111114011111140000000000000000000000000000000000000
          0000343434FF343434FF343434FF343434FF343434FF343434FF343434FF3434
          34FF343434FF343434FF343434FF000000000000000000000000000000000000
          0000343434FF343434FF343434FF343434FF343434FF343434FF343434FF3434
          34FF343434FF343434FF343434FF000000000000000000000000000000000000
          00001A1A1AFF1A1A1AFF1A1A1AFF1A1A1AFF343434FF343434FF343434FF1A1A
          1AFF1A1A1AFF1A1A1AFF1A1A1AFF000000000000000000000000000000000000
          000000000000000000000000000000000000343434FF343434FF343434FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000343434FF343434FF343434FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000343434FF343434FF343434FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000001A1A1AFF1A1A1AFF1A1A1AFF0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000101
          0104010101080000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000202
          0217161616570C0C0C340404041C010101040000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000101
          011F2F2F2FFF2E2E2EDB1C1C1C8C020202170101010400000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00001E1E1ED42F2F2FFF151515D11111114D0E0E0E4001010104000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000007070771151515D11111114D2E2E2EDB2E2E2EDB0E0E0E40010101040000
          0000000000000000000000000000000000000000000000000000000000000000
          00000101010F020202232A2A2AD9343434FF343434FF2E2E2EDB0E0E0E400101
          0104000000000000000000000000000000000000000000000000000000000000
          0000000000000101010F141414D02F2F2FFF343434FF343434FF2E2E2EDB0E0E
          0E40010101040000000000000000000000000000000000000000000000000000
          000000000000000000000101010F141414D02F2F2FFF343434FF343434FF2E2E
          2EDB0E0E0E400101010400000000000000000000000000000000000000000000
          00000000000000000000000000000101010F141414D02F2F2FFF343434FF3434
          34FF2E2E2EDB0E0E0E4001010104000000000000000000000000000000000000
          0000000000000000000000000000000000000101010F141414D02F2F2FFF3434
          34FF343434FF2A2A2AD902020217010101040000000000000000000000000000
          000000000000000000000000000000000000000000000101010F141414D02F2F
          2FFF2F2F2FFF151515D11111114D0E0E0E400000000000000000000000000000
          00000000000000000000000000000000000000000000000000000101010F1414
          14D0151515D11111114D2E2E2EDB2C2C2CDA0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000101
          010F020202232A2A2AD9323232FF1C1C1CF00000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000101010F141414D01B1B1BF00202022F0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000101010F0101011F000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000020202100909092C0A0A0A300A0A0A300909
          092C020202100000000000000000000000000000000000000000000000000000
          000000000000010101040909092C1B1B1B6F272727C11F1F1FC81F1F1FC82727
          27C11B1B1B6F0909092C01010104000000000000000000000000000000000000
          0000010101040E0E0E402B2B2BC3272727FF141414DF0909098F0909098F1414
          14DF262626FF2B2B2BC30E0E0E40010101040000000000000000000000000000
          00000C0C0C3C2E2E2EDB272727FF090909810A0A0A3011111140111111400A0A
          0A3007070771272727FF2E2E2EDB0C0C0C3C0000000000000000000000000505
          05202D2D2DCF2E2E2EFF0707077F0C0C0C3C212121C9212121FF343434FF2D2D
          2DCF0C0C0C3C0707077F2E2E2EFF2D2D2DCF0505052000000000000000001515
          158F343434FF262626CC010101042D2D2DCF0E0E0EA212121260343434FF3434
          34FF2D2D2DCF01010108262626CC343434FF1515158F00000000000000000707
          077F2E2E2EFF2E2E2EDB0A0A0A38343434FF121212502B2B2BC3343434FF3434
          34FF343434FF0B0B0B422E2E2EDB2E2E2EFF0707077F00000000000000000000
          0000111111C02F2F2FFF2B2B2BC3343434FF313131E7343434FF343434FF3434
          34FF343434FF282828B72F2F2FFF111111C00000000000000000000000000000
          00000101010F141414D02C2C2CFF343434FF343434FF343434FF343434FF3434
          34FF343434FF2C2C2CFF141414D00101010F0000000000000000000000000000
          0000000000000101010F0D0D0DAF212121FF2C2C2CFF2E2E2EFF2E2E2EFF2C2C
          2CFF212121FF0D0D0DAF0101010F000000000000000000000000000000000000
          00000000000000000000000000000202023F0D0D0DAF0F0F0FBF0F0F0FBF0D0D
          0DAF0202023F0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000070707280C0C0C340101010400000000000000000101
          01040C0C0C340707072800000000000000000000000000000000000000000000
          00000000000007070728282828B72E2E2EDB0E0E0E4001010104010101040E0E
          0E402E2E2EDB282828B707070728000000000000000000000000000000000000
          000000000000232323B3343434FF343434FF2E2E2EDB0E0E0E400E0E0E402E2E
          2EDB343434FF343434FF232323B3000000000000000000000000000000000000
          000000000000141414D02F2F2FFF343434FF343434FF2E2E2EDB2E2E2EDB3434
          34FF343434FF2F2F2FFF141414D0000000000000000000000000000000000000
          0000000000000101010F141414D02F2F2FFF343434FF343434FF343434FF3434
          34FF2F2F2FFF141414D00101010F000000000000000000000000000000000000
          00000000000000000000010101132A2A2AD9343434FF343434FF343434FF3434
          34FF2A2A2AD90101011300000000000000000000000000000000000000000000
          000000000000010101040E0E0E402E2E2EDB343434FF343434FF343434FF3434
          34FF2E2E2EDB0E0E0E4001010104000000000000000000000000000000000000
          0000000000000E0E0E402E2E2EDB343434FF343434FF2F2F2FFF2F2F2FFF3434
          34FF343434FF2E2E2EDB0E0E0E40000000000000000000000000000000000000
          000000000000232323D7343434FF343434FF2F2F2FFF141414D0141414D02F2F
          2FFF343434FF343434FF232323D7000000000000000000000000000000000000
          0000000000000B0B0B9F2A2A2AFF2F2F2FFF141414D00101010F0101010F1414
          14D02F2F2FFF2A2A2AFF0B0B0B9F000000000000000000000000000000000000
          000000000000000000000B0B0B9F111111CF0101010F00000000000000000101
          010F111111CF0B0B0B9F00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end>
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
