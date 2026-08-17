inherited frmCadProcesso: TfrmCadProcesso
  HelpContext = 1110014
  Caption = 'Processo Judicial'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnlMestre: TPanel
      inherited Label30: TLabel
        Left = 214
      end
      inherited Label2: TLabel
        Width = 100
        Caption = 'Data Ajuizamento'
      end
      inherited Label19: TLabel
        Left = 111
        Width = 97
        Caption = 'Data Notificação'
      end
      inherited dbedNumProcesso: TDBEdit
        Width = 100
      end
      inherited dbedNumJCJ: TDBEdit
        Left = 214
        Width = 195
        TabOrder = 4
      end
      inherited dbedDataAju: TCMDateTimePicker
        Width = 100
        TabOrder = 1
      end
      inherited dbedDataNot: TCMDateTimePicker
        Left = 111
        Width = 100
      end
      inherited rgSituacao: TDBRadioGroup
        Left = 111
        Top = 4
        Width = 100
        Height = 46
        TabOrder = 2
      end
      inherited gbxSitContraparte: TGroupBox
        Left = 413
        Width = 320
        TabOrder = 7
        inherited dblckMotivoContraparte: TwwDBLookupCombo
          Left = 85
          Width = 228
        end
      end
      object rgAtivo: TDBRadioGroup [10]
        Left = 214
        Top = 43
        Width = 86
        Height = 50
        Caption = 'Somos Parte'
        DataField = 'FLGPARTEATIVA'
        DataSource = ds
        Items.Strings = (
          'Passiva'
          'Ativa')
        TabOrder = 5
        Values.Strings = (
          '0'
          '1')
      end
      object dbrgMateria: TDBRadioGroup [11]
        Left = 304
        Top = 43
        Width = 105
        Height = 50
        Hint = 'Civil, Comercial, Tributária ou Penal'
        Caption = 'Matéria'
        Columns = 2
        DataField = 'INDMATERIA'
        DataSource = ds
        Items.Strings = (
          'Civil'
          'Coml'
          'Trib'
          'Penl')
        TabOrder = 6
        Values.Strings = (
          '4'
          '5'
          '6'
          '7')
      end
      inherited gbxContraparte: TGroupBox
        TabOrder = 8
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      inherited pgctrlDetalhe: TPageControl
        inherited tbshContraparte: TTabSheet
          object Label60: TLabel
            Left = 75
            Top = 29
            Width = 76
            Height = 13
            Caption = 'Razão Social'
          end
          object Label61: TLabel
            Left = 75
            Top = 62
            Width = 77
            Height = 13
            Caption = 'CPF ou CNPJ'
          end
          object Label62: TLabel
            Left = 75
            Top = 95
            Width = 31
            Height = 13
            Caption = 'Email'
          end
          object Label63: TLabel
            Left = 75
            Top = 137
            Width = 55
            Height = 13
            Caption = 'Endereço'
          end
          object dbedRazaoSocial: TDBEdit
            Left = 176
            Top = 26
            Width = 447
            Height = 21
            TabStop = False
            Color = clGray
            DataField = 'RAZAOSOCIAL'
            DataSource = dsPartic
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object dbedNumDoc: TDBEdit
            Left = 176
            Top = 60
            Width = 185
            Height = 21
            TabStop = False
            Color = clGray
            DataField = 'NUMDOCUMENTO'
            DataSource = dsPartic
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object dbrgTipoPessoa: TDBRadioGroup
            Left = 438
            Top = 52
            Width = 185
            Height = 36
            Columns = 2
            DataField = 'TIPO'
            DataSource = dsPartic
            Items.Strings = (
              'Física'
              'Juridica')
            ReadOnly = True
            TabOrder = 2
            Values.Strings = (
              'F'
              'J')
          end
          object dbedEmail: TDBEdit
            Left = 176
            Top = 90
            Width = 185
            Height = 21
            TabStop = False
            Color = clGray
            DataField = 'EMAIL'
            DataSource = dsPartic
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object dbedLogradouro: TDBEdit
            Left = 176
            Top = 133
            Width = 259
            Height = 21
            TabStop = False
            Color = clGray
            DataField = 'LOGRADOURO'
            DataSource = dsPartic
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
          end
          object dbedNumLogradouro: TDBEdit
            Left = 439
            Top = 133
            Width = 90
            Height = 21
            TabStop = False
            Color = clGray
            DataField = 'NUMERO'
            DataSource = dsPartic
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
          end
          object dbedComplementoLogradouro: TDBEdit
            Left = 533
            Top = 133
            Width = 90
            Height = 21
            TabStop = False
            Color = clGray
            DataField = 'COMPLEMENTO'
            DataSource = dsPartic
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 6
          end
          object dbedBairro: TDBEdit
            Left = 176
            Top = 167
            Width = 259
            Height = 21
            TabStop = False
            Color = clGray
            DataField = 'BAIRRO'
            DataSource = dsPartic
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 7
          end
        end
      end
    end
  end
  inherited MontaSelect: TMontaSelect
    TipodeDado.Strings = (
      'C'
      'D'
      'C'
      'C'
      'N'
      'C'
      'C'
      'C'
      'N')
  end
  inherited MontaSelectProcVinc: TMontaSelect
    TipodeDado.Strings = (
      'C'
      'D'
      'C'
      'C'
      'N'
      'C'
      'C'
      'C'
      'N')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
  end
  inherited CdsCCusto: TCMClientDataSet
    IndexDefs = <
      item
        Name = 'CdsCCustoIndex'
        Fields = 'NOME'
        Options = [ixCaseInsensitive]
      end>
  end
end
