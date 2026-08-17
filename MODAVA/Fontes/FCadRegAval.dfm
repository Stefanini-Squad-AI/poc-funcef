inherited frmCadRegAval: TfrmCadRegAval
  Left = 112
  Top = 98
  Caption = 'Registro de Outras Avaliações e Entrevistas'
  ClientHeight = 452
  ClientWidth = 634
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 634
    Height = 366
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 4
      Top = 4
      Width = 626
      Height = 55
      object Label1: TLabel
        Left = 31
        Top = 9
        Width = 55
        Height = 13
        Caption = 'Matrícula'
        FocusControl = dbedMatricula
      end
      object Label10: TLabel
        Left = 197
        Top = 9
        Width = 33
        Height = 13
        Caption = 'Nome'
        FocusControl = dbedMatricula
      end
      object dbedMatricula: TDBEdit
        Left = 94
        Top = 6
        Width = 84
        Height = 21
        TabStop = False
        Color = clGray
        DataField = 'MATRICULA'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object dbedNome: TDBEdit
        Left = 234
        Top = 6
        Width = 360
        Height = 21
        TabStop = False
        Color = clGray
        DataField = 'NOME'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object dbedSit: TDBEdit
        Left = 30
        Top = 30
        Width = 198
        Height = 21
        TabStop = False
        Color = clGray
        DataField = 'DESCRICAO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object dbedCargo: TDBEdit
        Left = 234
        Top = 30
        Width = 360
        Height = 21
        TabStop = False
        Color = clGray
        DataField = 'TITULO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 4
      Top = 59
      Width = 626
      Height = 303
      Tabs.Strings = (
        'Avaliações, Entrevistas, Testes ou Atributos Pessoais'
        'Observações')
      detdbGrids.Strings = (
        'dbgrdDet'
        '')
      inherited pgctrlDetalhe: TPageControl
        Width = 528
        Height = 244
        inherited tbsDet: TTabSheet
          Caption = 'Avaliações, Entrevistas, Testes ou Atributos Pessoais'
          inherited dbgrdDet: TwwDBGrid
            Width = 520
            Height = 216
            Selected.Strings = (
              'DESCRTIPOAVAL'#9'30'#9'Descrição'
              'DATAPLAN'#9'10'#9'Data Planejada'
              'DATAREAL'#9'10'#9'Data Real'
              'AVALIACAO'#9'10'#9'Avaliação'
              'AVALIADOR'#9'40'#9'Avaliador')
          end
          inherited pnlControlesDet: TPanel
            Width = 520
            Height = 216
            object Label2: TLabel
              Left = 30
              Top = 3
              Width = 104
              Height = 13
              Caption = 'Tipo de Avaliação'
            end
            object Label5: TLabel
              Left = 401
              Top = 3
              Width = 57
              Height = 13
              Caption = 'Avaliação'
              FocusControl = dbedAvaliacao
            end
            object Label3: TLabel
              Left = 30
              Top = 45
              Width = 88
              Height = 13
              Caption = 'Data Planejada'
            end
            object Label4: TLabel
              Left = 141
              Top = 45
              Width = 58
              Height = 13
              Caption = 'Data Real'
            end
            object Label8: TLabel
              Left = 252
              Top = 45
              Width = 54
              Height = 13
              Caption = 'Avaliador'
              FocusControl = dbedAvaliador
            end
            object Label9: TLabel
              Left = 30
              Top = 93
              Width = 75
              Height = 13
              Caption = 'Observações'
              FocusControl = dbmObser
            end
            object dblcTipoEntr: TwwDBLookupCombo
              Left = 30
              Top = 18
              Width = 349
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRTIPOAVAL'#9'30'#9'DESCRTIPOAVAL')
              DataField = 'CODTIPOAVAL'
              DataSource = dsDet
              LookupTable = qryTipAval
              LookupField = 'CODTIPOAVAL'
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = True
            end
            object dbedAvaliacao: TDBEdit
              Left = 401
              Top = 18
              Width = 84
              Height = 21
              DataField = 'AVALIACAO'
              DataSource = dsDet
              TabOrder = 1
            end
            object dbedDatPlan: TCMDateTimePicker
              Left = 30
              Top = 60
              Width = 100
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAPLAN'
              DataSource = dsDet
              Epoch = 1950
              ButtonGlyph.Data = {
                06050000424D06050000000000003604000028000000100000000D0000000100
                080000000000D000000000000000000000000001000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                A6000020400000206000002080000020A0000020C0000020E000004000000040
                20000040400000406000004080000040A0000040C0000040E000006000000060
                20000060400000606000006080000060A0000060C0000060E000008000000080
                20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                20004000400040006000400080004000A0004000C0004000E000402000004020
                20004020400040206000402080004020A0004020C0004020E000404000004040
                20004040400040406000404080004040A0004040C0004040E000406000004060
                20004060400040606000406080004060A0004060C0004060E000408000004080
                20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                20008000400080006000800080008000A0008000C0008000E000802000008020
                20008020400080206000802080008020A0008020C0008020E000804000008040
                20008040400080406000804080008040A0008040C0008040E000806000008060
                20008060400080606000806080008060A0008060C0008060E000808000008080
                20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
                000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
                A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
                A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
                A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
                FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
                04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
                000000000000000000FF}
              ShowButton = True
              TabOrder = 2
            end
            object dbedDatReal: TCMDateTimePicker
              Left = 141
              Top = 60
              Width = 100
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAREAL'
              DataSource = dsDet
              Epoch = 1950
              ButtonGlyph.Data = {
                06050000424D06050000000000003604000028000000100000000D0000000100
                080000000000D000000000000000000000000001000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                A6000020400000206000002080000020A0000020C0000020E000004000000040
                20000040400000406000004080000040A0000040C0000040E000006000000060
                20000060400000606000006080000060A0000060C0000060E000008000000080
                20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                20004000400040006000400080004000A0004000C0004000E000402000004020
                20004020400040206000402080004020A0004020C0004020E000404000004040
                20004040400040406000404080004040A0004040C0004040E000406000004060
                20004060400040606000406080004060A0004060C0004060E000408000004080
                20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                20008000400080006000800080008000A0008000C0008000E000802000008020
                20008020400080206000802080008020A0008020C0008020E000804000008040
                20008040400080406000804080008040A0008040C0008040E000806000008060
                20008060400080606000806080008060A0008060C0008060E000808000008080
                20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
                000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
                A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
                A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
                A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
                FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
                04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
                000000000000000000FF}
              ShowButton = True
              TabOrder = 3
            end
            object dbedAvaliador: TDBEdit
              Left = 252
              Top = 60
              Width = 232
              Height = 21
              DataField = 'AVALIADOR'
              DataSource = dsDet
              TabOrder = 4
            end
            object dbmObser: TDBMemo
              Left = 30
              Top = 111
              Width = 457
              Height = 97
              DataField = 'COMENT'
              DataSource = dsDet
              ScrollBars = ssVertical
              TabOrder = 5
            end
            object bbtnBuscaEmpregado: TBitBtn
              Left = 488
              Top = 57
              Width = 30
              Height = 25
              Hint = 'Busca Empregado como Avaliador'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 6
              OnClick = bbtnBuscaEmpregadoClick
              Glyph.Data = {
                42020000424D4202000000000000420000002800000010000000100000000100
                1000030000000002000000000000000000000000000000000000007C0000E003
                00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C104210421F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7F00001F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7FFF7FFF7F00001F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7FFF7FFF7FFF7FFF7FFF7F00001F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1042FF7FFF7FFF7FFF7FFF7F1F00FF7F00001F7C
                1F7C1F7C1F7C00401F7C1F7C1042FF7FFF7F1F001F001F00FF7FFF7FFF7F0000
                1F7C1F7C1F7C004000401F7C1F7C1042FF7FFF7FFF7FFF7FFF7F1F00FF7F0000
                1F7C1F7C1F7C0040004000401F7C1042FF7FFF7F1F001F001F00FF7FFF7FFF7F
                00001F7C1F7C1F7C0040004000400000000000000000FF7FFF7FFF7F1F00FF7F
                FF7F00001F7C1F7C1F7C00400000FF031F7CFF031F7C000010021F00FF7FFF7F
                FF7FFF7F00001F7C1F7C0000FF031F7CFF031F7CFF031F7C0000FF7FFF7FFF7F
                104210421F7C1F7C1F7C00001F7CFF031F7CFF031F7CFF030000FF7F10421042
                1F7C1F7C1F7C1F7C1F7C0000FF031F7CFF031F7CFF031F7C000010421F7C1F7C
                1F7C1F7C1F7C1F7C1F7C00001F7CFF031F7CFF031F7CFF0300001F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C00001F7CFF031F7CFF0300001F7C1F7C1F7C1F7C
                1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000001F7C1F7C1F7C1F7C1F7C
                1F7C1F7C1F7C}
            end
          end
        end
        object tbshObserv: TTabSheet
          Caption = 'Observações'
          object dbmemComent: TDBMemo
            Left = 30
            Top = 15
            Width = 525
            Height = 178
            DataField = 'COMENT'
            DataSource = dsDet
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
      end
      inherited Dock973: TDock97
        Width = 618
      end
      inherited Dock974: TDock97
        Left = 532
        Height = 244
      end
    end
  end
  inherited Dock972: TDock97
    Width = 634
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 413
    Width = 634
    inherited tb97Fundo: TToolbar97
      Left = 464
      DockPos = 472
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 297
      DockPos = 305
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT F.MATRICULA, P.NOME, C.TITULO, S.DESCRICAO, F.IDPESSOA'
      'FROM PESSOA P, FUNCIONARIO F, SITFUNC S, CARGO C'
      'WHERE F.IDPESSOA     = P.IDPESSOA'
      'AND   F.IDCARGO           = C.IDCARGO'
      'AND   F.IDPESSOA          = :IDPESSOA'
      'AND   F.IDSITFUNC         = S.IDSITFUNC')
    Left = 300
    Top = 251
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  inherited dsDet: TwwDataSource
    DataSet = qryHstAval
    Left = 375
    Top = 253
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 298
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOA'
      'set'
      '  IDPESSOA = :IDPESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PESSOA'
      '  (IDPESSOA)'
      'values'
      '  (:IDPESSOA)')
    DeleteSQL.Strings = (
      'delete from PESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Top = 298
  end
  inherited MontaSelect: TMontaSelect
    Top = 298
  end
  object MontaSelectFunc: TMontaSelect [8]
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'upper(PESSOA.NOME)'
      'FUNCIONARIO.MATRICULA'
      'PESSOA.NUMDOCUMENTO'
      'CARGO.TITULO'
      'EMPRESAPROP.NOMEEMPRESA')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Pessoa'
      'Matrícula'
      'CPF (ou equivalente)'
      'Cargo'
      'Empresa')
    Tabelas.Strings = (
      'FUNCIONARIO'
      'EMPRESAPROP'
      'PESSOA '
      'CARGO')
    CamposChave.Strings = (
      'FUNCIONARIO.IDPESSOA'
      'PESSOA.NOME')
    Filtro.Strings = (
      'FUNCIONARIO.IDEMPRESA = EMPRESAPROP.IDPESSOA'
      'FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA'
      'FUNCIONARIO.IDCARGO = CARGO.IDCARGO')
    Larguras.Strings = (
      '60'
      '22'
      '22'
      '40'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 474
    Top = 306
  end
  object qryHstAval: TwwQuery [9]
    CachedUpdates = True
    AfterInsert = qryHstAvalAfterInsert
    BeforePost = qryHstAvalBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT H.*, T.DESCRTIPOAVAL,'
      '    NVL(H.DATAREAL, H.DATAPLAN) AS DATAREF'
      'FROM HSTAVAL H, TIPOAVAL T'
      'WHERE H.IDPESSOA            = :IDPESSOA'
      'AND      H.CODTIPOAVAL  = T.CODTIPOAVAL'
      'AND     T.FLGTIPOAVAL = 2 '
      'ORDER BY DATAREF DESC')
    UpdateObject = updHstAva
    ValidateWithMask = True
    Left = 435
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  inherited ds: TwwDataSource
    Top = 298
  end
  inherited ImlPadrao: TImageList
    Top = 298
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 298
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 408
    Top = 348
  end
  object qryUltSeq: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select max(NUMSEQ) as ULTSEQ'
      'from hstaval'
      'where  IDPESSOA = :IDPESSOA'
      'and  CODTIPOAVAL = :CODTIPOAVAL')
    ValidateWithMask = True
    Left = 248
    Top = 348
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CODTIPOAVAL'
        ParamType = ptUnknown
      end>
  end
  object updHstAva: TUpdateSQL
    ModifySQL.Strings = (
      'update HSTAVAL'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  CODTIPOAVAL = :CODTIPOAVAL,'
      '  NUMSEQ = :NUMSEQ,'
      '  DATAREAL = :DATAREAL,'
      '  AVALIACAO = :AVALIACAO,'
      '  AVALIADOR = :AVALIADOR,'
      '  DATAPLAN = :DATAPLAN,'
      '  COMENT = :COMENT'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  CODTIPOAVAL = :OLD_CODTIPOAVAL and'
      '  NUMSEQ = :OLD_NUMSEQ')
    InsertSQL.Strings = (
      'insert into HSTAVAL'
      
        '  (IDPESSOA, CODTIPOAVAL, NUMSEQ, DATAREAL, AVALIACAO, AVALIADOR' +
        ', DATAPLAN, '
      '   COMENT)'
      'values'
      
        '  (:IDPESSOA, :CODTIPOAVAL, :NUMSEQ, :DATAREAL, :AVALIACAO, :AVA' +
        'LIADOR, '
      '   :DATAPLAN, :COMENT)')
    DeleteSQL.Strings = (
      'delete from HSTAVAL'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  CODTIPOAVAL = :OLD_CODTIPOAVAL and'
      '  NUMSEQ = :OLD_NUMSEQ')
    Left = 486
    Top = 256
  end
  object qryTipAval: TwwQuery
    Active = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select CODTIPOAVAL, DESCRTIPOAVAL from TIPOAVAL '
      'where FLGTIPOAVAL = 2 '
      'order by DESCRTIPOAVAL')
    ValidateWithMask = True
    Left = 566
    Top = 247
  end
end
