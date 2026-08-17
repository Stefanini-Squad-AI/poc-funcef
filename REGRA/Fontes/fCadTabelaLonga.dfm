inherited frmCadTabelaLonga: TfrmCadTabelaLonga
  Left = 92
  Top = 97
  HelpContext = 450016
  Caption = 'Cadastro de Tabela Longa'
  ClientHeight = 431
  ClientWidth = 661
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 661
    Height = 345
    inherited pnlMestre: TPanel
      Width = 659
      Height = 60
      object Label1: TLabel
        Left = 96
        Top = 8
        Width = 33
        Height = 13
        Caption = 'Nome'
      end
      object Label2: TLabel
        Left = 8
        Top = 8
        Width = 76
        Height = 13
        Caption = 'Nº da Tabela'
      end
      object Label3: TLabel
        Left = 520
        Top = 8
        Width = 46
        Height = 13
        Caption = 'Colunas'
      end
      object dedNome: TwwDBEdit
        Left = 96
        Top = 24
        Width = 409
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit2: TwwDBEdit
        Left = 8
        Top = 24
        Width = 81
        Height = 21
        DataField = 'IDTABELA'
        DataSource = ds
        Enabled = False
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object Spin: TSpinEdit
        Left = 520
        Top = 23
        Width = 111
        Height = 22
        Enabled = False
        MaxValue = 0
        MinValue = 0
        TabOrder = 2
        Value = 0
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 61
      Width = 659
      Height = 283
      Tabs.Strings = (
        'Dados')
      detdbGrids.Strings = (
        'dbgrdDet'
        'dbgrpcmp')
      inherited pgctrlDetalhe: TPageControl
        Width = 561
        Height = 224
        inherited tbsDet: TTabSheet
          Caption = 'Valores'
          inherited dbgrdDet: TwwDBGrid
            Width = 553
            Height = 196
            Selected.Strings = (
              'IDTABELA'#9'10'#9'IDTABELA'#9'F'
              'NUMLINHA'#9'10'#9'NUMLINHA'#9'F'
              'C1'#9'20'#9'C1'#9'F'
              'C2'#9'20'#9'C2'#9'F'
              'C3'#9'20'#9'C3'#9'F'
              'C4'#9'20'#9'C4'#9'F'
              'C5'#9'20'#9'C5'#9'F'
              'C6'#9'20'#9'C6'#9'F'
              'C7'#9'20'#9'C7'#9'F'
              'C8'#9'20'#9'C8'#9'F'
              'C9'#9'20'#9'C9'#9'F'
              'C10'#9'20'#9'C10'#9'F'
              'C11'#9'20'#9'C11'#9'F'
              'C12'#9'20'#9'C12'#9'F'
              'C13'#9'20'#9'C13'#9'F'
              'C14'#9'20'#9'C14'#9'F'
              'C15'#9'20'#9'C15'#9'F'
              'C16'#9'20'#9'C16'#9'F'
              'C17'#9'20'#9'C17'#9'F'
              'C18'#9'20'#9'C18'#9'F'
              'C19'#9'20'#9'C19'#9'F'
              'C20'#9'20'#9'C20'#9'F'
              'C21'#9'20'#9'C21'#9'F'
              'C22'#9'20'#9'C22'#9'F'
              'C23'#9'20'#9'C23'#9'F'
              'C24'#9'20'#9'C24'#9'F'
              'C25'#9'20'#9'C25'#9'F'
              'C26'#9'20'#9'C26'#9'F'
              'C27'#9'20'#9'C27'#9'F'
              'C28'#9'20'#9'C28'#9'F'
              'C29'#9'20'#9'C29'#9'F'
              'C30'#9'20'#9'C30'#9'F'
              'C31'#9'20'#9'C31'#9'F'
              'C32'#9'20'#9'C32'#9'F'
              'C33'#9'20'#9'C33'#9'F'
              'C34'#9'20'#9'C34'#9'F'
              'C35'#9'20'#9'C35'#9'F'
              'C36'#9'20'#9'C36'#9'F'
              'C37'#9'20'#9'C37'#9'F'
              'C38'#9'20'#9'C38'#9'F'
              'C39'#9'20'#9'C39'#9'F'
              'C40'#9'20'#9'C40'#9'F'
              'C41'#9'20'#9'C41'#9'F'
              'C42'#9'20'#9'C42'#9'F'
              'C43'#9'20'#9'C43'#9'F'
              'C44'#9'20'#9'C44'#9'F'
              'C45'#9'20'#9'C45'#9'F'
              'C46'#9'20'#9'C46'#9'F'
              'C47'#9'20'#9'C47'#9'F'
              'C48'#9'20'#9'C48'#9'F'
              'C49'#9'20'#9'C49'#9'F'
              'C50'#9'20'#9'C50'#9'F'
              'C51'#9'20'#9'C51'#9'F'
              'C52'#9'20'#9'C52'#9'F'
              'C53'#9'20'#9'C53'#9'F'
              'C54'#9'20'#9'C54'#9'F'
              'C55'#9'20'#9'C55'#9'F'
              'C56'#9'20'#9'C56'#9'F'
              'C57'#9'20'#9'C57'#9'F'
              'C58'#9'20'#9'C58'#9'F'
              'C59'#9'20'#9'C59'#9'F'
              'C60'#9'20'#9'C60'#9'F'
              'C61'#9'20'#9'C61'#9'F'
              'C62'#9'20'#9'C62'#9'F'
              'C63'#9'20'#9'C63'#9'F'
              'C64'#9'20'#9'C64'#9'F'
              'C65'#9'20'#9'C65'#9'F'
              'C66'#9'20'#9'C66'#9'F'
              'C67'#9'20'#9'C67'#9'F'
              'C68'#9'20'#9'C68'#9'F'
              'C69'#9'20'#9'C69'#9'F'
              'C70'#9'20'#9'C70'#9'F'
              'C71'#9'20'#9'C71'#9'F'
              'C72'#9'20'#9'C72'#9'F'
              'C73'#9'20'#9'C73'#9'F'
              'C74'#9'20'#9'C74'#9'F'
              'C75'#9'20'#9'C75'#9'F'
              'C76'#9'20'#9'C76'#9'F'
              'C77'#9'20'#9'C77'#9'F'
              'C78'#9'20'#9'C78'#9'F'
              'C79'#9'20'#9'C79'#9'F'
              'C80'#9'20'#9'C80'#9'F'
              'C81'#9'20'#9'C81'#9'F'
              'C82'#9'20'#9'C82'#9'F'
              'C83'#9'20'#9'C83'#9'F'
              'C84'#9'20'#9'C84'#9'F'
              'C85'#9'20'#9'C85'#9'F'
              'C86'#9'20'#9'C86'#9'F'
              'C87'#9'20'#9'C87'#9'F'
              'C88'#9'20'#9'C88'#9'F'
              'C89'#9'20'#9'C89'#9'F'
              'C90'#9'20'#9'C90'#9'F'
              'C91'#9'20'#9'C91'#9'F'
              'C92'#9'20'#9'C92'#9'F'
              'C93'#9'20'#9'C93'#9'F'
              'C94'#9'20'#9'C94'#9'F'
              'C95'#9'20'#9'C95'#9'F'
              'C96'#9'20'#9'C96'#9'F'
              'C97'#9'20'#9'C97'#9'F'
              'C98'#9'20'#9'C98'#9'F'
              'C99'#9'20'#9'C99'#9'F'
              'C100'#9'20'#9'C100'#9'F')
            EditCalculated = True
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            OnDblClick = dbgrdDetDblClick
            OnKeyPress = dbgrdDetKeyPress
            object dbgrdDetIButton: TwwIButton
              Left = 0
              Top = 0
              Width = 13
              Height = 25
              AllowAllUp = True
            end
          end
          inherited pnlControlesDet: TPanel
            Width = 553
            Height = 196
          end
          object dbgrpcmp: TDBGrid
            Left = 0
            Top = 0
            Width = 553
            Height = 196
            Align = alClient
            DataSource = dsCmp
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete]
            TabOrder = 2
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
          end
        end
      end
      inherited Dock973: TDock97
        Width = 651
        object MemHelp: TMemo
          Left = 81
          Top = 1
          Width = 511
          Height = 27
          Alignment = taCenter
          BorderStyle = bsNone
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Lines.Strings = (
            
              'Duplo Clique ou Barra de Espaço no Campo da Tabela- Insere/Alter' +
              'a dados na Tabela'
            'Botão Direito na Tabela - Menu de Manutenção de Nome dos Campos')
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          Visible = False
        end
      end
      inherited Dock974: TDock97
        Left = 565
        Height = 224
        inherited tb97Detalhe: TToolbar97
          inherited bbtnVoltarDet: TBitBtn
            Enabled = False
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 661
    object Toolbar972: TToolbar97
      Left = 594
      Top = 0
      Caption = 'Toolbar972'
      CloseButton = False
      DefaultDock = Dock972
      DockPos = 594
      TabOrder = 1
      object SbtnCopiar: TToolbarButton97
        Left = 0
        Top = 0
        Width = 60
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Copiar'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555000000
          000055555F77777777775555000FFFFFFFF0555F777F5FFFF55755000F0F0000
          FFF05F777F7F77775557000F0F0FFFFFFFF0777F7F7F5FFFFFF70F0F0F0F0000
          00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFFFFF70F0F0F0F0000
          00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFF55570F0F0F0F000F
          FFF07F7F7F7F77755FF70F0F0F0FFFFF00007F7F7F7F5FF577770F0F0F0F00FF
          0F057F7F7F7F77557F750F0F0F0FFFFF00557F7F7F7FFFFF77550F0F0F000000
          05557F7F7F77777775550F0F0000000555557F7F7777777555550F0000000555
          55557F7777777555555500000005555555557777777555555555}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        OnClick = SbtnCopiarClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 392
    Width = 661
    object BitBtnExportar: TBitBtn
      Left = 3
      Top = 2
      Width = 88
      Height = 33
      Caption = '&Exportar'
      TabOrder = 2
      OnClick = BitBtnExportarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
        333333333333337FF3333333333333903333333333333377FF33333333333399
        03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
        99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
        99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
        03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
        33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
        33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
        3333777777333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
  end
  inherited dsDet: TwwDataSource
    AutoEdit = True
    DataSet = QryDet
    Left = 266
    Top = 222
  end
  inherited ds: TwwDataSource
    Left = 245
    Top = 6
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update longtabgener'
      'set'
      '  IDTABELA = :IDTABELA,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  IDTABELA = :OLD_IDTABELA')
    InsertSQL.Strings = (
      'insert into longtabgener'
      '  (IDTABELA, DESCRICAO)'
      'values'
      '  (:IDTABELA, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from longtabgener'
      'where'
      '  IDTABELA = :OLD_IDTABELA')
    Left = 281
    Top = 6
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'LONGTABGENER.IDTABELA'
      'LONGTABGENER.DESCRICAO')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Nº da Tabela'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'LONGTABGENER')
    CamposChave.Strings = (
      'LONGTABGENER.IDTABELA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '60')
    Left = 271
    Top = 77
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 202
    Top = 51
  end
  inherited qry: TwwQuery
    Tag = 5
    SQL.Strings = (
      'select'
      '      idtabela,descricao'
      'from'
      '    longtabgener'
      'where'
      '     idTabela = :id')
    Left = 319
    Top = 6
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 332
    Top = 98
  end
  object QryDet: TwwQuery
    CachedUpdates = True
    BeforePost = QryDetBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   IDTABELA, NUMLINHA,  '
      '   C1, C2, C3, C4, C5, C6, C7, C8, C9, C10,'
      '   C11, C12, C13, C14, C15, C16, C17, C18, C19, C20, '
      '   C21, C22, C23, C24, C25, C26, C27, C28, C29, C30, '
      '   C31, C32, C33, C34, C35, C36, C37, C38, C39, C40, '
      '   C41, C42, C43, C44, C45, C46, C47, C48, C49, C50, '
      '   C51, C52, C53, C54, C55, C56, C57, C58, C59, C60, '
      '   C61, C62, C63, C64, C65, C66, C67, C68, C69, C70, '
      '   C71, C72, C73, C74, C75, C76, C77, C78, C79, C80, '
      '   C81, C82, C83, C84, C85, C86, C87, C88, C89, C90, '
      '   C91, C92, C93, C94, C95, C96, C97, C98, C99, C100'
      'FROM'
      '   LONGVALTABGENER'
      'WHERE'
      '   IDTABELA = :id'
      'ORDER BY'
      '   NUMLINHA')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 232
    Top = 222
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update LONGVALTABGENER'
      'set'
      '  IDTABELA = :IDTABELA,'
      '  NUMLINHA = :NUMLINHA,'
      '  C1 = :C1,'
      '  C2 = :C2,'
      '  C3 = :C3,'
      '  C4 = :C4,'
      '  C5 = :C5,'
      '  C6 = :C6,'
      '  C7 = :C7,'
      '  C8 = :C8,'
      '  C9 = :C9,'
      '  C10 = :C10,'
      '  C11 = :C11,'
      '  C12 = :C12,'
      '  C13 = :C13,'
      '  C14 = :C14,'
      '  C15 = :C15,'
      '  C16 = :C16,'
      '  C17 = :C17,'
      '  C18 = :C18,'
      '  C19 = :C19,'
      '  C20 = :C20,'
      '  C21 = :C21,'
      '  C22 = :C22,'
      '  C23 = :C23,'
      '  C24 = :C24,'
      '  C25 = :C25,'
      '  C26 = :C26,'
      '  C27 = :C27,'
      '  C28 = :C28,'
      '  C29 = :C29,'
      '  C30 = :C30,'
      '  C31 = :C31,'
      '  C32 = :C32,'
      '  C33 = :C33,'
      '  C34 = :C34,'
      '  C35 = :C35,'
      '  C36 = :C36,'
      '  C37 = :C37,'
      '  C38 = :C38,'
      '  C39 = :C39,'
      '  C40 = :C40,'
      '  C41 = :C41,'
      '  C42 = :C42,'
      '  C43 = :C43,'
      '  C44 = :C44,'
      '  C45 = :C45,'
      '  C46 = :C46,'
      '  C47 = :C47,'
      '  C48 = :C48,'
      '  C49 = :C49,'
      '  C50 = :C50,'
      '  C51 = :C51,'
      '  C52 = :C52,'
      '  C53 = :C53,'
      '  C54 = :C54,'
      '  C55 = :C55,'
      '  C56 = :C56,'
      '  C57 = :C57,'
      '  C58 = :C58,'
      '  C59 = :C59,'
      '  C60 = :C60,'
      '  C61 = :C61,'
      '  C62 = :C62,'
      '  C63 = :C63,'
      '  C64 = :C64,'
      '  C65 = :C65,'
      '  C66 = :C66,'
      '  C67 = :C67,'
      '  C68 = :C68,'
      '  C69 = :C69,'
      '  C70 = :C70,'
      '  C71 = :C71,'
      '  C72 = :C72,'
      '  C73 = :C73,'
      '  C74 = :C74,'
      '  C75 = :C75,'
      '  C76 = :C76,'
      '  C77 = :C77,'
      '  C78 = :C78,'
      '  C79 = :C79,'
      '  C80 = :C80,'
      '  C81 = :C81,'
      '  C82 = :C82,'
      '  C83 = :C83,'
      '  C84 = :C84,'
      '  C85 = :C85,'
      '  C86 = :C86,'
      '  C87 = :C87,'
      '  C88 = :C88,'
      '  C89 = :C89,'
      '  C90 = :C90,'
      '  C91 = :C91,'
      '  C92 = :C92,'
      '  C93 = :C93,'
      '  C94 = :C94,'
      '  C95 = :C95,'
      '  C96 = :C96,'
      '  C97 = :C97,'
      '  C98 = :C98,'
      '  C99 = :C99,'
      '  C100 = :C100'
      'where'
      '  IDTABELA = :OLD_IDTABELA and'
      '  NUMLINHA = :OLD_NUMLINHA')
    InsertSQL.Strings = (
      'insert into LONGVALTABGENER'
      
        '  (IDTABELA, NUMLINHA, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, ' +
        'C11, C12, '
      
        '   C13, C14, C15, C16, C17, C18, C19, C20, C21, C22, C23, C24, C' +
        '25, C26, '
      
        '   C27, C28, C29, C30, C31, C32, C33, C34, C35, C36, C37, C38, C' +
        '39, C40, '
      
        '   C41, C42, C43, C44, C45, C46, C47, C48, C49, C50, C51, C52, C' +
        '53, C54, '
      
        '   C55, C56, C57, C58, C59, C60, C61, C62, C63, C64, C65, C66, C' +
        '67, C68, '
      
        '   C69, C70, C71, C72, C73, C74, C75, C76, C77, C78, C79, C80, C' +
        '81, C82, '
      
        '   C83, C84, C85, C86, C87, C88, C89, C90, C91, C92, C93, C94, C' +
        '95, C96, '
      '   C97, C98, C99, C100)'
      'values'
      
        '  (:IDTABELA, :NUMLINHA, :C1, :C2, :C3, :C4, :C5, :C6, :C7, :C8,' +
        ' :C9, :C10, '
      
        '   :C11, :C12, :C13, :C14, :C15, :C16, :C17, :C18, :C19, :C20, :' +
        'C21, :C22, '
      
        '   :C23, :C24, :C25, :C26, :C27, :C28, :C29, :C30, :C31, :C32, :' +
        'C33, :C34, '
      
        '   :C35, :C36, :C37, :C38, :C39, :C40, :C41, :C42, :C43, :C44, :' +
        'C45, :C46, '
      
        '   :C47, :C48, :C49, :C50, :C51, :C52, :C53, :C54, :C55, :C56, :' +
        'C57, :C58, '
      
        '   :C59, :C60, :C61, :C62, :C63, :C64, :C65, :C66, :C67, :C68, :' +
        'C69, :C70, '
      
        '   :C71, :C72, :C73, :C74, :C75, :C76, :C77, :C78, :C79, :C80, :' +
        'C81, :C82, '
      
        '   :C83, :C84, :C85, :C86, :C87, :C88, :C89, :C90, :C91, :C92, :' +
        'C93, :C94, '
      '   :C95, :C96, :C97, :C98, :C99, :C100)')
    DeleteSQL.Strings = (
      'delete from LONGVALTABGENER'
      'where'
      '  IDTABELA = :OLD_IDTABELA and'
      '  NUMLINHA = :OLD_NUMLINHA')
    Left = 301
    Top = 222
  end
  object QryCmp: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IDTABELA,IDCAMPO,DESCRICAO'
      'FROM'
      '    LONGCMPTABGENER'
      'WHERE'
      '     (IDTABELA = :id) AND (IDTABELA > 0)'
      'ORDER BY'
      '      IDTABELA, IDCAMPO')
    UpdateObject = updCmp
    ValidateWithMask = True
    Left = 525
    Top = 6
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptUnknown
      end>
    object QryCmpIDCAMPO: TFloatField
      DisplayLabel = 'Número do Campo'
      DisplayWidth = 10
      FieldName = 'IDCAMPO'
      Origin = 'LONGCMPTABGENER.IDCAMPO'
    end
    object QryCmpDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCRICAO'
      Origin = 'LONGCMPTABGENER.DESCRICAO'
      Size = 60
    end
    object QryCmpIDTABELA: TFloatField
      DisplayLabel = 'Número da Tabela'
      FieldName = 'IDTABELA'
      Origin = 'LONGCMPTABGENER.IDTABELA'
      Visible = False
    end
  end
  object dsCmp: TwwDataSource
    DataSet = QryCmp
    Left = 557
    Top = 6
  end
  object updCmp: TUpdateSQL
    ModifySQL.Strings = (
      'update longcmptabgener'
      'set'
      '  IDTABELA = :IDTABELA,'
      '  IDCAMPO = :IDCAMPO,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  IDTABELA = :OLD_IDTABELA and'
      '  IDCAMPO = :OLD_IDCAMPO')
    InsertSQL.Strings = (
      'insert into longcmptabgener'
      '  (IDTABELA, IDCAMPO, DESCRICAO)'
      'values'
      '  (:IDTABELA, :IDCAMPO, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from longcmptabgener'
      'where'
      '  IDTABELA = :OLD_IDTABELA and'
      '  IDCAMPO = :OLD_IDCAMPO')
    Left = 589
    Top = 6
  end
  object ppmTab: TPopupMenu
    Left = 437
    Top = 303
    object IncluirCampo1: TMenuItem
      Caption = '&Incluir Tipo de Campo'
      OnClick = IncluirCampo1Click
    end
    object AlterarCampo1: TMenuItem
      Caption = '&Alterar Tipo de Campo'
      OnClick = AlterarCampo1Click
    end
    object ExcluirCampo1: TMenuItem
      Caption = '&Excluir Tipo de Campo'
      Enabled = False
    end
    object VisualizarCampos1: TMenuItem
      Caption = '&Visualizar Campos'
      OnClick = VisualizarCampos1Click
    end
  end
  object QryCopia: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 421
    Top = 72
  end
  object SD: TSaveDialog
    DefaultExt = '*.txt'
    Filter = 'Arquivos Texto|*.Txt'
    InitialDir = 'c:\'
    Title = 'Arquivo para Exportar'
    Left = 400
    Top = 303
  end
  object QryAux: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IDTABELA,IDCAMPO,DESCRICAO'
      'FROM'
      '    LONGCMPTABGENER'
      'WHERE'
      '     (IDTABELA = :id) AND (IDTABELA > 0)'
      'ORDER BY'
      '      IDTABELA, IDCAMPO')
    ValidateWithMask = True
    Left = 389
    Top = 22
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
end
