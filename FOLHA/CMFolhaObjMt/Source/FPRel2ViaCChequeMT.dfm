inherited frmPRel2ViaCChequeMT: TfrmPRel2ViaCChequeMT
  Left = 436
  Top = 157
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Parâmetros para a Emissão da 2a. Via de Contra Cheque'
  ClientHeight = 434
  ClientWidth = 464
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 464
    Height = 395
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 462
      Height = 393
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 0
      object PageControl1: TPageControl
        Left = 1
        Top = 1
        Width = 460
        Height = 391
        ActivePage = TabSheet1
        Align = alClient
        TabOrder = 0
        object TabSheet1: TTabSheet
          Caption = '2ª Via Contra Cheque'
          object Panel3: TPanel
            Left = 0
            Top = 117
            Width = 452
            Height = 246
            Align = alBottom
            TabOrder = 0
            object Label1: TLabel
              Left = 14
              Top = 47
              Width = 63
              Height = 13
              Caption = 'Recebedor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblhistorico: TLabel
              Left = 16
              Top = 98
              Width = 104
              Height = 13
              Caption = 'Histórico da Folha'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblDtInicial: TLabel
              Left = 32
              Top = 19
              Width = 66
              Height = 13
              Caption = 'Data Inicial'
              Visible = False
            end
            object lblDtFinal: TLabel
              Left = 223
              Top = 20
              Width = 59
              Height = 13
              Caption = 'Data Final'
              Visible = False
            end
            object cmbRecebedor: TwwDBLookupCombo
              Left = 14
              Top = 63
              Width = 414
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'NOME'#9'F')
              LookupTable = CDSRecebedor
              LookupField = 'IDRECEBEDOR'
              Enabled = False
              ParentFont = False
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
              OnCloseUp = cmbRecebedorCloseUp
            end
            object cklstboxHist: TCheckListBox
              Left = 14
              Top = 113
              Width = 412
              Height = 128
              OnClickCheck = cklstboxHistClickCheck
              ItemHeight = 13
              TabOrder = 1
            end
            object btnMarcaTodas: TBitBtn
              Left = 300
              Top = 87
              Width = 125
              Height = 25
              Hint = 'Inverter Seleção'
              Caption = 'Marcar Todas'
              Enabled = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              OnClick = btnMarcaTodasClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
                555555555555555555555555555555555555555555FF55555555555559055555
                55555555577FF5555555555599905555555555557777F5555555555599905555
                555555557777FF5555555559999905555555555777777F555555559999990555
                5555557777777FF5555557990599905555555777757777F55555790555599055
                55557775555777FF5555555555599905555555555557777F5555555555559905
                555555555555777FF5555555555559905555555555555777FF55555555555579
                05555555555555777FF5555555555557905555555555555777FF555555555555
                5990555555555555577755555555555555555555555555555555}
              NumGlyphs = 2
            end
            object btnCarregarHistorico: TBitBtn
              Left = 162
              Top = 86
              Width = 136
              Height = 26
              Caption = 'Carregar Históricos'
              TabOrder = 3
              Visible = False
              OnClick = btnCarregarHistoricoClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000130B0000130B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
                FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
                FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
                007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
                7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
                99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
                99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
                99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
                93337FFFF7737777733300000033333333337777773333333333}
              NumGlyphs = 2
            end
            object dtMesReferenciaini: TDateTimePicker
              Left = 104
              Top = 16
              Width = 95
              Height = 21
              CalAlignment = dtaLeft
              Date = 34335.4954175347
              Time = 34335.4954175347
              DateFormat = dfShort
              DateMode = dmComboBox
              Kind = dtkDate
              ParseInput = False
              TabOrder = 4
              Visible = False
            end
            object dtMesReferenciafim: TDateTimePicker
              Left = 288
              Top = 16
              Width = 93
              Height = 21
              CalAlignment = dtaLeft
              Date = 0.495523171295645
              Time = 0.495523171295645
              DateFormat = dfShort
              DateMode = dmComboBox
              Kind = dtkDate
              ParseInput = False
              TabOrder = 5
              Visible = False
            end
          end
          object Panel2: TPanel
            Left = 0
            Top = 0
            Width = 452
            Height = 117
            Align = alTop
            TabOrder = 1
            object Label7: TLabel
              Left = 14
              Top = 34
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
            object Label8: TLabel
              Left = 180
              Top = 35
              Width = 118
              Height = 13
              Caption = 'Número de Inscrição'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label3: TLabel
              Left = 14
              Top = 74
              Width = 37
              Height = 13
              Caption = 'Titular'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object edMatricula: TEdit
              Left = 14
              Top = 47
              Width = 120
              Height = 21
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object edNumInscr: TEdit
              Left = 180
              Top = 48
              Width = 120
              Height = 21
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object bbtnProcurar: TBitBtn
              Left = 338
              Top = 37
              Width = 93
              Height = 35
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
              TabOrder = 2
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
            object edTitular: TEdit
              Left = 14
              Top = 87
              Width = 417
              Height = 21
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
            object ckbIndividual: TCheckBox
              Left = 15
              Top = 7
              Width = 122
              Height = 17
              Caption = 'Lista Individual'
              TabOrder = 4
              OnClick = ckbIndividualClick
            end
          end
        end
        object TabSheet2: TTabSheet
          Caption = 'Lista Individual'
          ImageIndex = 1
          inline frameBenef: TfrmFrameListaBenef
            Left = 1
            Top = 3
            Width = 716
            Height = 343
            TabOrder = 0
            inherited Panel3: TPanel
              Width = 716
              inherited Dock971: TDock97
                Width = 714
                inherited TB97oKCancelar: TToolbar97
                  inherited lblQuant: TLabel
                    Left = 428
                    Width = 5
                  end
                  inherited bbtnIncluiBenef: TBitBtn
                    Width = 105
                  end
                  inherited bbtnIncluiLista: TBitBtn
                    Left = 223
                    Width = 97
                  end
                  inherited bbtnExcluiTudo: TBitBtn
                    Left = 320
                    Width = 108
                  end
                  inherited bbtnExcluiCorrente: TBitBtn
                    Left = 105
                    Width = 118
                  end
                end
              end
            end
            inherited dbgrdPessoas: TwwDBGrid
              Width = 716
            end
            inherited qryLista: TwwQuery
              SQL.Strings = (
                'SELECT L.IDTITULAR,'
                '       L.IDPESSOA,'
                '       A.MATRICULA,'
                '       B.MATRICULA AS MATRICULADEP,'
                '       C.NOME AS NOMEDEP,'
                '       D.INSCRICAONUMERO,'
                '       TIT.NOME AS NOMETITULAR'
                '  FROM LISTAFOLHABENEFDET L,'
                '       ELEGPATRO          A,'
                '       DEPENTIT           B,'
                '       PARTPREVPLAN       D,'
                '       PESSOA             C,'
                '       PESSOA             TIT'
                ' WHERE L.IDLISTA = :IDLISTA'
                '   AND L.IDTITULAR = A.IDPESSOA'
                '   AND L.IDTITULAR = B.IDTITULAR'
                '   AND L.IDPESSOA = B.IDPESSOA'
                '   AND B.IDPESSOA = C.IDPESSOA'
                '   AND L.IDTITULAR = D.IDPESSOA'
                '   AND TIT.IDPESSOA = A.IDPESSOA'
                '   --AND D.FLGDESATIVADO = 0'
                '   AND (D.FLGDESATIVADO = 0 OR'
                '       (D.FLGDESATIVADO = 1 AND NOT EXISTS'
                '        (SELECT 1'
                '            FROM PARTPREVPLAN PPP1'
                '           WHERE PPP1.IDPESSOA = D.IDPESSOA'
                '             AND PPP1.FLGDESATIVADO = 0) AND'
                '        (D.IDSITPLANOPREV = 25 OR'
                '        (D.IDPLANOPREV ='
                '        (SELECT MAX(PPP1.IDPLANOPREV)'
                '              FROM PARTPREVPLAN PPP1'
                '             WHERE PPP1.IDPESSOA = D.IDPESSOA'
                '               AND PPP1.DATACANCELAMENTO ='
                '                   (SELECT MAX(PPP2.DATACANCELAMENTO)'
                '                      FROM PARTPREVPLAN PPP2'
                '                     WHERE PPP2.IDPESSOA = PPP1.IDPESSOA)'
                '               AND NOT EXISTS (SELECT 1'
                '                      FROM PARTPREVPLAN PPP2'
                '                     WHERE PPP2.IDPESSOA = PPP1.IDPESSOA'
                '                       AND PPP2.IDSITPLANOPREV = 25))))))'
                ' ORDER BY B.MATRICULA')
            end
            inherited qryAux: TwwQuery [4]
            end
            inherited MSLista: TMontaSelect [5]
            end
            object qryIListlista: TwwQuery [6]
              DatabaseName = 'BaseDados'
              SQL.Strings = (
                'SELECT  * '
                '        FROM LISTAFOLHABENEFDET '
                '        WHERE IDLISTA =  :IDLISTA')
              ValidateWithMask = True
              Left = 120
              Top = 80
              ParamData = <
                item
                  DataType = ftFloat
                  Name = 'IDLISTA'
                  ParamType = ptUnknown
                end>
              object qryIListlistaIDLISTA: TFloatField
                FieldName = 'IDLISTA'
                Origin = 'BASEDADOS."CM.LISTAFOLHABENEFDET".IDLISTA'
              end
              object qryIListlistaIDTITULAR: TFloatField
                FieldName = 'IDTITULAR'
                Origin = 'BASEDADOS."CM.LISTAFOLHABENEFDET".IDTITULAR'
              end
              object qryIListlistaIDPESSOA: TFloatField
                FieldName = 'IDPESSOA'
                Origin = 'BASEDADOS."CM.LISTAFOLHABENEFDET".IDPESSOA'
              end
              object qryIListlistaIDREFERENCIA: TFloatField
                FieldName = 'IDREFERENCIA'
                Origin = 'BASEDADOS."CM.LISTAFOLHABENEFDET".IDREFERENCIA'
              end
            end
            inherited qrybuscaLista: TwwQuery [7]
            end
            object MSBenef: TMontaSelect [8]
              Template.IdConsulta = 0
              Caption = 'Seleciona'
              Colunas.Strings = (
                'VWPARTICIPDEPEN.MATRICULA'
                'VWPARTICIPDEPEN.MATRICULADEP'
                'VWPARTICIPDEPEN.INSCRICAONUMERO'
                'VWPARTICIPDEPEN.NUMDOCUMENTO'
                'VWPARTICIPDEPEN.NOME')
              TipodeDado.Strings = (
                'C'
                'C'
                'N'
                'C'
                'C')
              Descricao.Strings = (
                'Matric. Titular'
                'Matric. Benef.'
                'Nº Insc'
                'CPF'
                'Nome ')
              SensivelACaixa.Strings = (
                'S'
                'S'
                'N'
                'S'
                'S')
              Tabelas.Strings = (
                'VWPARTICIPDEPEN')
              CamposChave.Strings = (
                'VWPARTICIPDEPEN.IDPESSOA'
                'VWPARTICIPDEPEN.MATRICULA'
                'VWPARTICIPDEPEN.MATRICULADEP'
                'VWPARTICIPDEPEN.MATRICSHOW'
                'VWPARTICIPDEPEN.SITPATRO'
                'VWPARTICIPDEPEN.IDTITULAR'
                'VWPARTICIPDEPEN.NOME'
                'VWPARTICIPDEPEN.IDDEPENDENCIA'
                'VWPARTICIPDEPEN.NUMDOCUMENTO'
                'VWPARTICIPDEPEN.IDPESSJUR'
                'VWPARTICIPDEPEN.INSCRICAONUMERO'
                'VWPARTICIPDEPEN.IDPLANOPREV'
                'VWPARTICIPDEPEN.IDSITPART'
                'VWPARTICIPDEPEN.SEQPROPOSTA'
                'VWPARTICIPDEPEN.FLGDESATIVADO'
                'VWPARTICIPDEPEN.PLANO'
                'VWPARTICIPDEPEN.PATRO'
                'VWPARTICIPDEPEN.DESCRICAO'
                'VWPARTICIPDEPEN.SITFUND')
              Filtro.Strings = (
                'IDPLANOPREV IS NOT NULL')
              Mascaras.Strings = (
                ''
                ''
                ''
                ''
                '')
              Larguras.Strings = (
                '15'
                '15'
                '10'
                '18'
                '60')
              OperComparador.Strings = (
                '-1'
                '-1'
                '-1'
                '-1'
                '-1')
              DataBaseName = 'BaseDados'
              RepeteConsulta = False
              UsaDistinct = False
              SalvaConsulta = False
              ExibePergunta = True
              MultiSelect = False
              LookupSQL.Strings = (
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
                '')
              LookupCampoExibe.Strings = (
                ''
                ''
                ''
                ''
                '')
              Left = 62
              Top = 192
            end
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 395
    Width = 464
    inherited tb97Fundo: TToolbar97
      Left = 288
      DockPos = 439
      inherited sep1: TToolbarSep97
        Left = 83
      end
      inherited sep3: TToolbarSep97
        Left = 169
      end
      inherited bbtnSair: TBitBtn
        Width = 83
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 86
        Width = 83
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 119
      DockPos = 270
      inherited bbtnConfirmar: TBitBtn
        OnClick = rbtnVisualizarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 459
    Top = 331
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited Cmp_Padrao: TCmParamReport
    Params = <
      item
        Caption = 'pRecebedor'
        Controle = tcEdit
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'pRecebedor'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'pIdHastFolhaBenef'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'pIdHastFolhaBenef'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'pIdTitular'
        Controle = tcEdit
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'pIdTitular'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'pIdListaFOlha'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'pIdListaFOlha'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'pMesReferenciaIni'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'pMesReferenciaIni'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'pMesReferenciaFim'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'pMesReferenciaFim'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end>
    Left = 64
    Top = 248
  end
  object CDSRecebedor: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 134
    Top = 287
  end
  object CDShistorico: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 310
    Top = 279
  end
  object MontaSelectBenef: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'V.MATRICULA'
      'V.MATRICULADEP'
      'V.INSCRICAONUMERO'
      'V.NUMDOCUMENTO'
      'V.NOME'
      'P.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Matric. Titular'
      'Matric. Benef.'
      'Nº Insc'
      'CPF'
      'Beneficiário'
      'Titular')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'N'
      'S'
      'S'
      'N')
    Tabelas.Strings = (
      'VWPARTICIPDEPEN V'
      'PESSOA P')
    CamposChave.Strings = (
      'V.IDPESSOA'
      'V.MATRICULA'
      'V.MATRICULADEP'
      'V.MATRICSHOW'
      'V.SITPATRO'
      'V.IDTITULAR'
      'V.NOME'
      'V.IDDEPENDENCIA'
      'V.NUMDOCUMENTO'
      'V.IDPESSJUR'
      'V.INSCRICAONUMERO'
      'V.IDPLANOPREV'
      'V.IDSITPART'
      'V.SEQPROPOSTA'
      'V.FLGDESATIVADO'
      'V.PLANO'
      'V.PATRO'
      'V.DESCRICAO'
      'V.SITFUND'
      'P.NOME')
    Filtro.Strings = (
      'V.IDPLANOPREV IS NOT NULL'
      'V.IDTITULAR = P.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '15'
      '10'
      '18'
      '20'
      '20')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
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
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 262
    Top = 264
  end
end
