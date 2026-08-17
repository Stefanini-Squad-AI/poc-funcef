inherited frmImportarTabua: TfrmImportarTabua
  Left = 122
  Top = 89
  HelpContext = 40379
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Importar Tábua'
  ClientHeight = 439
  ClientWidth = 595
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 595
    Height = 400
    object GroupBox1: TGroupBox
      Left = 20
      Top = 16
      Width = 324
      Height = 140
      Caption = 'Importação de Tábuas'
      TabOrder = 0
      object Label1: TLabel
        Left = 14
        Top = 20
        Width = 84
        Height = 13
        Caption = 'Tipo de Tábua'
      end
      object Label2: TLabel
        Left = 11
        Top = 91
        Width = 85
        Height = 13
        Caption = 'Fator Multiplic.'
      end
      object Label3: TLabel
        Left = 25
        Top = 115
        Width = 71
        Height = 13
        Caption = 'Idade Inicial'
      end
      object DBCmbBxTabuaGeral: TwwDBLookupCombo
        Left = 14
        Top = 35
        Width = 293
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DS_TABUA'#9'40'#9'Tábua')
        LookupTable = qryTabua
        LookupField = 'CD_TABUA'
        Options = [loColLines, loRowLines]
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnChange = DBCmbBxTabuaGeralChange
      end
      object RdBttnCalcTab: TCheckBox
        Left = 14
        Top = 65
        Width = 183
        Height = 17
        Caption = 'Calcular a partir do lx inicial'
        TabOrder = 1
        OnClick = RdBttnCalcTabClick
      end
      object DBEdtLx: TDBEdit
        Left = 199
        Top = 63
        Width = 101
        Height = 21
        DataField = 'NR_L_X'
        DataSource = DtSrcLx
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 14
        ParentFont = False
        TabOrder = 2
        Visible = False
      end
      object DBEdtFator: TDBEdit
        Left = 100
        Top = 87
        Width = 163
        Height = 21
        Hint = 'Fator multiplicativo do l_x da tábua'
        DataField = 'NR_I_X'
        DataSource = DtSrcLx
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 14
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
      end
      object DBEdit1: TDBEdit
        Left = 100
        Top = 111
        Width = 50
        Height = 21
        Hint = 'Idade inicial da tábua'
        DataField = 'NR_IDADE'
        DataSource = DtSrcLx
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 14
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
      end
    end
    object GroupBox2: TGroupBox
      Left = 20
      Top = 160
      Width = 324
      Height = 228
      Caption = 'Seleção do Arquivo'
      TabOrder = 1
      object Label4: TLabel
        Left = 14
        Top = 20
        Width = 39
        Height = 13
        Caption = 'Drive: '
      end
      object DriveComboBox1: TDriveComboBox
        Left = 50
        Top = 18
        Width = 263
        Height = 19
        DirList = DirListBox
        TabOrder = 0
        TextCase = tcUpperCase
      end
      object DirListBox: TDirectoryListBox
        Left = 10
        Top = 40
        Width = 155
        Height = 158
        FileList = FListBox
        ItemHeight = 16
        TabOrder = 1
        OnChange = DirListBoxChange
      end
      object FListBox: TFileListBox
        Left = 168
        Top = 39
        Width = 145
        Height = 183
        ItemHeight = 13
        Mask = '*.txt'
        TabOrder = 2
        OnClick = FListBoxClick
      end
      object FilterComboBox1: TFilterComboBox
        Left = 10
        Top = 201
        Width = 155
        Height = 21
        FileList = FListBox
        Filter = 'Arquivos Texto (*.txt)|*.txt'
        TabOrder = 3
      end
    end
    object GroupBox3: TGroupBox
      Left = 352
      Top = 15
      Width = 225
      Height = 140
      Caption = 'Colunas'
      TabOrder = 2
      object Label5: TLabel
        Left = 122
        Top = 31
        Width = 64
        Height = 13
        Caption = 'Delimitador'
      end
      object Panel1: TPanel
        Left = 69
        Top = 26
        Width = 40
        Height = 99
        BevelOuter = bvNone
        TabOrder = 1
        object edt1: TEdit
          Tag = 1
          Left = 2
          Top = 4
          Width = 23
          Height = 21
          TabOrder = 0
          Text = '1'
          Visible = False
          OnEnter = edt6Enter
          OnExit = edt6Exit
        end
        object edt2: TEdit
          Tag = 2
          Left = 2
          Top = 20
          Width = 23
          Height = 21
          TabOrder = 1
          Text = '2'
          Visible = False
          OnEnter = edt6Enter
          OnExit = edt6Exit
        end
        object edt3: TEdit
          Tag = 3
          Left = 2
          Top = 36
          Width = 23
          Height = 21
          TabOrder = 2
          Text = '3'
          Visible = False
          OnEnter = edt6Enter
          OnExit = edt6Exit
        end
        object edt4: TEdit
          Tag = 4
          Left = 2
          Top = 52
          Width = 23
          Height = 21
          TabOrder = 3
          Text = '4'
          Visible = False
          OnEnter = edt6Enter
          OnExit = edt6Exit
        end
        object edt5: TEdit
          Tag = 5
          Left = 2
          Top = 68
          Width = 23
          Height = 21
          TabOrder = 4
          Text = '5'
          Visible = False
          OnEnter = edt6Enter
          OnExit = edt6Exit
        end
        object edt6: TEdit
          Tag = 6
          Left = 2
          Top = 84
          Width = 23
          Height = 21
          TabOrder = 5
          Text = '6'
          Visible = False
          OnEnter = edt6Enter
          OnExit = edt6Exit
        end
      end
      object ChckLstBxColunas: TCheckListBox
        Left = 14
        Top = 30
        Width = 56
        Height = 95
        OnClickCheck = ChckLstBxColunasClickCheck
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ItemHeight = 15
        Items.Strings = (
          'Idade'
          'lx'
          'px'
          'dx'
          'qx'
          'ix')
        ParentFont = False
        TabOrder = 0
      end
      object MskEdtDelim: TMaskEdit
        Left = 129
        Top = 49
        Width = 19
        Height = 21
        Hint = 'Delimitador de campos do arquivo .txt'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 1
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        Text = ';'
      end
    end
    object GroupBox4: TGroupBox
      Left = 352
      Top = 160
      Width = 225
      Height = 228
      Caption = 'Arquivo Selecionado'
      TabOrder = 3
      object Label6: TLabel
        Left = 14
        Top = 22
        Width = 49
        Height = 13
        Caption = 'Diretório'
      end
      object Label7: TLabel
        Left = 14
        Top = 67
        Width = 44
        Height = 13
        Caption = 'Arquivo'
      end
      object edtDiretorio: TEdit
        Left = 14
        Top = 37
        Width = 202
        Height = 21
        Color = clSilver
        ReadOnly = True
        TabOrder = 0
      end
      object EdtArqSelec: TEdit
        Left = 14
        Top = 82
        Width = 202
        Height = 21
        Color = clSilver
        ReadOnly = True
        TabOrder = 1
      end
      object BtBtnOk: TBitBtn
        Left = 74
        Top = 116
        Width = 80
        Height = 33
        Caption = '&OK'
        Enabled = False
        TabOrder = 2
        OnClick = BtBtnOkClick
        Kind = bkOK
        Spacing = 2
      end
      object BtBtnCadTabua: TBitBtn
        Left = 51
        Top = 178
        Width = 123
        Height = 36
        Caption = '&Cadastrar Tábua'
        ModalResult = 4
        TabOrder = 3
        OnClick = BtBtnCadTabuaClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
          33333333333F8888883F33330000324334222222443333388F3833333388F333
          000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
          F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
          223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
          3338888300003AAAAAAA33333333333888888833333333330000333333333333
          333333333333333333FFFFFF000033333333333344444433FFFF333333888888
          00003A444333333A22222438888F333338F3333800003A2243333333A2222438
          F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
          22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
          33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
          3333333333338888883333330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
        Spacing = 0
      end
    end
  end
  inherited Dock971: TDock97
    Top = 400
    Width = 595
    inherited tb97Fundo: TToolbar97
      Left = 377
      DockPos = 377
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryTabua: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select a.CD_TABUA, a.SG_TABUA, a.DT_REF_TABUA,'
      '       a.DS_TABUA, b.IR_DOMINIO_SISTEMA'
      'from FI_TABUA a, FI_TIPO_TABUA b'
      'where a.CD_TIPO_TABUA = b.CD_TIPO_TABUA'
      'order by a.DS_TABUA ')
    ValidateWithMask = True
    Left = 188
    Top = 19
    object qryTabuaDS_TABUA: TStringField
      DisplayLabel = 'Tábua'
      DisplayWidth = 40
      FieldName = 'DS_TABUA'
      Origin = '"CM.FI_TABUA".DS_TABUA'
      Size = 50
    end
    object qryTabuaCD_TABUA: TFloatField
      FieldName = 'CD_TABUA'
      Origin = '"CM.FI_TABUA".CD_TABUA'
      Visible = False
    end
    object qryTabuaSG_TABUA: TStringField
      FieldName = 'SG_TABUA'
      Origin = '"CM.FI_TABUA".SG_TABUA'
      Visible = False
      Size = 15
    end
    object qryTabuaDT_REF_TABUA: TDateTimeField
      FieldName = 'DT_REF_TABUA'
      Origin = '"CM.FI_TABUA".DT_REF_TABUA'
      Visible = False
    end
    object qryTabuaIR_DOMINIO_SISTEMA: TStringField
      FieldName = 'IR_DOMINIO_SISTEMA'
      Origin = '"CM.FI_TIPO_TABUA".IR_DOMINIO_SISTEMA'
      Visible = False
      Size = 3
    end
  end
  object QryLx: TQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'Select * '
      'from FI_OCORR_TABUA'
      'where CD_TABUA = 0')
    Left = 281
    Top = 165
    object QryLxNR_L_X: TFloatField
      FieldName = 'NR_L_X'
      Origin = '"CM.FI_OCORR_TABUA".NR_L_X'
    end
    object QryLxNR_IDADE: TFloatField
      FieldName = 'NR_IDADE'
      Origin = '"CM.FI_OCORR_TABUA".NR_IDADE'
    end
    object QryLxNR_I_X: TFloatField
      FieldName = 'NR_I_X'
      Origin = '"CM.FI_OCORR_TABUA".NR_I_X'
    end
  end
  object DtSrcLx: TDataSource
    DataSet = QryLx
    Left = 256
    Top = 165
  end
  object DtSrcInsOcorrTabua: TDataSource
    DataSet = QryInsOcorrTabua
    Left = 256
    Top = 201
  end
  object QryInsOcorrTabua: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'insert into fi_ocorr_tabua'
      '  (CD_TABUA, NR_IDADE, NR_L_X, NR_P_X, NR_D_X, NR_Q_X, NR_I_X)'
      'values'
      '  (:CD_TABUA, :NR_IDADE, :NR_L_X, :NR_P_X, :NR_D_X, :NR_Q_X, '
      '   :NR_I_X)')
    Left = 280
    Top = 201
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_TABUA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NR_IDADE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'NR_L_X'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'NR_P_X'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'NR_D_X'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'NR_Q_X'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'NR_I_X'
        ParamType = ptUnknown
      end>
    object QryInsOcorrTabuaSQ_TABUA: TIntegerField
      FieldName = 'CD_TABUA'
      Origin = 'OCORR_TABUA.SQ_TABUA'
    end
    object QryInsOcorrTabuaNR_IDADE: TIntegerField
      FieldName = 'NR_IDADE'
      Origin = 'OCORR_TABUA.NR_IDADE'
    end
    object QryInsOcorrTabuaNR_L_X: TFloatField
      FieldName = 'NR_L_X'
      Origin = 'OCORR_TABUA.NR_L_X'
      DisplayFormat = '##,##0.0000'
    end
    object QryInsOcorrTabuaNR_P_X: TFloatField
      FieldName = 'NR_P_X'
      Origin = 'OCORR_TABUA.NR_P_X'
    end
    object QryInsOcorrTabuaNR_D_X: TFloatField
      FieldName = 'NR_D_X'
      Origin = 'OCORR_TABUA.NR_D_X'
    end
    object QryInsOcorrTabuaNR_Q_X: TFloatField
      FieldName = 'NR_Q_X'
      Origin = 'OCORR_TABUA.NR_Q_X'
    end
    object QryInsOcorrTabuaNR_I_X: TFloatField
      FieldName = 'NR_I_X'
      Origin = 'OCORR_TABUA.NR_I_X'
    end
  end
  object qryOcorrencias: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    DataSource = dsTabua
    SQL.Strings = (
      'Select CD_TABUA, NR_IDADE'
      'from FI_OCORR_TABUA'
      'where CD_TABUA = :CD_TABUA')
    UpdateObject = UpdtSQLOcorr
    ValidateWithMask = True
    Left = 505
    Top = 162
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CD_TABUA'
        ParamType = ptUnknown
      end>
  end
  object dsTabua: TwwDataSource
    AutoEdit = False
    DataSet = qryTabua
    Left = 221
    Top = 20
  end
  object UpdtSQLOcorr: TUpdateSQL
    ModifySQL.Strings = (
      'update FI_OCORR_TABUA'
      'set'
      '  CD_TABUA = :CD_TABUA,'
      '  NR_IDADE = :NR_IDADE'
      'where'
      '  CD_TABUA = :OLD_CD_TABUA and'
      '  NR_IDADE = :OLD_NR_IDADE')
    InsertSQL.Strings = (
      'insert into FI_OCORR_TABUA'
      '  (CD_TABUA, NR_IDADE)'
      'values'
      '  (:CD_TABUA, :NR_IDADE)')
    DeleteSQL.Strings = (
      'delete from FI_OCORR_TABUA'
      'where'
      '  CD_TABUA = :OLD_CD_TABUA and'
      '  NR_IDADE = :OLD_NR_IDADE')
    Left = 540
    Top = 162
  end
end
