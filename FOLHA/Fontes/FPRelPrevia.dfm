inherited frmPRelPREVIA: TfrmPRelPREVIA
  Left = 244
  Top = 133
  HelpContext = 180095
  Caption = 'Relatório de Pagamentos da Folha de Benefícios'
  ClientHeight = 458
  ClientWidth = 574
  FormStyle = fsNormal
  Visible = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label10: TLabel [0]
    Left = 12
    Top = 149
    Width = 55
    Height = 13
    Caption = 'Matrícula'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label11: TLabel [1]
    Left = 94
    Top = 149
    Width = 73
    Height = 13
    Caption = 'N.º de Inscr.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited pnlFundo: TPanel
    Width = 574
    Height = 419
    Font.Height = -11
    ParentFont = False
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 605
      Height = 449
      TabOrder = 0
    end
    object PageControl2: TPageControl
      Left = 1
      Top = 1
      Width = 572
      Height = 417
      ActivePage = tbsOpcoes
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object tbsOpcoes: TTabSheet
        Caption = 'Opções'
        object pnlInformacoes: TPanel
          Left = 0
          Top = 0
          Width = 564
          Height = 121
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object grpEfet: TGroupBox
            Left = 5
            Top = 45
            Width = 545
            Height = 64
            TabOrder = 5
            Visible = False
            object lblhistorico: TLabel
              Left = 47
              Top = 18
              Width = 85
              Height = 13
              Caption = 'Histórico da Folha'
            end
            object blkcmpHistorico: TwwDBLookupCombo
              Left = 47
              Top = 35
              Width = 459
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'HISTORICO'#9'50'#9'HISTORICO')
              LookupTable = qryHistorico
              LookupField = 'IDHSTFOLHABENEF'
              Options = [loTitles]
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
              OnCloseUp = blkcmpHistoricoCloseUp
            end
          end
          object grpPrevia: TGroupBox
            Left = 5
            Top = 45
            Width = 545
            Height = 70
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object Label17: TLabel
              Left = 31
              Top = 9
              Width = 36
              Height = 13
              Caption = 'Lote Nº'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label2: TLabel
              Left = 241
              Top = 19
              Width = 51
              Height = 13
              Caption = 'Mês e Ano'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Bevel1: TBevel
              Left = 214
              Top = 6
              Width = 6
              Height = 62
              Shape = bsLeftLine
            end
            object cmbMes: TComboBox
              Left = 307
              Top = 14
              Width = 151
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              TabOrder = 0
              OnChange = cmbMesChange
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
            object spedAno: TSpinEdit
              Left = 462
              Top = 14
              Width = 61
              Height = 22
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxValue = 0
              MinValue = 0
              ParentFont = False
              TabOrder = 1
              Value = 1999
              OnChange = spedAnoChange
            end
            object rbManutencao: TCheckBox
              Left = 234
              Top = 41
              Width = 149
              Height = 17
              Caption = 'Folha de manutenção'
              Checked = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              State = cbChecked
              TabOrder = 2
            end
            object rbConcessao: TCheckBox
              Left = 394
              Top = 41
              Width = 141
              Height = 17
              Caption = 'Folha de Concessão'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
            object dblkpcmbLote: TwwDBLookupCombo
              Left = 31
              Top = 25
              Width = 151
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'IDLOTE'#9'10'#9'Lote Nº'
                'MESREFERENCIA'#9'7'#9'Mês'
                'DESCRICAO'#9'200'#9'Descrição')
              LookupTable = qryLote
              LookupField = 'IDLOTE'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object Chktrarubresgate: TCheckBox
              Left = 31
              Top = 49
              Width = 153
              Height = 17
              Caption = 'Trazer Rubricas de Resgate'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
            end
          end
          object GroupBox1: TGroupBox
            Left = 560
            Top = 23
            Width = 368
            Height = 76
            TabOrder = 2
            Visible = False
            object Label22: TLabel
              Left = 5
              Top = 20
              Width = 39
              Height = 13
              Caption = 'Motivo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label1: TLabel
              Left = 5
              Top = 47
              Width = 37
              Height = 13
              Caption = 'Ordem'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dblkpcmbmotivo: TwwDBLookupCombo
              Left = 56
              Top = 17
              Width = 306
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'Motivo')
              LookupTable = qrymotivo
              LookupField = 'IDMOTIVO'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
          end
          object GroupBox3: TGroupBox
            Left = 563
            Top = 106
            Width = 562
            Height = 31
            Enabled = False
            TabOrder = 3
            Visible = False
            object ChkAgrupa: TCheckBox
              Left = 8
              Top = 9
              Width = 423
              Height = 17
              Caption = 'Agrupar os atrasados em uma única linha totalizando-os ?'
              Checked = True
              Enabled = False
              State = cbChecked
              TabOrder = 0
            end
          end
          object grpTipoFolha: TRadioGroup
            Left = 6
            Top = 5
            Width = 280
            Height = 39
            Caption = ' Tipo da Folha '
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              'Prévia'
              'Efetivada')
            TabOrder = 4
            OnClick = grpTipoFolhaClick
          end
          object GroupBox2: TGroupBox
            Left = 491
            Top = 125
            Width = 219
            Height = 45
            TabOrder = 1
            Visible = False
            object chk1: TCheckBox
              Left = 10
              Top = 15
              Width = 75
              Height = 17
              Caption = 'Definitiva'
              TabOrder = 0
            end
            object chk2: TCheckBox
              Left = 102
              Top = 15
              Width = 107
              Height = 17
              Caption = 'Inconsistência'
              TabOrder = 1
            end
          end
          object cboxIndividual: TCheckBox
            Left = 313
            Top = 19
            Width = 225
            Height = 17
            Caption = 'Utiliza Lista Individual de Processamento'
            TabOrder = 6
            OnClick = cboxIndividualClick
          end
        end
        object Panel1: TPanel
          Left = 0
          Top = 121
          Width = 564
          Height = 268
          Align = alBottom
          BevelOuter = bvLowered
          TabOrder = 1
          object GroupBox5: TGroupBox
            Left = 1
            Top = 1
            Width = 562
            Height = 121
            Align = alBottom
            TabOrder = 0
            object Label7: TLabel
              Left = 12
              Top = 46
              Width = 45
              Height = 13
              Caption = 'Matrícula'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label8: TLabel
              Left = 94
              Top = 46
              Width = 59
              Height = 13
              Caption = 'N.º de Inscr.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label3: TLabel
              Left = 175
              Top = 45
              Width = 29
              Height = 13
              Caption = 'Titular'
            end
            object Label4: TLabel
              Left = 176
              Top = 6
              Width = 55
              Height = 13
              Caption = 'Beneficiário'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Bevel2: TBevel
              Left = 2
              Top = 43
              Width = 550
              Height = 6
              Shape = bsTopLine
            end
            object Label12: TLabel
              Left = 11
              Top = 81
              Width = 45
              Height = 13
              Caption = 'Matrícula'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label14: TLabel
              Left = 177
              Top = 80
              Width = 59
              Height = 13
              Caption = 'Dependente'
            end
            object edBeneficiario: TEdit
              Left = 175
              Top = 19
              Width = 265
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              OnChange = edBeneficiarioChange
            end
            object cmbBeneficiario: TwwDBLookupCombo
              Left = 176
              Top = 19
              Width = 265
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'40'#9'Recebedor'#9'F')
              LookupTable = qryBeneficiario
              LookupField = 'IDRESPONSAVEL'
              TabOrder = 7
              Visible = False
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
            end
            object edMatricula: TEdit
              Left = 12
              Top = 59
              Width = 70
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnChange = edMatriculaChange
            end
            object edTitular: TEdit
              Left = 175
              Top = 59
              Width = 265
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
              OnChange = edBeneficiarioChange
            end
            object edNumInscr: TEdit
              Left = 94
              Top = 59
              Width = 70
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
              OnChange = edNumInscrChange
            end
            object bbtnProcurar: TBitBtn
              Left = 449
              Top = 52
              Width = 93
              Height = 31
              Hint = 'Procurar participante'
              Caption = '&Procurar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
              OnClick = bbtnProcurarClick
              Glyph.Data = {
                4E010000424D4E01000000000000760000002800000012000000120000000100
                040000000000D800000000000000000000001000000010000000000000000000
                BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
                FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
                0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
                870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
                FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
                0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
                DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
            end
            object BitBtn1: TBitBtn
              Left = 450
              Top = 10
              Width = 93
              Height = 31
              Hint = 'Procurar participante'
              Caption = '&Procurar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 5
              OnClick = BitBtn1Click
              Glyph.Data = {
                4E010000424D4E01000000000000760000002800000012000000120000000100
                040000000000D800000000000000000000001000000010000000000000000000
                BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
                FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
                0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
                870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
                FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
                0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
                DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
            end
            object cboxEspecifico: TCheckBox
              Left = 13
              Top = 21
              Width = 137
              Height = 17
              Caption = 'Filtro Específico'
              TabOrder = 6
              OnClick = cboxEspecificoClick
            end
            object edMatriculaDep: TEdit
              Left = 12
              Top = 93
              Width = 70
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 8
              OnChange = edMatriculaChange
            end
            object edDependente: TEdit
              Left = 175
              Top = 93
              Width = 265
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 9
              OnChange = edBeneficiarioChange
            end
            object bbtnProcurarDep: TBitBtn
              Left = 449
              Top = 86
              Width = 93
              Height = 31
              Hint = 'Procurar participante'
              Caption = '&Procurar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 10
              OnClick = bbtnProcurarDepClick
              Glyph.Data = {
                4E010000424D4E01000000000000760000002800000012000000120000000100
                040000000000D800000000000000000000001000000010000000000000000000
                BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
                FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
                0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
                870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
                FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
                0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
                DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
            end
          end
          object gboxGenerico: TGroupBox
            Left = 1
            Top = 122
            Width = 562
            Height = 98
            Align = alBottom
            TabOrder = 1
            object Label5: TLabel
              Left = 12
              Top = 52
              Width = 66
              Height = 13
              Caption = 'Patrocinadora'
            end
            object Label6: TLabel
              Left = 293
              Top = 52
              Width = 27
              Height = 13
              Caption = 'Plano'
            end
            object Label9: TLabel
              Left = 184
              Top = 8
              Width = 46
              Height = 13
              Caption = 'Benefício'
              Enabled = False
            end
            object cmbPatro: TwwDBLookupCombo
              Left = 12
              Top = 68
              Width = 255
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'40'#9'Patrocinadora'#9'F')
              LookupTable = qryPatro
              LookupField = 'NOME'
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
              OnCloseUp = cmbBeneficioCloseUp
            end
            object cmbPlano: TwwDBLookupCombo
              Left = 291
              Top = 68
              Width = 252
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'40'#9'Plano'#9'F')
              LookupTable = qryPlano
              LookupField = 'NOME'
              TabOrder = 1
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
              OnCloseUp = cmbBeneficioCloseUp
            end
            object cmbBeneficio: TwwDBLookupCombo
              Left = 184
              Top = 25
              Width = 359
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'Descrição'#9'F')
              LookupTable = qryBeneficio
              LookupField = 'NOME'
              Enabled = False
              TabOrder = 2
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
              OnCloseUp = cmbBeneficioCloseUp
            end
            object cboxGenerico: TCheckBox
              Left = 12
              Top = 21
              Width = 113
              Height = 17
              Caption = 'Filtro Genérico'
              TabOrder = 3
              OnClick = cboxGenericoClick
            end
          end
          object GroupBox6: TGroupBox
            Left = 1
            Top = 220
            Width = 562
            Height = 47
            Align = alBottom
            Caption = 'Ordenação'
            TabOrder = 2
            object cmbOrdem: TComboBox
              Left = 16
              Top = 18
              Width = 313
              Height = 21
              ItemHeight = 13
              TabOrder = 0
              Items.Strings = (
                'Patrocinadora, Plano, Número de Inscrição'
                'Patrocinadora, Plano, Matrícula'
                'Patrocinadora, Plano, Recebedor'
                'Número de Inscrição'
                'Matrícula'
                'Recebedor')
            end
            object ckbAgrupaRubrica: TCheckBox
              Left = 344
              Top = 24
              Width = 97
              Height = 17
              Caption = 'Agrupar Valores das Rubricas'
              TabOrder = 1
            end
          end
        end
      end
      object tbsIndividual: TTabSheet
        Caption = 'Individual'
        ImageIndex = 1
        inline frameBenef: TfrmFrameListaBenef
          Width = 564
          Height = 389
          Align = alClient
          inherited Panel3: TPanel
            Width = 564
            inherited Dock971: TDock97
              Width = 562
              inherited TB97oKCancelar: TToolbar97
                inherited lblQuant: TLabel
                  Left = 484
                end
                inherited bbtnIncluiBenef: TBitBtn
                  Width = 121
                end
                inherited bbtnIncluiLista: TBitBtn
                  Left = 242
                  Width = 121
                end
                inherited bbtnExcluiTudo: TBitBtn
                  Left = 363
                  Width = 121
                end
                inherited bbtnExcluiCorrente: TBitBtn
                  Left = 121
                  Width = 121
                end
              end
            end
          end
          inherited dbgrdPessoas: TwwDBGrid
            Width = 564
            Height = 355
          end
          inherited qryLista: TwwQuery
            SQL.Strings = (
              
                'SELECT L.IDTITULAR, L.IDPESSOA, A.MATRICULA, B.MATRICULA AS MATR' +
                'ICULADEP,'
              
                '       C.NOME AS NOMEDEP, D.INSCRICAONUMERO, TIT.NOME AS NOMETIT' +
                'ULAR'
              
                'FROM LISTAFOLHABENEFDET L, ELEGPATRO A, DEPENTIT B, PARTPREVPLAN' +
                ' D,'
              '     PESSOA C, PESSOA TIT'
              'WHERE L.IDLISTA = :IDLISTA'
              'AND L.IDTITULAR = A.IDPESSOA'
              'AND L.IDTITULAR = B.IDTITULAR'
              'AND L.IDPESSOA = B.IDPESSOA'
              'AND B.IDPESSOA = C.IDPESSOA'
              'AND L.IDTITULAR = D.IDPESSOA'
              'AND TIT.IDPESSOA = A.IDPESSOA'
              'ORDER BY B.MATRICULA')
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 419
    Width = 574
    inherited tb97Fundo: TToolbar97
      Left = 400
      DockPos = 598
      inherited sep3: TToolbarSep97
        Left = 0
      end
      object ToolbarSep972: TToolbarSep97 [2]
        Left = 168
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 3
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 231
      DockPos = 429
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
        OnClick = rbtnvisualizarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 22
    Top = 416
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qrymotivo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  IDMOTIVO, DESCRICAO  '
      'FROM   MOTIVO'
      'ORDER BY UPPER(DESCRICAO)')
    ValidateWithMask = True
    Left = 122
    Top = 400
  end
  object MontaSelectBenef: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'EL.MATRICULA'
      'TIT.NOME'
      'PP.INSCRICAONUMERO'
      'PL.NOME'
      'PAT.NOME'
      'DEP.NOME'
      'DP.MATRICULA')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Matricula '
      'Nome '
      'Nº Inscrição '
      'Plano'
      'Patrocinadora'
      'Nome do Dependente'
      '')
    SensivelACaixa.Strings = (
      'N'
      'S'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'BFCIARIOTITPLAN BF'
      'PARTPREVPLAN PP'
      'ELEGPATRO EL'
      'PESSOA PAT'
      'PESSOA TIT'
      'PESSOA DEP'
      'PLANPREV PL'
      'DEPENTIT DP')
    CamposChave.Strings = (
      'PL.NOME'
      'DEP.NOME'
      'TIT.NOME'
      'EL.MATRICULA'
      'PP.INSCRICAONUMERO'
      'BF.IDPESSOA'
      'BF.IDPESSJUR'
      'BF.IDPLANOPREV'
      'BF.IDTITULAR'
      'PAT.NOME'
      'DP.MATRICULA')
    Filtro.Strings = (
      'BF.IDTITULAR   = EL.IDPESSOA   '
      'PP.IDPESSJUR   = BF.IDPESSJUR  '
      'PP.IDPESSOA    = BF.IDTITULAR  '
      'PP.IDPLANOPREV = BF.IDPLANOPREV'
      'PP.FLGDESATIVADO = 0           '
      'PAT.IDPESSOA   = BF.IDPESSJUR  '
      'DEP.IDPESSOA   = BF.IDPESSOA   '
      'TIT.IDPESSOA   = BF.IDTITULAR  '
      'PL.IDPLANOPREV = BF.IDPLANOPREV'
      'BF.IDPESSOA = DP.IDPESSOA(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '13'
      '60'
      '10'
      '50'
      '60'
      '15')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 81
    Top = 367
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 369
    Top = 433
  end
  object qryHistorico: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDHSTFOLHABENEF, IDHSTFOLHABENEF||'#39' - '#39'||HISTORICO AS HIS' +
        'TORICO,'
      '       MESREFERENCIA, FLGTIPOFOLHA'
      'FROM HSTFOLHABENEF'
      'WHERE FLGESTADO <> 2'
      'ORDER BY IDHSTFOLHABENEF DESC')
    ValidateWithMask = True
    Left = 522
    Top = 371
  end
  object qryCount: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 185
    Top = 387
  end
  object qryLote: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDLOTE, MESREFERENCIA, DESCRICAO, FLGTIPOFOLHA'
      'FROM CTRLINTERFACE'
      
        'WHERE ((FLGPREPARADO = 1) OR (FLGTIPOFOLHA = 2) OR (FLGTIPOFOLHA' +
        ' = 1))'
      'AND TIPO = '#39'B'#39
      'AND FLGVOLTATMP = 0'
      'ORDER BY IDLOTE DESC'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 480
    Top = 371
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOPREV, NOME'
      'FROM PLANPREV'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 357
    Top = 335
  end
  object qryBeneficio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDBENEFICIO, NOME'
      'FROM BENEFICIO'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 412
    Top = 205
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPESSOA, P.NOME'
      'FROM PESSOA P, PATRO PA'
      'WHERE P.IDPESSOA = PA.IDPESSOA'
      'ORDER BY P.NOME')
    ValidateWithMask = True
    Left = 157
    Top = 335
  end
  object qryConverte: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 429
    Top = 372
  end
  object qryBeneficiario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT BF.IDRESPONSAVEL, P.NOME'
      'FROM BFCIARIOTITPLAN BF, PESSOA P'
      'WHERE IDTITULAR = :TITULAR'
      '  AND P.IDPESSOA = BF.IDRESPONSAVEL')
    ValidateWithMask = True
    Left = 116
    Top = 272
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TITULAR'
        ParamType = ptInput
        Value = '1234333'
      end>
  end
end
