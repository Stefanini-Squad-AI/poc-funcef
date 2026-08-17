inherited frmGeraArqSERPROS: TfrmGeraArqSERPROS
  Left = 178
  Top = 165
  Caption = 'Geração de Arquivos para SERPROS'
  ClientHeight = 295
  ClientWidth = 594
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 594
    Height = 256
    object memExplicacao: TMemo
      Left = 13
      Top = 11
      Width = 570
      Height = 235
      Color = clSilver
      Lines.Strings = (
        'Este programa irá gerar os arquivos solicitados pelo SERPROS.'
        ''
        'Diretório de Geração dos Arquivos : C:\'
        ''
        'Nome dos Arquivos :'
        ''
        '1. Arquivo de Salário de Participação = CM_ARQSALPART.TXT'
        '2. Arquivo de Participante no Plano = CM_PARTICIPANTE.TXT'
        '3. Arquivo de Contribuições = CM_CONTRIBUICOES.TXT'
        '4. Arquivo de Rubricas = CM_RUBRICAS.TXT'
        ''
        
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '-------------'
        'ATENÇÃO : LAY-OUT DO ARQUIVO 4.'
        ''
        
          'O LAY-OUT DO ARQUIVO 4 TEVE QUE SER ALTERADO PARA TAMANHOS 6 E 6' +
          '0, NO LUGAR'
        
          'DE 3 E 35, POIS EXISTEM DADOS CÓDIGOS COM MAIS DE 3 POSIÇÕES E D' +
          'ESCRIÇÕES COM'
        'MAIS DE 35.')
      ReadOnly = True
      TabOrder = 0
    end
  end
  inherited Dock971: TDock97
    Top = 256
    Width = 594
    inherited tb97Fundo: TToolbar97
      Left = 389
      DockPos = 389
    end
    inherited TB97oKCancelar: TToolbar97
      inherited ToolbarSep971: TToolbarSep97
        Left = 112
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 112
        Caption = '&Processar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 115
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65533
    Top = 241
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object qry: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 429
    Top = 81
  end
end
