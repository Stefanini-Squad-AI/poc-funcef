inherited frmParamOcorrExames: TfrmParamOcorrExames
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'Tabela de Ocorrências e Exames'
  ClientHeight = 297
  ClientWidth = 462
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 462
    Height = 258
    BorderWidth = 2
    Font.Style = []
    ParentFont = False
    object gbxOcorr: TGroupBox
      Left = 13
      Top = 6
      Width = 436
      Height = 187
      Caption = 'Ocorrências'
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      object chklstOcorr: TCheckListBox
        Left = 8
        Top = 15
        Width = 420
        Height = 139
        OnClickCheck = chklstOcorrClickCheck
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        Style = lbOwnerDrawFixed
        TabOrder = 0
        OnDrawItem = chklstOcorrDrawItem
      end
      object bbtnSelTodos: TBitBtn
        Left = 8
        Top = 157
        Width = 202
        Height = 25
        Caption = '   Seleciona Todos'
        TabOrder = 1
        TabStop = False
        OnClick = bbtnSelTodosClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333333333333333333333333333333333333333300000
          0003333333388888888333333330FF9FFF0333333338FF7FFF8333333000F999
          FF0333333888F777FF83333330F099F99F03333338F877F77F83333000F09FFF
          9903333888F87FFF77833330F090FFFFF9933338F878FFFFF7733000F0900000
          00993888F8788888887730F090FFFFF9933338F878FFFFF7733330F090000000
          993338F87888888877333090FFFFF99333333878FFFFF7733333309000000099
          3333387888888877333330FFFFF99333333338FFFFF773333333300000009933
          3333388888887733333333333333333333333333333333333333}
        NumGlyphs = 2
        Spacing = 0
      end
      object bbtnInverteSel: TBitBtn
        Left = 226
        Top = 157
        Width = 202
        Height = 25
        Caption = '   Inverte Seleção'
        TabOrder = 2
        TabStop = False
        OnClick = bbtnInverteSelClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333333333000000003333333388888888333333330FFF
          FFF0333333338FFFFFF8333000330FFFFFF0333788338FFFFFF8333033330FFF
          FFF0333833338FFFFFF8330003330FFFFFF0337783338FFFFFF8333033330FFF
          FFF0333833338FFFFFF833333333000000003333333388888888000000003333
          333388888888333333330FF9FFF0333303338FF7FFF8333383330F999FF03330
          00338F777FF833387733099F99F033330333877F77F83333833309FFF9903300
          033387FFF778338873330FFFFF99333333338FFFFF7733333333000000099333
          3333888888877333333333333333333333333333333333333333}
        NumGlyphs = 2
        Spacing = 0
      end
    end
    object rgOrderBy: TRadioGroup
      Left = 13
      Top = 198
      Width = 172
      Height = 47
      Caption = 'Sequência de Emissão'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Por Código'
        'Alfabética')
      TabOrder = 1
    end
    object gbxTipoPapel: TGroupBox
      Left = 194
      Top = 198
      Width = 255
      Height = 47
      Caption = 'Tipo de Papel'
      TabOrder = 2
      object cmbTipoPapel: TComboBox
        Left = 8
        Top = 17
        Width = 239
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
      end
    end
  end
  inherited Dock971: TDock97
    Top = 258
    Width = 462
    inherited tb97Fundo: TToolbar97
      Left = 292
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 125
      inherited ToolbarSep971: TToolbarSep97
        Visible = False
      end
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 19
    Top = 242
  end
  object qryOcorr: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CODTIPOOCMED, DESCRTIPOOCMED'
      'FROM '
      '  TIPOCMED '
      'ORDER BY '
      '  UPPER(DESCRTIPOOCMED)')
    ValidateWithMask = True
    Left = 82
    Top = 242
  end
end
