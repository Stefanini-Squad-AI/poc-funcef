inherited frmCadProcesso: TfrmCadProcesso
  HelpContext = 1100013
  Caption = 'Processo Previdenciário'
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
        DataField = 'INDMATERIA'
        DataSource = ds
        Items.Strings = (
          'Previdenc.'
          'Previd/Trab')
        TabOrder = 6
        Values.Strings = (
          '2'
          '3')
      end
      inherited gbxContraparte: TGroupBox
        TabOrder = 8
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      inherited pgctrlDetalhe: TPageControl
        inherited tbshContraparte: TTabSheet
          object Label51: TLabel
            Left = 174
            Top = 10
            Width = 33
            Height = 13
            Caption = 'Plano'
          end
          object Label53: TLabel
            Left = 174
            Top = 43
            Width = 53
            Height = 13
            Caption = 'Inscrição'
          end
          object Label54: TLabel
            Left = 174
            Top = 76
            Width = 80
            Height = 13
            Caption = 'Patrocinadora'
          end
          object Label55: TLabel
            Left = 174
            Top = 110
            Width = 73
            Height = 13
            Caption = 'Último Cargo'
          end
          object Label56: TLabel
            Left = 174
            Top = 141
            Width = 79
            Height = 13
            Caption = 'Último Salário'
          end
          object Label57: TLabel
            Left = 174
            Top = 176
            Width = 54
            Height = 13
            Caption = 'Admissão'
          end
          object Label58: TLabel
            Left = 399
            Top = 175
            Width = 55
            Height = 13
            Caption = 'Demissão'
          end
          object Label59: TLabel
            Left = 430
            Top = 43
            Width = 28
            Height = 13
            Caption = 'Data'
          end
          object dbedPlano: TDBEdit
            Left = 295
            Top = 7
            Width = 259
            Height = 21
            TabStop = False
            Color = clGray
            DataField = 'PLANO'
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
          object dbedInscNum: TDBEdit
            Left = 295
            Top = 40
            Width = 90
            Height = 21
            TabStop = False
            Color = clGray
            DataField = 'INSCRICAONUMERO'
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
          object dbedInscData: TDBEdit
            Left = 463
            Top = 40
            Width = 90
            Height = 21
            TabStop = False
            Color = clGray
            DataField = 'INSCRICAODATA'
            DataSource = dsPartic
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object dbedPatrocinadora: TDBEdit
            Left = 295
            Top = 73
            Width = 259
            Height = 21
            TabStop = False
            Color = clGray
            DataField = 'PATROC'
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
          object dbedCargo: TDBEdit
            Left = 295
            Top = 107
            Width = 259
            Height = 21
            TabStop = False
            Color = clGray
            DataField = 'TITULO'
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
          object dbedSalAtual: TDBEdit
            Left = 295
            Top = 139
            Width = 90
            Height = 21
            TabStop = False
            Color = clGray
            DataField = 'SALPARTICIPACAO'
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
          object dbedAdm: TDBEdit
            Left = 295
            Top = 171
            Width = 90
            Height = 21
            TabStop = False
            Color = clGray
            DataField = 'DATAADMISSAO'
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
          object dbedDem: TDBEdit
            Left = 463
            Top = 171
            Width = 90
            Height = 21
            TabStop = False
            Color = clGray
            DataField = 'DATADEMISSAO'
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
        inherited tbshOutrosDados: TTabSheet
          inherited pgCtrlOutrosDados: TPageControl
            inherited tbsInstancias: TTabSheet
              inherited Label29: TLabel
                Left = 83
                Width = 59
                Caption = 'Precatória'
              end
            end
          end
        end
      end
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PESSOA.NOME'
      'PROCESSOTRAB.DATANOTIF'
      'PROCESSOTRAB.PROCJCJNUM'
      'VARAJUSTICA.DESCRICAO'
      'PROCESSOTRAB.FLGSITPROC'
      'PROCESSOTRAB.PROCTRTNUM'
      'PROCESSOTRAB.PROCTSTNUM'
      'PROCESSOTRAB.NUMPROCEXEC'
      'PROCESSOTRAB.NUMPROCTRAB')
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
    Descricao.Strings = (
      'Nome Contraparte'
      'Data de Notificação'
      'Número Proc. na 1a Inst.'
      'Órgão Jurisd. (Vara)'
      'Situação: 0=Abrt,1=Enc.'
      'Número Proc. na 2a Inst.'
      'Número Proc. na 3a Inst.'
      'Número da Precatória'
      'Número Proc. Interno')
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
