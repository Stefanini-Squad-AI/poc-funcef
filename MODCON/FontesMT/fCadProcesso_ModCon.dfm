inherited frmCadProcesso_ModCon: TfrmCadProcesso_ModCon
  Left = 23
  Top = 58
  Caption = 'Processo Trabalhista'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnlMestre: TPanel
      object Label13: TLabel [0]
        Left = 263
        Top = 4
        Width = 77
        Height = 13
        Caption = 'Vara Nº (JCJ)'
        FocusControl = dbedJCJ
      end
      object dbedJCJ: TDBEdit [5]
        Left = 263
        Top = 19
        Width = 120
        Height = 21
        DataField = 'JCJ'
        DataSource = ds
        TabOrder = 0
      end
      inherited dbedNumProcesso: TDBEdit
        TabOrder = 1
      end
      inherited dbedNumJCJ: TDBEdit
        TabOrder = 2
      end
      inherited dbedDataAju: TCMDateTimePicker
        TabOrder = 3
      end
      inherited dbedDataNot: TCMDateTimePicker
        TabOrder = 4
      end
      inherited rgSituacao: TDBRadioGroup
        TabOrder = 5
      end
      inherited gbxSitContraparte: TGroupBox
        TabOrder = 6
      end
      inherited gbxContraparte: TGroupBox
        Left = 388
        Width = 345
        TabOrder = 7
        inherited edNomeContraparte: TEdit
          Width = 302
        end
        inherited spbtnProcContraparte: TBitBtn
          Left = 312
        end
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      inherited pgctrlDetalhe: TPageControl
        ActivePage = tbshContraparte
        inherited tbshContraparte: TTabSheet
          object Label9: TLabel
            Left = 155
            Top = 22
            Width = 73
            Height = 13
            Caption = 'Último Cargo'
          end
          object Label10: TLabel
            Left = 155
            Top = 63
            Width = 79
            Height = 13
            Caption = 'Último Salário'
          end
          object Label11: TLabel
            Left = 155
            Top = 101
            Width = 54
            Height = 13
            Caption = 'Admissão'
          end
          object Label12: TLabel
            Left = 380
            Top = 104
            Width = 55
            Height = 13
            Caption = 'Demissão'
          end
          object Label23: TLabel
            Left = 155
            Top = 136
            Width = 119
            Height = 13
            Caption = 'Motivo Desligamento'
          end
          object Label32: TLabel
            Left = 155
            Top = 175
            Width = 48
            Height = 13
            Caption = 'Unidade'
          end
          object dbedCargo: TDBEdit
            Left = 276
            Top = 19
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
            TabOrder = 0
          end
          object dbedSalAtual: TDBEdit
            Left = 276
            Top = 61
            Width = 90
            Height = 21
            TabStop = False
            Color = clGray
            DataField = 'SALARIOATUAL'
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
          object dbrgTipoSalar: TDBRadioGroup
            Left = 374
            Top = 47
            Width = 161
            Height = 41
            Columns = 3
            DataField = 'TIPOPAGAMENTO'
            DataSource = dsPartic
            Items.Strings = (
              'Hora'
              'Dia'
              'Mês')
            ReadOnly = True
            TabOrder = 2
            Values.Strings = (
              'H'
              'D'
              'M')
          end
          object dbedAdm: TDBEdit
            Left = 276
            Top = 99
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
            TabOrder = 3
          end
          object dbedDem: TDBEdit
            Left = 444
            Top = 99
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
            TabOrder = 4
          end
          object dbedMotivo: TDBEdit
            Left = 276
            Top = 133
            Width = 259
            Height = 21
            TabStop = False
            Color = clGray
            DataField = 'DESCRICAO'
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
          object dbedEstab: TDBEdit
            Left = 276
            Top = 167
            Width = 259
            Height = 21
            TabStop = False
            Color = clGray
            DataField = 'ESTAB'
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
        end
      end
    end
  end
end
