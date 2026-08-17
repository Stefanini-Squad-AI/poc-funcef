inherited frmCadParam: TfrmCadParam
  Left = 158
  Top = 92
  Caption = 'Parâmetros do Sistema'
  ClientHeight = 413
  ClientWidth = 486
  OnCloseQuery = nil
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 486
    Height = 327
    BorderWidth = 2
    object pgctrlPaginas: TPageControl
      Left = 2
      Top = 2
      Width = 482
      Height = 323
      ActivePage = tbshUsoPessoal
      Align = alClient
      TabOrder = 0
      object tbshUsoPessoal: TTabSheet
        Caption = 'UsoPessoal'
        ImageIndex = 3
        object dbrgUsoPessoal: TDBRadioGroup
          Left = 6
          Top = 6
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
          Left = 6
          Top = 108
          Width = 457
          Height = 176
          Caption = 'Na Tela de Uso Pessoal, além de consultar, a pessoa poderá'
          TabOrder = 1
          object Label18: TLabel
            Left = 24
            Top = 17
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
            Top = 17
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
            Top = 17
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
            Top = 33
            Width = 109
            Height = 13
            Caption = 'Seu(s) Endereço(s)'
          end
          object Label22: TLabel
            Left = 184
            Top = 53
            Width = 105
            Height = 13
            Caption = 'Seu(s) Telefone(s)'
          end
          object Label23: TLabel
            Left = 184
            Top = 73
            Width = 122
            Height = 13
            Caption = 'Pessoa(s) de Contato'
          end
          object Label24: TLabel
            Left = 184
            Top = 93
            Width = 190
            Height = 13
            Caption = 'Cursos Realizados por Sua Conta'
          end
          object Label25: TLabel
            Left = 184
            Top = 113
            Width = 163
            Height = 13
            Caption = 'Programação de Suas Férias'
          end
          object Label26: TLabel
            Left = 184
            Top = 153
            Width = 248
            Height = 13
            Caption = 'Sua Conta Bancária para Crédito do Salário'
          end
          object Label27: TLabel
            Left = 184
            Top = 133
            Width = 149
            Height = 13
            Caption = 'Seus Empregos Anteriores'
          end
          object dbcbxInsEnder: TDBCheckBox
            Left = 37
            Top = 33
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
            Top = 33
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
            Top = 33
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
            Top = 53
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
            Top = 53
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
            Top = 53
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
            Top = 73
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
            Top = 73
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
            Top = 73
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
            Top = 93
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
            Top = 93
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
            Top = 93
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
            Top = 113
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
            Top = 113
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
            Top = 113
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
            Top = 133
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
            Top = 133
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
            Top = 133
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
            Top = 153
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
          Left = 56
          Top = 216
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
          Left = 56
          Top = 116
          Width = 355
          Height = 57
          Caption = 'Tamanho da Matrícula'
          TabOrder = 1
          object wwDBSpinEdit1: TwwDBSpinEdit
            Left = 31
            Top = 21
            Width = 74
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
          Left = 56
          Top = 37
          Width = 355
          Height = 40
          Caption = 'Deseja Numerar Matrícula Sequencial e Automaticamente?'
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
    Width = 486
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
    Top = 374
    Width = 486
    inherited tb97Fundo: TToolbar97
      Left = 314
      DockPos = 437
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 145
      DockPos = 268
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 425
    Top = 27
  end
  inherited ds: TwwDataSource
    AutoEdit = False
    Left = 270
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 425
    Top = 14
  end
  inherited CmeCadastro: TCmEventosCadastro
    ApplyEdit = CmeCadastroApplyEdit
    Left = 322
    Top = 1
  end
  inherited Cds: TCMClientDataSet
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Left = 425
    Top = 1
  end
end
