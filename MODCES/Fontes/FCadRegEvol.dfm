inherited frmCadRegEvol: TfrmCadRegEvol
  Left = 46
  Top = 92
  Caption = 'Registro de Alteração Funcional'
  ClientHeight = 452
  ClientWidth = 721
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 721
    Height = 366
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 4
      Top = 4
      Width = 713
      Height = 55
      object Label1: TLabel
        Left = 18
        Top = 9
        Width = 55
        Height = 13
        Caption = 'Matrícula'
      end
      object Label10: TLabel
        Left = 240
        Top = 9
        Width = 33
        Height = 13
        Caption = 'Nome'
      end
      object dbedMat: TwwDBEdit
        Left = 81
        Top = 6
        Width = 112
        Height = 21
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
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedNome: TwwDBEdit
        Left = 277
        Top = 6
        Width = 416
        Height = 21
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
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedSitFunc: TwwDBEdit
        Left = 18
        Top = 30
        Width = 250
        Height = 21
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
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedCargo: TwwDBEdit
        Left = 277
        Top = 30
        Width = 416
        Height = 21
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
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 4
      Top = 59
      Width = 713
      Height = 303
      Tabs.Strings = (
        'Evolução Funcional')
      inherited pgctrlDetalhe: TPageControl
        Width = 615
        Height = 244
        inherited tbsDet: TTabSheet
          Caption = 'Evolução Funcional'
          inherited dbgrdDet: TwwDBGrid
            Width = 607
            Height = 216
            Selected.Strings = (
              'DATAALTERFUNC'#9'10'#9'Data Efet.'#9'F'
              'DESCRICAO'#9'50'#9'Tipo de Evento'#9'F'
              'SALARIO'#9'10'#9'Salário'#9'F'
              'TIPOPAGAMENTO'#9'1'#9'Freq.'#9'F'
              'PERC_REAJ'#9'10'#9'% Reaj.'#9'F'
              'TITULO'#9'40'#9'Cargo'#9'F'
              'FUNCAO'#9'40'#9'Cargo Alternativo ou Função'#9'F'
              'CENTROCUSTO'#9'30'#9'Centro de Custo'#9'F'
              'FILIAL'#9'60'#9'Estabelecimento'#9'F')
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgWordWrap]
            ParentFont = False
          end
          inherited pnlControlesDet: TPanel
            Width = 607
            Height = 216
            object Label2: TLabel
              Left = 6
              Top = 0
              Width = 88
              Height = 13
              Caption = 'Tipo de Evento'
            end
            object Label4: TLabel
              Left = 482
              Top = 0
              Width = 111
              Height = 13
              Caption = 'Data de Efetivação'
            end
            object dblcTipoEv: TwwDBLookupCombo
              Left = 6
              Top = 14
              Width = 406
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'DESCRICAO')
              DataField = 'IDMOTIVO'
              DataSource = dsDet
              LookupTable = qryMotivo
              LookupField = 'IDMOTIVO'
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = True
            end
            object rgAltSalario: TRadioGroup
              Left = 6
              Top = 38
              Width = 217
              Height = 35
              Caption = 'Altera Salário ?'
              Columns = 4
              Enabled = False
              ItemIndex = 0
              Items.Strings = (
                'Não'
                'Valor'
                '%'
                'Faixa')
              TabOrder = 2
              OnClick = rgAltSalarioClick
            end
            object gbxSalario: TGroupBox
              Left = 6
              Top = 73
              Width = 217
              Height = 141
              Enabled = False
              TabOrder = 3
              object Label5: TLabel
                Left = 9
                Top = 12
                Width = 40
                Height = 13
                Caption = 'Salário'
              end
              object Label8: TLabel
                Left = 137
                Top = 12
                Width = 62
                Height = 13
                Caption = 'Percentual'
              end
              object dbrgTipoSalar: TDBRadioGroup
                Left = 27
                Top = 53
                Width = 163
                Height = 31
                Caption = 'Base do Salário'
                Columns = 3
                DataField = 'TIPOPAGAMENTO'
                DataSource = dsDet
                Items.Strings = (
                  'Hora'
                  'Dia'
                  'Mês')
                TabOrder = 2
                Values.Strings = (
                  'H'
                  'D'
                  'M')
              end
              object dbedSalario: TDBRealEdit
                Left = 9
                Top = 26
                Width = 121
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '      0,00')
                TabOrder = 0
                WordWrap = False
                OnChange = dbedSalarioChange
                IntDigits = 10
                DecDigits = 2
                NumberFormat = fFixed
                Signal = False
                DataField = 'SALARIO'
                DataSource = dsDet
              end
              object dbedPerc: TDBRealEdit
                Left = 136
                Top = 26
                Width = 72
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '      0,00')
                TabOrder = 1
                WordWrap = False
                OnChange = dbedPercChange
                IntDigits = 10
                DecDigits = 2
                NumberFormat = fFixed
                Signal = False
                DataField = 'PERC_REAJ'
                DataSource = dsDet
              end
              object gbxStepsFaixa: TGroupBox
                Left = 27
                Top = 88
                Width = 163
                Height = 42
                Caption = 'Steps da Faixa'
                TabOrder = 3
                Visible = False
                object cmbSteps: TComboBox
                  Left = 8
                  Top = 15
                  Width = 147
                  Height = 21
                  ItemHeight = 13
                  TabOrder = 0
                  OnChange = cmbStepsChange
                end
              end
            end
            object gbxCargo: TGroupBox
              Left = 234
              Top = 38
              Width = 360
              Height = 42
              Caption = 'Cargo'
              TabOrder = 4
              object dblcCargo: TwwDBLookupCombo
                Left = 9
                Top = 14
                Width = 340
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'TITULO'#9'30'#9'TITULO')
                DataField = 'IDCARGO'
                DataSource = dsDet
                LookupTable = qryCargo
                LookupField = 'IDCARGO'
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
                AllowClearKey = True
                OnCloseUp = dblcCargoCloseUp
              end
            end
            object gbxLotacao: TGroupBox
              Left = 234
              Top = 122
              Width = 360
              Height = 92
              Caption = 'Lotação'
              TabOrder = 5
              object Label3: TLabel
                Left = 9
                Top = 13
                Width = 94
                Height = 13
                Caption = 'Estabelecimento'
              end
              object Label7: TLabel
                Left = 10
                Top = 50
                Width = 92
                Height = 13
                Caption = 'Centro de Custo'
              end
              object dblcEstab: TwwDBLookupCombo
                Left = 9
                Top = 27
                Width = 340
                Height = 21
                DropDownAlignment = taRightJustify
                Selected.Strings = (
                  'NOME'#9'60'#9'NOME')
                DataField = 'IDESTAB'
                DataSource = dsDet
                LookupTable = qryEstab
                LookupField = 'IDPESSOA'
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
                AllowClearKey = True
              end
              object dblcLotac: TwwDBLookupCombo
                Left = 9
                Top = 63
                Width = 100
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'CODCENTROCUSTO'#9'10'#9'Código'
                  'NOME'#9'30'#9'Nome')
                DataField = 'CODCENTROCUSTO'
                DataSource = dsDet
                LookupTable = qryLotac
                LookupField = 'CODCENTROCUSTO'
                Options = [loColLines, loTitles]
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
                AllowClearKey = True
                OnCloseUp = dblcLotacCloseUp
              end
              object dbedNomeCC: TwwDBEdit
                Left = 111
                Top = 63
                Width = 235
                Height = 21
                Color = clGray
                DataField = 'CENTROCUSTO'
                DataSource = dsDet
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 2
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
            end
            object dbedDatEfet: TCMDateTimePicker
              Left = 482
              Top = 14
              Width = 112
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAALTERFUNC'
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
              TabOrder = 1
              OnExit = dbedDatEfetExit
            end
            object gbxCargo2: TGroupBox
              Left = 234
              Top = 80
              Width = 360
              Height = 42
              Caption = 'Cargo Alternativo ou Função'
              TabOrder = 6
              object dblcFuncao: TwwDBLookupCombo
                Left = 9
                Top = 14
                Width = 340
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'TITULO'#9'30'#9'TITULO')
                DataField = 'IDFUNCAO'
                DataSource = dsDet
                LookupTable = qryCargo2
                LookupField = 'IDCARGO'
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
                AllowClearKey = True
              end
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 705
        object Toolbar972: TToolbar97
          Left = 105
          Top = 0
          Caption = 'tb97BotoesDetalhe'
          DockPos = 105
          TabOrder = 1
          object sbtnImprimirEtiqueta: TSpeedButton
            Left = 0
            Top = 0
            Width = 25
            Height = 25
            Hint = 'Imprimir Etiqueta referente ao registro atualmente posicionado'
            Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              0400000000006801000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888880008
              8888888888888F7778FF8888000088888800877008888888888F7787F778FF88
              0000888800880007700888888F778F7778F778FF000088008800877007700888
              778F7787F778F778000080880088877770077087FF778887F88778F700008700
              888887777770008777888887FF888777000080888888F77777777087F8888F77
              78FF88870000878888FF888777777087F88F77888778FF8700008788FF888888
              87777087FF778888888778F7000087FF88899888888770877788888888888777
              000087888AA88888808880878FF8888888FFF8F700008877F888888FF0877888
              778FF88FF77787780000888877F87FFFFF08888888778F77788878F800008888
              88777FFFFFF088888888777FF888878F00008888888877FFFFFF008888888877
              8F888F77000088888888887FFF7788888888888878FF77880000888888888887
              7788888888888888877788880000888888888888888888888888888888888888
              0000}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnImprimirEtiquetaClick
          end
          object sbtnConfigEtiqueta: TSpeedButton
            Left = 25
            Top = 0
            Width = 25
            Height = 25
            Hint = 'Alterar Layout de Etiquetas'
            Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              0400000000006801000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888880008
              8888888888888F7778FF8888000088888800877008888888888F7787F778FF88
              0000888800880007700888888F778F7778F778FF000088008800877007700888
              778F7787F778F778000080880088877770077087FF778887F88778F700008700
              888887777770008777888887FF888777000080888888F77777777087F8888F77
              78FF88870000878888FF888777777087F88F77888778FF8700008788FF888888
              87777087FF778888888778F7000087FF88099888888770877788888888888777
              0000878880E08888808880878FF8888888FFF8F7000088770EEE088FF0877888
              778FF88FF777877800008880000EE0000000008888778F77788878F800008888
              880EEEEEEEEEE0888888777FF888878F00008888880EEEEEEEEEE08888888877
              8F888F7700008880000EE000000000888888888878FF7788000088880EEE0887
              7788888888888888877788880000888880E08888888888888888888888888888
              0000}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnConfigEtiquetaClick
          end
          object sbtnDesfConfigEtiqueta: TSpeedButton
            Left = 50
            Top = 0
            Width = 25
            Height = 25
            Hint = 'Restaurar Alteração do Layout de Etiquetas'
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888888888888888888888888888888888888888888888888888444488
              8888888887777888888888884444444488888887777777788888888444888844
              4888887778888777888888844888888448888877888888778888884488888888
              4488877888888887788888448888888844888778888888877888884488888888
              4488877888888887788888448888888844888778888888877888888448888484
              4888887788887877888888844888844448888877888877778888888888888444
              8888888888887778888888888888844448888888888877778888888888888888
              8888888888888888888888888888888888888888888888888888}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnDesfConfigEtiquetaClick
          end
        end
      end
      inherited Dock974: TDock97
        Left = 619
        Height = 244
      end
    end
  end
  inherited Dock972: TDock97
    Width = 721
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Enabled = False
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 413
    Width = 721
    inherited tb97Fundo: TToolbar97
      Left = 552
      DockPos = 560
      inherited sep1: TToolbarSep97
        SizeHorz = 2
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 385
      DockPos = 393
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      
        '  F.MATRICULA, ('#39'  '#39' || P.NOME) AS NOME, ('#39'  '#39' || C.TITULO) AS T' +
        'ITULO,'
      '  ('#39'  '#39' || S.DESCRICAO) AS DESCRICAO, F.IDPESSOA,'
      '  F.IDEMPRESA, F.CODCENTROCUSTO, F.IDESTAB, F.IDCARGO,'
      '  F.IDFUNCAO, F.DATACARGO2,'
      '  F.SALARIOATUAL, F.DATASALARIO, F.DATACARGO, F.DATALOTACAO,'
      '  F.TIPOPAGAMENTO, CC.NOME AS CENTROCUSTO'
      'FROM'
      '  PESSOA P, FUNCIONARIO F, SITFUNC S, CARGO C,  CENTCUST CC'
      'WHERE'
      '  (F.IDPESSOA       = :IDPESSOA)   AND'
      '  (F.IDCARGO        = C.IDCARGO)   AND'
      '  (F.IDPESSOA       = P.IDPESSOA)  AND'
      '  (F.IDSITFUNC      = S.IDSITFUNC) AND'
      '  (F.IDEMPRESA      = CC.IDEMPRESA(+)) AND'
      '  (F.CODCENTROCUSTO = CC.CODCENTROCUSTO(+))')
    Left = 292
    Top = 1
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = 10329
      end>
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    OnStateChange = dsDetStateChange
    Left = 506
    Top = 1
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
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update FUNCIONARIO'
      'set'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  IDESTAB = :IDESTAB,'
      '  IDCARGO = :IDCARGO,'
      '  IDFUNCAO = :IDFUNCAO,'
      '  DATACARGO2 = :DATACARGO2,'
      '  SALARIOATUAL = :SALARIOATUAL,'
      '  DATASALARIO = :DATASALARIO,'
      '  DATACARGO = :DATACARGO,'
      '  DATALOTACAO = :DATALOTACAO,'
      '  TIPOPAGAMENTO = :TIPOPAGAMENTO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into FUNCIONARIO'
      '  (CODCENTROCUSTO, IDESTAB, IDCARGO, IDFUNCAO, DATACARGO2, '
      'SALARIOATUAL, '
      '   DATASALARIO, DATACARGO, DATALOTACAO, TIPOPAGAMENTO)'
      'values'
      '  (:CODCENTROCUSTO, :IDESTAB, :IDCARGO, :IDFUNCAO, :DATACARGO2, '
      ':SALARIOATUAL, '
      '   :DATASALARIO, :DATACARGO, :DATALOTACAO, :TIPOPAGAMENTO)')
    DeleteSQL.Strings = (
      'delete from FUNCIONARIO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 263
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Registro de Alteração Funcional'
    Colunas.Strings = (
      'PESSOA.NOME'
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
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'FUNCIONARIO'
      'CARGO'
      'EMPRESAPROP')
    CamposChave.Strings = (
      'FUNCIONARIO.IDPESSOA')
    Filtro.Strings = (
      'FUNCIONARIO.IDEMPRESA = EMPRESAPROP.IDPESSOA'
      'FUNCIONARIO.IDCARGO   = CARGO.IDCARGO'
      'FUNCIONARIO.IDPESSOA  = PESSOA.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '22'
      '22'
      '40'
      '60')
    Left = 381
    Top = 1
  end
  inherited ds: TwwDataSource
    Left = 321
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 408
    Top = 108
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update EVOLFUNC'
      'set'
      '  IDEMPRESA = :IDEMPRESA,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  SALARIO = :SALARIO,'
      '  IDMOTIVO = :IDMOTIVO,'
      '  IDESTAB = :IDESTAB,'
      '  IDCARGO = :IDCARGO,'
      '  TIPOPAGAMENTO = :TIPOPAGAMENTO,'
      '  PERC_REAJ = :PERC_REAJ,'
      '  IDFUNCAO = :IDFUNCAO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  DATAALTERFUNC = :OLD_DATAALTERFUNC')
    InsertSQL.Strings = (
      'insert into EVOLFUNC'
      '  (IDPESSOA, DATAALTERFUNC, IDEMPRESA, CODCENTROCUSTO, SALARIO, '
      'IDMOTIVO, '
      '   IDESTAB, IDCARGO, TIPOPAGAMENTO, PERC_REAJ, IDFUNCAO)'
      'values'
      '  (:IDPESSOA, :DATAALTERFUNC, :IDEMPRESA, :CODCENTROCUSTO, '
      ':SALARIO, :IDMOTIVO, '
      '   :IDESTAB, :IDCARGO, :TIPOPAGAMENTO, :PERC_REAJ, :IDFUNCAO)')
    DeleteSQL.Strings = (
      'delete from EVOLFUNC'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  DATAALTERFUNC = :OLD_DATAALTERFUNC')
    Left = 444
    Top = 1
  end
  object qryMotivo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDMOTIVO, DESCRICAO'
      'FROM'
      '  MOTIVO'
      'WHERE'
      '  (GRUPOMOTIVO = '#39'A'#39')'
      'ORDER BY'
      '  UPPER(DESCRICAO)')
    ValidateWithMask = True
    Left = 638
    Top = 264
  end
  object qryCargo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDCARGO, TITULO'
      'FROM'
      '  CARGO'
      'ORDER BY'
      '  UPPER(TITULO)')
    ValidateWithMask = True
    Left = 674
    Top = 337
  end
  object qryEstab: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  PJ.IDPESSOA, PJ.NOME'
      'FROM'
      '  PESSOA PJ, FILIALPESSOA FP'
      'WHERE'
      ''
      '  (PJ.IDGRUPO        = :EMPRESA) AND'
      '  (FP.IDFILIALPESSOA = PJ.IDPESSOA)')
    ValidateWithMask = True
    Left = 636
    Top = 312
    ParamData = <
      item
        DataType = ftFloat
        Name = 'EMPRESA'
        ParamType = ptUnknown
      end>
  end
  object qryLotac: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CODCENTROCUSTO, NOME, IDEMPRESA'
      'FROM'
      '  CENTCUST'
      'WHERE'
      '  (IDEMPRESA = :EMPRESA)'
      'ORDER BY'
      '  UPPER(NOME)')
    ValidateWithMask = True
    Left = 680
    Top = 248
    ParamData = <
      item
        DataType = ftFloat
        Name = 'EMPRESA'
        ParamType = ptUnknown
      end>
  end
  object qryFaixa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  F.*'
      'FROM'
      '  FAIXASAL F, CARGO C'
      'WHERE'
      '  (C.IDCARGO         = :IDCARGO) AND'
      '  (F.IDFAIXASALARIAL = C.IDFAIXASALARIAL)')
    ValidateWithMask = True
    Left = 678
    Top = 292
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCARGO'
        ParamType = ptUnknown
      end>
  end
  object qryCesAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  H.SALARIO'
      'FROM'
      '  EVOLFUNC H'
      'WHERE'
      '  (H.IDPESSOA   = :IDPESSOA) AND'
      '  (H.DATAALTERFUNC = (SELECT MAX(DATAALTERFUNC)'
      '                      FROM   EVOLFUNC'
      '                      WHERE (IDPESSOA      = :IDPESSOA) AND'
      '                            (DATAALTERFUNC < :DATAREF)))')
    ValidateWithMask = True
    Left = 640
    Top = 358
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATAREF'
        ParamType = ptUnknown
      end>
  end
  object qryDet: TwwQuery
    Tag = 5
    CachedUpdates = True
    BeforePost = qryDetBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  H.IDPESSOA, H.DATAALTERFUNC, H.IDEMPRESA,'
      '  H.CODCENTROCUSTO, H.SALARIO, H.IDMOTIVO,'
      '  H.IDESTAB, H.IDCARGO, H.TIPOPAGAMENTO, H.PERC_REAJ,'
      '  H.IDFUNCAO,'
      '  M.DESCRICAO,'
      '  C.TITULO, C2.TITULO AS FUNCAO,'
      '  P.NOME AS FILIAL,'
      '  CC.NOME AS CENTROCUSTO'
      'FROM'
      '  PESSOA P, EVOLFUNC H, MOTIVO M, CARGO C, CARGO C2,'
      '  CENTCUST CC'
      'WHERE'
      '  (M.GRUPOMOTIVO   IN ('#39'A'#39','#39'D'#39'))            AND'
      '  (H.IDPESSOA       = :IDPESSOA)            AND'
      '  (H.IDMOTIVO       = M.IDMOTIVO(+))        AND'
      '  (H.IDCARGO        = C.IDCARGO(+))         AND'
      '  (H.IDFUNCAO        = C2.IDCARGO(+))         AND'
      '  (H.IDEMPRESA      = CC.IDEMPRESA(+))      AND'
      '  (H.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) AND'
      '  (H.IDESTAB        = P.IDPESSOA(+))'
      'ORDER BY'
      '  H.DATAALTERFUNC DESC')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 475
    Top = 1
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryDetDATAALTERFUNC: TDateTimeField
      DisplayLabel = 'Data Efet.'
      DisplayWidth = 10
      FieldName = 'DATAALTERFUNC'
    end
    object qryDetDESCRICAO: TStringField
      DisplayLabel = 'Tipo de Evento'
      DisplayWidth = 50
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object qryDetSALARIO: TFloatField
      DisplayLabel = 'Salário'
      DisplayWidth = 10
      FieldName = 'SALARIO'
      DisplayFormat = '#,0.00;#,0.00'
    end
    object qryDetTIPOPAGAMENTO: TStringField
      DisplayLabel = 'Freq.'
      DisplayWidth = 1
      FieldName = 'TIPOPAGAMENTO'
      Size = 1
    end
    object qryDetPERC_REAJ: TFloatField
      DisplayLabel = '% Reaj.'
      DisplayWidth = 10
      FieldName = 'PERC_REAJ'
      DisplayFormat = '#,0.00;#,0.00'
    end
    object qryDetTITULO: TStringField
      DisplayLabel = 'Cargo'
      DisplayWidth = 40
      FieldName = 'TITULO'
      Size = 40
    end
    object qryDetFUNCAO: TStringField
      DisplayLabel = 'Cargo Alternativo ou Função'
      DisplayWidth = 40
      FieldName = 'FUNCAO'
      Size = 40
    end
    object qryDetCENTROCUSTO: TStringField
      DisplayLabel = 'Centro de Custo'
      DisplayWidth = 30
      FieldName = 'CENTROCUSTO'
      Size = 30
    end
    object qryDetFILIAL: TStringField
      DisplayLabel = 'Estabelecimento'
      DisplayWidth = 60
      FieldName = 'FILIAL'
      Size = 60
    end
    object qryDetIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryDetIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Visible = False
    end
    object qryDetCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Visible = False
      Size = 10
    end
    object qryDetIDMOTIVO: TFloatField
      FieldName = 'IDMOTIVO'
      Visible = False
    end
    object qryDetIDESTAB: TFloatField
      FieldName = 'IDESTAB'
      Visible = False
    end
    object qryDetIDCARGO: TFloatField
      FieldName = 'IDCARGO'
      Visible = False
    end
    object qryDetIDFUNCAO: TFloatField
      FieldName = 'IDFUNCAO'
      Visible = False
    end
  end
  object qryParamRH: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  NUMSTEPS, FLGDOISCARGOS'
      'FROM'
      '  PARAMRH')
    ValidateWithMask = True
    Left = 571
    Top = 1
  end
  object qryCargo2: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDCARGO, TITULO'
      'FROM'
      '  CARGO'
      'ORDER BY'
      '  UPPER(TITULO)')
    ValidateWithMask = True
    Left = 674
    Top = 385
  end
end
