inherited frmCadParam: TfrmCadParam
  Left = 132
  Top = 86
  Caption = 'Parâmetros do Sistema'
  ClientHeight = 422
  ClientWidth = 597
  OnCloseQuery = nil
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 597
    Height = 336
    BorderWidth = 2
    object pgctrlPaginas: TPageControl
      Left = 4
      Top = 4
      Width = 589
      Height = 328
      ActivePage = tbshUsoPessoal
      Align = alClient
      TabOrder = 0
      object tbshUsoPessoal: TTabSheet
        Caption = 'UsoPessoal'
        ImageIndex = 3
        object dbrgUsoPessoal: TDBRadioGroup
          Left = 62
          Top = 7
          Width = 457
          Height = 97
          Caption = 'A Tela de Uso Pessoal Será Chamada'
          DataField = 'FLGSENHAUSOPES'
          DataSource = ds
          Items.Strings = (
            'Apenas Pela Senha do Usuário (Que é Empregado)'
            'Apenas Pela Informação de Alguns Dados Pessoais'
            
              'Pela Senha do Usuário Em 1ª Instância, Senão Pelos Dados Pessoai' +
              's'
            'Não Exibe a Tela')
          TabOrder = 0
          Values.Strings = (
            '1'
            '0'
            '3'
            '2')
        end
        object gbxAutor: TGroupBox
          Left = 62
          Top = 109
          Width = 457
          Height = 185
          Caption = 'Na Tela de Uso Pessoal, além de consultar, a pessoa poderá'
          TabOrder = 1
          object Label18: TLabel
            Left = 24
            Top = 24
            Width = 36
            Height = 13
            Caption = 'Inserir'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold, fsUnderline]
            ParentColor = False
            ParentFont = False
          end
          object Label19: TLabel
            Left = 72
            Top = 24
            Width = 38
            Height = 13
            Caption = 'Alterar'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold, fsUnderline]
            ParentColor = False
            ParentFont = False
          end
          object Label20: TLabel
            Left = 125
            Top = 24
            Width = 39
            Height = 13
            Caption = 'Excluir'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold, fsUnderline]
            ParentColor = False
            ParentFont = False
          end
          object Label21: TLabel
            Left = 184
            Top = 40
            Width = 109
            Height = 13
            Caption = 'Seu(s) Endereço(s)'
          end
          object Label22: TLabel
            Left = 184
            Top = 60
            Width = 105
            Height = 13
            Caption = 'Seu(s) Telefone(s)'
          end
          object Label23: TLabel
            Left = 184
            Top = 80
            Width = 122
            Height = 13
            Caption = 'Pessoa(s) de Contato'
          end
          object Label24: TLabel
            Left = 184
            Top = 100
            Width = 190
            Height = 13
            Caption = 'Cursos Realizados por Sua Conta'
          end
          object Label25: TLabel
            Left = 184
            Top = 120
            Width = 163
            Height = 13
            Caption = 'Programação de Suas Férias'
          end
          object Label26: TLabel
            Left = 184
            Top = 160
            Width = 248
            Height = 13
            Caption = 'Sua Conta Bancária para Crédito do Salário'
          end
          object Label27: TLabel
            Left = 184
            Top = 140
            Width = 149
            Height = 13
            Caption = 'Seus Empregos Anteriores'
          end
          object dbcbxInsEnder: TDBCheckBox
            Left = 37
            Top = 40
            Width = 13
            Height = 17
            DataField = 'FLGENDERINS'
            DataSource = ds
            TabOrder = 0
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbcbxAltEnder: TDBCheckBox
            Left = 84
            Top = 40
            Width = 13
            Height = 17
            Caption = 'dbcbxAltEnder'
            DataField = 'FLGENDERALT'
            DataSource = ds
            TabOrder = 1
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbcbxExcEnder: TDBCheckBox
            Left = 135
            Top = 40
            Width = 13
            Height = 17
            Caption = 'dbcbxExcEnder'
            DataField = 'FLGENDEREXC'
            DataSource = ds
            TabOrder = 2
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbcbxInsTelef: TDBCheckBox
            Left = 37
            Top = 60
            Width = 13
            Height = 17
            Caption = 'dbcbxInsTelef'
            DataField = 'FLGTELEFINS'
            DataSource = ds
            TabOrder = 3
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbcbxAltTelef: TDBCheckBox
            Left = 84
            Top = 60
            Width = 13
            Height = 17
            Caption = 'dbcbxAltEnder'
            DataField = 'FLGTELEFALT'
            DataSource = ds
            TabOrder = 4
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbcbxExcTelef: TDBCheckBox
            Left = 135
            Top = 60
            Width = 13
            Height = 17
            Caption = 'dbcbxExcEnder'
            DataField = 'FLGTELEFEXC'
            DataSource = ds
            TabOrder = 5
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbcbxInsContt: TDBCheckBox
            Left = 37
            Top = 80
            Width = 13
            Height = 17
            Caption = 'dbcbxInsTelef'
            DataField = 'FLGCONTTINS'
            DataSource = ds
            TabOrder = 6
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbcbxAltContt: TDBCheckBox
            Left = 84
            Top = 80
            Width = 13
            Height = 17
            Caption = 'dbcbxAltEnder'
            DataField = 'FLGCONTTALT'
            DataSource = ds
            TabOrder = 7
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbcbxExcContt: TDBCheckBox
            Left = 135
            Top = 80
            Width = 13
            Height = 17
            Caption = 'dbcbxExcEnder'
            DataField = 'FLGCONTTEXC'
            DataSource = ds
            TabOrder = 8
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbcbxInsCurso: TDBCheckBox
            Left = 37
            Top = 100
            Width = 13
            Height = 17
            Caption = 'dbcbxInsTelef'
            DataField = 'FLGCURSOINS'
            DataSource = ds
            TabOrder = 9
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbcbxAltCurso: TDBCheckBox
            Left = 84
            Top = 100
            Width = 13
            Height = 17
            Caption = 'dbcbxAltEnder'
            DataField = 'FLGCURSOALT'
            DataSource = ds
            TabOrder = 10
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbcbxExcCurso: TDBCheckBox
            Left = 135
            Top = 100
            Width = 13
            Height = 17
            Caption = 'dbcbxExcEnder'
            DataField = 'FLGCURSOEXC'
            DataSource = ds
            TabOrder = 11
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbcbxInsFeria: TDBCheckBox
            Left = 37
            Top = 120
            Width = 13
            Height = 17
            Caption = 'dbcbxInsTelef'
            DataField = 'FLGFERIAINS'
            DataSource = ds
            TabOrder = 12
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbcbxAltFeria: TDBCheckBox
            Left = 84
            Top = 120
            Width = 13
            Height = 17
            Caption = 'dbcbxAltEnder'
            DataField = 'FLGFERIAALT'
            DataSource = ds
            TabOrder = 13
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbcbxExcFeria: TDBCheckBox
            Left = 135
            Top = 120
            Width = 13
            Height = 17
            Caption = 'dbcbxExcEnder'
            DataField = 'FLGFERIAEXC'
            DataSource = ds
            TabOrder = 14
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbcbxEmprgIns: TDBCheckBox
            Left = 37
            Top = 140
            Width = 13
            Height = 17
            Caption = 'dbcbxInsTelef'
            DataField = 'FLGEMPRGINS'
            DataSource = ds
            TabOrder = 15
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbcbxEmprgAlt: TDBCheckBox
            Left = 84
            Top = 140
            Width = 13
            Height = 17
            Caption = 'dbcbxAltEnder'
            DataField = 'FLGEMPRGALT'
            DataSource = ds
            TabOrder = 16
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbcbxEmprgExc: TDBCheckBox
            Left = 135
            Top = 140
            Width = 13
            Height = 17
            Caption = 'dbcbxExcEnder'
            DataField = 'FLGEMPRGEXC'
            DataSource = ds
            TabOrder = 17
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object dbcbxAltCtSal: TDBCheckBox
            Left = 84
            Top = 160
            Width = 13
            Height = 17
            Caption = 'dbcbxAltEnder'
            DataField = 'FLGCTSALALT'
            DataSource = ds
            TabOrder = 18
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
      object TabSheet1: TTabSheet
        Caption = 'Matrícula e Contratos'
        ImageIndex = 4
        object rgTipDurContr: TDBRadioGroup
          Left = 113
          Top = 224
          Width = 355
          Height = 40
          Caption = 'Tipo de Duração do Contrato de Trabalho'
          Columns = 4
          DataField = 'INDDURACAOCONTR'
          DataSource = ds
          Items.Strings = (
            'Dias'
            'Semanas'
            'Meses'
            'Anos')
          TabOrder = 0
          Values.Strings = (
            '1'
            '2'
            '3'
            '4')
        end
        object gbxTamMatric: TGroupBox
          Left = 198
          Top = 103
          Width = 185
          Height = 57
          Caption = 'Tamanho da Matrícula'
          TabOrder = 1
          object wwDBSpinEdit1: TwwDBSpinEdit
            Left = 71
            Top = 21
            Width = 43
            Height = 21
            Increment = 1
            MaxValue = 9
            MinValue = 1
            DataField = 'TAMANHOMATRIC'
            DataSource = ds
            TabOrder = 0
            UnboundDataType = wwDefault
          end
        end
        object dbrgNumeraMatric: TDBRadioGroup
          Left = 113
          Top = 37
          Width = 355
          Height = 40
          Caption = 'Deseja Numerar Matrícula Sequencial e Automaticamente ?'
          Columns = 2
          DataField = 'FLGNUMERAMATRIC'
          DataSource = ds
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 2
          Values.Strings = (
            '1'
            '0')
          OnChange = dbrgNumeraMatricChange
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 597
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
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
    Top = 383
    Width = 597
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT * '
      'FROM  PARAMRH')
    Left = 330
    Top = 6
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 248
    Top = 6
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PARAMRH'
      'set'
      '  MOEDAPROCTRAB = :MOEDAPROCTRAB,'
      '  IDMOTIVO = :IDMOTIVO,'
      '  IDRUBIRRF = :IDRUBIRRF,'
      '  MATRDIS = :MATRDIS,'
      '  LIMADM = :LIMADM,'
      '  LIMDEM = :LIMDEM,'
      '  LIMAFAST = :LIMAFAST,'
      '  LIMRETOR = :LIMRETOR,'
      '  NUMSTEPS = :NUMSTEPS,'
      '  TITSTEP1 = :TITSTEP1,'
      '  TITSTEP2 = :TITSTEP2,'
      '  TITSTEP3 = :TITSTEP3,'
      '  TITSTEP4 = :TITSTEP4,'
      '  TITSTEP5 = :TITSTEP5,'
      '  TITSTEP6 = :TITSTEP6,'
      '  TITSTEP7 = :TITSTEP7,'
      '  TITSTEP8 = :TITSTEP8,'
      '  TITSTEP9 = :TITSTEP9,'
      '  IDRUBFGTS = :IDRUBFGTS,'
      '  IDRUBINSS = :IDRUBINSS,'
      '  IDRUB13 = :IDRUB13,'
      '  IDRUBANTEC13 = :IDRUBANTEC13,'
      '  NORMALINI = :NORMALINI,'
      '  NORMALFIM = :NORMALFIM,'
      '  FERIASINI = :FERIASINI,'
      '  FERIASFIM = :FERIASFIM,'
      '  PGTO13INI = :PGTO13INI,'
      '  PGTO13FIM = :PGTO13FIM,'
      '  FLGDOISCARGOS = :FLGDOISCARGOS,'
      '  FLGNIVELINDIV = :FLGNIVELINDIV,'
      '  IDRUBFALTA = :IDRUBFALTA,'
      '  FLGINTEGRACONT = :FLGINTEGRACONT,'
      '  FLGINTEGRACAP = :FLGINTEGRACAP,'
      '  FLGCRIASUBCONTA = :FLGCRIASUBCONTA,'
      '  FLGSENHAUSOPES = :FLGSENHAUSOPES,'
      '  FLGENDERINS = :FLGENDERINS,'
      '  FLGENDERALT = :FLGENDERALT,'
      '  FLGENDEREXC = :FLGENDEREXC,'
      '  FLGTELEFINS = :FLGTELEFINS,'
      '  FLGTELEFALT = :FLGTELEFALT,'
      '  FLGTELEFEXC = :FLGTELEFEXC,'
      '  FLGCONTTINS = :FLGCONTTINS,'
      '  FLGCONTTALT = :FLGCONTTALT,'
      '  FLGCONTTEXC = :FLGCONTTEXC,'
      '  FLGCURSOINS = :FLGCURSOINS,'
      '  FLGCURSOALT = :FLGCURSOALT,'
      '  FLGCURSOEXC = :FLGCURSOEXC,'
      '  FLGFERIAINS = :FLGFERIAINS,'
      '  FLGFERIAALT = :FLGFERIAALT,'
      '  FLGFERIAEXC = :FLGFERIAEXC,'
      '  FLGEMPRGINS = :FLGEMPRGINS,'
      '  FLGEMPRGALT = :FLGEMPRGALT,'
      '  FLGEMPRGEXC = :FLGEMPRGEXC,'
      '  FLGCTSALALT = :FLGCTSALALT,'
      '  FLGLINHAINS = :FLGLINHAINS,'
      '  FLGLINHAALT = :FLGLINHAALT,'
      '  FLGLINHAEXC = :FLGLINHAEXC,'
      '  INDDURACAOCONTR = :INDDURACAOCONTR,'
      '  FLGNUMERAMATRIC = :FLGNUMERAMATRIC,'
      '  TAMANHOMATRIC = :TAMANHOMATRIC'
      '')
    InsertSQL.Strings = (
      'insert into PARAMRH'
      '  (MOEDAPROCTRAB, IDMOTIVO, IDRUBIRRF, MATRDIS, LIMADM, LIMDEM, '
      'LIMAFAST, '
      '   LIMRETOR, NUMSTEPS, TITSTEP1, TITSTEP2, TITSTEP3, TITSTEP4, '
      'TITSTEP5, '
      
        '   TITSTEP6, TITSTEP7, TITSTEP8, TITSTEP9, IDRUBFGTS, IDRUBINSS,' +
        ' '
      'IDRUB13, '
      '   IDRUBANTEC13, NORMALINI, NORMALFIM, FERIASINI, FERIASFIM, '
      'PGTO13INI, '
      '   PGTO13FIM, FLGDOISCARGOS, FLGNIVELINDIV, IDRUBFALTA, '
      'FLGINTEGRACONT, '
      '   FLGINTEGRACAP, FLGCRIASUBCONTA, FLGSENHAUSOPES, FLGENDERINS, '
      'FLGENDERALT, '
      
        '   FLGENDEREXC, FLGTELEFINS, FLGTELEFALT, FLGTELEFEXC, FLGCONTTI' +
        'NS, '
      'FLGCONTTALT, '
      '   FLGCONTTEXC, FLGCURSOINS, FLGCURSOALT, FLGCURSOEXC, '
      'FLGFERIAINS, FLGFERIAALT, '
      '   FLGFERIAEXC, FLGEMPRGINS, FLGEMPRGALT, FLGEMPRGEXC, '
      'FLGCTSALALT, FLGLINHAINS, '
      '   FLGLINHAALT, FLGLINHAEXC, INDDURACAOCONTR, FLGNUMERAMATRIC, '
      'TAMANHOMATRIC)'
      'values'
      
        '  (:MOEDAPROCTRAB, :IDMOTIVO, :IDRUBIRRF, :MATRDIS, :LIMADM, :LI' +
        'MDEM, '
      ':LIMAFAST, '
      
        '   :LIMRETOR, :NUMSTEPS, :TITSTEP1, :TITSTEP2, :TITSTEP3, :TITST' +
        'EP4, '
      ':TITSTEP5, '
      
        '   :TITSTEP6, :TITSTEP7, :TITSTEP8, :TITSTEP9, :IDRUBFGTS, :IDRU' +
        'BINSS, '
      '   :IDRUB13, :IDRUBANTEC13, :NORMALINI, :NORMALFIM, :FERIASINI, '
      ':FERIASFIM, '
      
        '   :PGTO13INI, :PGTO13FIM, :FLGDOISCARGOS, :FLGNIVELINDIV, :IDRU' +
        'BFALTA, '
      '   :FLGINTEGRACONT, :FLGINTEGRACAP, :FLGCRIASUBCONTA, '
      ':FLGSENHAUSOPES, '
      '   :FLGENDERINS, :FLGENDERALT, :FLGENDEREXC, :FLGTELEFINS, '
      ':FLGTELEFALT, '
      '   :FLGTELEFEXC, :FLGCONTTINS, :FLGCONTTALT, :FLGCONTTEXC, '
      ':FLGCURSOINS, '
      '   :FLGCURSOALT, :FLGCURSOEXC, :FLGFERIAINS, :FLGFERIAALT, '
      ':FLGFERIAEXC, '
      '   :FLGEMPRGINS, :FLGEMPRGALT, :FLGEMPRGEXC, :FLGCTSALALT, '
      ':FLGLINHAINS, '
      
        '   :FLGLINHAALT, :FLGLINHAEXC, :INDDURACAOCONTR, :FLGNUMERAMATRI' +
        'C, '
      ':TAMANHOMATRIC)')
    DeleteSQL.Strings = (
      'delete from PARAMRH')
    Left = 395
    Top = 6
  end
  inherited MontaSelect: TMontaSelect
    Left = 429
    Top = 6
  end
  inherited ds: TwwDataSource
    Left = 363
    Top = 6
  end
  inherited ImlPadrao: TImageList
    Left = 289
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 470
    Top = 2
  end
end
