inherited frmParamRelInterfaceEnvio: TfrmParamRelInterfaceEnvio
  Left = 197
  Top = 19
  Caption = 'Interface de Envio para a Patrocinadora'
  ClientHeight = 481
  ClientWidth = 733
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 734
    Height = 444
    Align = alNone
    object Label1: TLabel
      Left = 9
      Top = 5
      Width = 80
      Height = 13
      Caption = 'Patrocinadora'
    end
    object Label5: TLabel
      Left = 307
      Top = 5
      Width = 98
      Height = 13
      Caption = 'Opções de Envio'
    end
    object pnlGeral: TPanel
      Left = 5
      Top = 154
      Width = 721
      Height = 293
      BevelOuter = bvNone
      BorderWidth = 6
      TabOrder = 1
      object Splitter1: TSplitter
        Left = 6
        Top = 6
        Width = 3
        Height = 281
        Cursor = crHSplit
      end
      object pgctrlInterface: TPageControl
        Left = 2
        Top = 0
        Width = 719
        Height = 284
        ActivePage = tbsContrib
        TabOrder = 0
        object tbsContrib: TTabSheet
          Caption = 'Contribuições'
          object SplitterContrib: TSplitter
            Left = 0
            Top = 0
            Width = 711
            Height = 0
            Cursor = crVSplit
            Align = alTop
          end
          object scrllContrib: TScrollBox
            Left = 6
            Top = 4
            Width = 346
            Height = 113
            TabOrder = 0
            object pgctrlPlanos: TPageControl
              Left = 0
              Top = 1
              Width = 342
              Height = 108
              ActivePage = tbsPlanos
              TabOrder = 0
              object tbsPlanos: TTabSheet
                Caption = 'Planos'
                object scrlPlanos: TScrollBox
                  Left = 2
                  Top = 0
                  Width = 330
                  Height = 80
                  Color = clBtnFace
                  ParentColor = False
                  TabOrder = 0
                  object clbPlanos: TCheckListBox
                    Left = 0
                    Top = 0
                    Width = 326
                    Height = 76
                    BorderStyle = bsNone
                    ItemHeight = 13
                    TabOrder = 0
                  end
                end
              end
            end
          end
          object scrllModulo: TScrollBox
            Left = 357
            Top = 4
            Width = 351
            Height = 113
            TabOrder = 1
            object pgctrlModulo: TPageControl
              Left = 1
              Top = 1
              Width = 346
              Height = 108
              ActivePage = tbsModulo
              TabOrder = 0
              object tbsModulo: TTabSheet
                Caption = 'Módulos'
                object ScrollBox1: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 336
                  Height = 80
                  TabOrder = 0
                  object clbModulo: TCheckListBox
                    Left = 0
                    Top = 0
                    Width = 332
                    Height = 76
                    BorderStyle = bsNone
                    ItemHeight = 13
                    Items.Strings = (
                      'Assistencial'
                      'Benefício'
                      'Empréstimo'
                      'Previdencial')
                    TabOrder = 0
                  end
                end
              end
            end
          end
          object scrllRubrica: TScrollBox
            Left = 7
            Top = 126
            Width = 703
            Height = 129
            TabOrder = 2
            object pgctrlRubrica: TPageControl
              Left = 0
              Top = 0
              Width = 699
              Height = 125
              ActivePage = tbsRubrica
              TabOrder = 0
              object tbsRubrica: TTabSheet
                Caption = 'Rubrica'
                object ScrollBox2: TScrollBox
                  Left = 0
                  Top = 0
                  Width = 689
                  Height = 97
                  TabOrder = 0
                  object clbRubrica: TCheckListBox
                    Left = 0
                    Top = 0
                    Width = 685
                    Height = 93
                    BorderStyle = bsNone
                    ItemHeight = 13
                    TabOrder = 0
                  end
                end
              end
            end
          end
        end
      end
    end
    object dblookupPatrocinadora: TCMDBLookupCombo
      Left = 8
      Top = 20
      Width = 286
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'NOME')
      LookupTable = qryPatro
      LookupField = 'IDPESSOA'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnChange = dblookupPatrocinadoraChange
    end
    object rdgrpind: TRadioGroup
      Left = 7
      Top = 44
      Width = 286
      Height = 41
      Caption = 'Tipo do Relatório'
      Columns = 2
      ItemIndex = 1
      Items.Strings = (
        'Analítico'
        'Sintético')
      TabOrder = 2
    end
    object grpMesAno: TGroupBox
      Left = 7
      Top = 88
      Width = 285
      Height = 62
      Caption = 'Informe o Mês e o Ano de Referência '
      TabOrder = 3
      object lblAnoMes: TLabel
        Left = 176
        Top = 18
        Width = 27
        Height = 13
        Caption = 'Ano '
      end
      object lblMes: TLabel
        Left = 11
        Top = 18
        Width = 24
        Height = 13
        Caption = 'Mês'
      end
      object seAno: TSpinEdit
        Left = 176
        Top = 34
        Width = 89
        Height = 22
        MaxValue = 3000
        MinValue = 2000
        TabOrder = 0
        Value = 2001
      end
      object cboxMes: TComboBox
        Left = 11
        Top = 34
        Width = 145
        Height = 21
        ItemHeight = 13
        TabOrder = 1
        Items.Strings = (
          'Janeiro'
          'Fevereiro'
          'Março'
          'Abril'
          'Maio'
          'Junho'
          'Julho'
          'Agosto'
          'Setembro'
          'Outubro'
          'Novembro'
          'Dezembro')
      end
    end
    object scrlOpcoes: TScrollBox
      Left = 305
      Top = 21
      Width = 334
      Height = 130
      Color = clWindow
      ParentColor = False
      TabOrder = 4
      object clbOpcoes: TCheckListBox
        Left = 0
        Top = 0
        Width = 329
        Height = 121
        BorderStyle = bsNone
        ItemHeight = 13
        Items.Strings = (
          'Benefícios - Auxílio doença'
          'Contribuições Assistenciais'
          'Contribuições de Empréstimo'
          'Inscritos e desligados'
          'Taxas ou Valores das Contribuições mensais')
        TabOrder = 0
      end
    end
    object bbtnTodas: TBitBtn
      Left = 644
      Top = 21
      Width = 74
      Height = 29
      Caption = 'Todas'
      TabOrder = 5
      OnClick = bbtnTodasClick
      Glyph.Data = {
        B2050000424DB205000000000000360400002800000013000000130000000100
        0800000000007C01000000000000000000000001000000010000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A600000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030304
        0403030303030303030303030300030303030402020403030303030303030303
        0300030303040202020204030303030303030303030003030402020202020204
        030303030303030303000304020202FA02020202040303030303030303000302
        0202FA02FA0202020403030303030303030003FA02FA020202FA020202040303
        0303030303000304FA0202020202FA020202040303030303030004020202FA02
        020202FA0202020403030303F800020202FA03FA02020204FA02020204030303
        F800FA02FA030303FA02020204FA020202040303030003FA0303030303FA0202
        0204FA020202040303000303030303030303FA02020204FA0202040303000303
        03030303030303FA02020204FA020203030003030303030303030303FA020202
        04FA030303000303030303030303030303FA0202020403030300030303030303
        030303030303FA0202040303030003030303030303030303030303FA02020303
        03000303030303030303030303030303FA0303030300}
    end
    object bbtnInverte: TBitBtn
      Left = 644
      Top = 50
      Width = 74
      Height = 29
      Caption = 'Inverte'
      TabOrder = 6
      OnClick = bbtnInverteClick
      Glyph.Data = {
        BE060000424DBE06000000000000360400002800000024000000120000000100
        0800000000008802000000000000000000000001000000010000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A600000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
        0404040404040303030303030303030303FFF8F8F8F8F8F803FF030303030302
        0403030402020202020204040303030303F8F8FF03F8030303030303F8F8FF03
        030303020204040202020202020202020403030303F8FFF8F80303FFFFFFFFFF
        0303F8FF030303020202020202FAFAFAFAFA02020204030303F8FF030303FFF8
        F8F8F8F8FF0303F8FF03030202020202FA0303030303FA020202040303F8FF03
        03FFF80303030303F8FF0303F8FF03020202020203030303030303FA02020403
        03F8FF0303F803030303030303F8FF03F8FF03020202020202030303030303FA
        0404040303F8FFFFFFFFF8FF0303030303F8F8F8F80303FAFAFAFAFAFAFA0303
        030303030303030303F8F8F8F8F8F8F803030303030303030303030303030303
        030303030303030303030303030303030303030303030303FFFFFFFFFFFF0303
        030303030303030303030404040404040303FFFFFFFF030303030303F8F8F8F8
        F8F803FA040404030303030303FA02020202020403F8F8F8F8FF0303030303F8
        FF03030303F803FA02020403030303030303FA020202020403F8FF03F8FF0303
        03030303F803030303F80303FA0202040303030303040402020202040303F803
        03F8FFFFFFFFFFF8F803030303F80303FA020202040404040402020202020204
        0303F8FF0303F8F8F8F8F8030303FFFF03F8030303FA02020202020202020202
        FAFA0204030303F8FFFF030303030303FFFFF8F8FFF803030303FAFA02020202
        0202FAFA0303FA0303030303F8F8FFFFFFFFFFFFF8F80303F803030303030303
        FAFAFAFAFAFA030303030303030303030303F8F8F8F8F8F80303030303030303
        0303030303030303030303030303030303030303030303030303030303030303
        0303}
      NumGlyphs = 2
    end
  end
  inherited Dock971: TDock97
    Top = 442
    Width = 733
    inherited tb97Fundo: TToolbar97
      Left = 246
      DockPos = 246
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 78
      DockPos = 78
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 104
    Top = 159
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object odTxt: TOpenDialog
    DefaultExt = '*.txt'
    FileName = 'Envio.txt'
    Filter = 
      'Arquivos  texto (*.txt)|*.txt|Arquivos DAT (*.dat)|*.dat|Arquivo' +
      's DOC (*.doc)|*.doc|Todos os Arquivos|*.*'
    InitialDir = 'C:\'
    Title = 'Seleção de arquivo para Envio'
    Left = 142
    Top = 159
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'#9'P.IDPESSOA,'
      #9'P.NOME'
      ''
      'FROM'#9'PESSOA P,'
      #9'PATRO PT'
      'WHERE'#9'(PT.IDPESSOA'#9'= P.IDPESSOA)'
      'AND   PT.IDFUNDACAO = :IDFUNDACAO'
      'ORDER'#9'BY P.NOME'
      ' ')
    ValidateWithMask = True
    Left = 150
    Top = 10
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
    object qryPatroNOME: TStringField
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = '"CM.PESSOA".NOME'
      Size = 60
    end
    object qryPatroIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = '"CM.PESSOA".IDPESSOA'
      Visible = False
    end
  end
  object qryPlanos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'#9'PPREVPATRO.IDPLANOPREV,'
      #9'PPREVPATRO.IDPESSJUR,'
      #9'PPREV.NOME'
      #9
      'FROM'#9'PLANPREV'#9'PPREV,'
      #9'PLANPREVPATRO'#9'PPREVPATRO'
      ''
      'WHERE'#9'(PPREV.IDPLANOPREV'#9'= PPREVPATRO.IDPLANOPREV)'
      'AND     (PPREVPATRO.IDPESSJUR = :IDPESSJUR)'
      ''
      'ORDER'#9'BY PPREV.NOME'
      ' ')
    ValidateWithMask = True
    Left = 480
    Top = 169
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
    object qryPlanosNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 50
      FieldName = 'NOME'
      Origin = 'PLANPREV.NOME'
      Size = 50
    end
    object qryPlanosIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'PLANPREVPATRO.IDPLANOPREV'
      Visible = False
    end
    object qryPlanosIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Origin = 'PLANPREVPATRO.IDPESSJUR'
      Visible = False
    end
  end
  object dsPatro: TwwDataSource
    DataSet = qryPatro
    Left = 180
    Top = 10
  end
  object dsPlanos: TwwDataSource
    DataSet = qryPlanos
    Left = 520
    Top = 169
  end
  object qryRubrica: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  IDRUBRICA,'
      '        IDPESSOA,'
      '        CODPROVDESC,'
      '        DESCRPROVDESC'
      'FROM RUBRICAXPESS'
      'WHERE IDPESSOA =:IDPESSOA'
      'ORDER BY DESCRPROVDESC ')
    ValidateWithMask = True
    Left = 505
    Top = 397
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object dsRubrica: TwwDataSource
    DataSet = qryRubrica
    Left = 536
    Top = 397
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 480
    Top = 97
    object StringField1: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 50
      FieldName = 'NOME'
      Origin = 'PLANPREV.NOME'
      Size = 50
    end
    object FloatField1: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'PLANPREVPATRO.IDPLANOPREV'
      Visible = False
    end
    object FloatField2: TFloatField
      FieldName = 'IDPESSJUR'
      Origin = 'PLANPREVPATRO.IDPESSJUR'
      Visible = False
    end
  end
end
