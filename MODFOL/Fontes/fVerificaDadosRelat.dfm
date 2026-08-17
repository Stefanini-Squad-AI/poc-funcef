inherited frmVerificaDadosRelat: TfrmVerificaDadosRelat
  Left = 284
  Top = 118
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Verificação de Dados dos Relatórios e Meios Magnéticos '
  ClientHeight = 377
  ClientWidth = 440
  Font.Style = []
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 440
    Height = 338
    BorderWidth = 2
    object fcLabel1: TfcLabel
      Left = 5
      Top = 6
      Width = 428
      Height = 24
      AutoSize = False
      Caption = 'Selecione o Relatório / Meio Magnético a Verificar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      TextOptions.Alignment = taCenter
      TextOptions.Shadow.Enabled = True
      TextOptions.Shadow.XOffset = 2
      TextOptions.Shadow.YOffset = 2
      TextOptions.VAlignment = vaTop
    end
    object Bevel1: TBevel
      Left = 4
      Top = 30
      Width = 432
      Height = 3
    end
    object pgctrlRelatorios: TPageControl
      Left = 5
      Top = 35
      Width = 430
      Height = 298
      ActivePage = tbshRelats
      TabOrder = 0
      object tbshRelats: TTabSheet
        Caption = 'Relatórios'
        object lstbxRelatorios: TColorListBox
          Left = 3
          Top = 2
          Width = 413
          Height = 264
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 16
          Items.Strings = (
            'Etiquetas'
            'Ficha Funcional'
            'Adiantamento Salarial'
            'Aviso de Férias'
            'Férias Programadas'
            'Ficha Financeira por Funcionário'
            'Folha de Empregados por Rubrica'
            'Folha de Frquência - I'
            'Folha de Frquência - II'
            'Folha de Frquência (Horário Escala)'
            'Folha de Pagamento Normal'
            'GPS - Guia da Previdência Social'
            'GRCS- Guia de Recolhimento da Contribuição Sindical'
            'GRFP'
            'Lançamento de Rubricas Individuais'
            'Recibo / Aviso de Férias'
            'Recibo de Pagamento'
            'Recibo de Pagamento a Terceiros'
            'Relação de Empregados Alfabética Mensal'
            'Relação de Transportes (Em Colunas)'
            'Relação de Transportes (Em Linha)'
            'Relação do Borderô Bancário'
            'Relatório de Acompanhamento de Escala de Férias'
            'Relatório de Composição de Saldo'
            'Relatório de Escala de Férias'
            'Relatório de Previsão de Férias'
            'Relatório de Provisão de Férias'
            'Relatório de Provisão de 13º Salário'
            'Relatório Gerencial'
            'Resumo de Folha Comparativo'
            'Resumo de Folha de Pagamento'
            'Termo de Rescisão Contratual')
          ParentFont = False
          TabOrder = 0
          OnDblClick = lstbxRelatoriosDblClick
          LinesType = [ltBeetwenCols]
          OnColorItems = lstbxRelatoriosColorItems
        end
      end
      object tbshMeiosMag: TTabSheet
        Caption = 'Meios Magnéticos'
        object lstbxMeiosMag: TColorListBox
          Left = 3
          Top = 2
          Width = 413
          Height = 264
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 16
          Items.Strings = (
            'GFIP'
            'Vale Transporte'
            'CAGED'
            'RAIS'
            'Arquivo de Pagamento')
          ParentFont = False
          TabOrder = 0
          OnDblClick = lstbxMeiosMagDblClick
          LinesType = [ltBeetwenCols]
          OnColorItems = lstbxRelatoriosColorItems
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 338
    Width = 440
    inherited tb97Fundo: TToolbar97
      Left = 270
      DockPos = 436
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 103
      DockPos = 268
      Visible = False
      inherited bbtnConfirmar: TBitBtn
        Enabled = False
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 223
    Top = 308
  end
end
