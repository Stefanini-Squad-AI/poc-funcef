inherited frmImportaOrdens: TfrmImportaOrdens
  Left = 288
  Top = 195
  HelpContext = 790273
  Caption = 'frmImportaOrdens'
  ClientHeight = 393
  ClientWidth = 735
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 735
    Height = 354
    inherited bvlSepTit: TBevel
      Width = 733
    end
    inherited pnlTitulo: TPanel
      Width = 733
      inherited lbNomDescricao: TfcLabel
        Width = 342
        Caption = 'Importa Ordens de Movimentação'
      end
    end
    object pnlDados: TPanel
      Left = 1
      Top = 45
      Width = 733
      Height = 308
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object Label1: TLabel
        Left = 13
        Top = 11
        Width = 195
        Height = 13
        Caption = 'Indique o caminho para o arquivo '
      end
      object SB1: TSpeedButton
        Left = 690
        Top = 27
        Width = 22
        Height = 22
        Hint = 'Buscar Arquivo '
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
        ParentShowHint = False
        ShowHint = True
        OnClick = SB1Click
      end
      object Label2: TLabel
        Left = 160
        Top = 56
        Width = 406
        Height = 13
        Caption = 
          'Clique com o lado direito do Mouse na grade para ver a lista de ' +
          'opções'
      end
      object Label3: TLabel
        Left = 344
        Top = 288
        Width = 131
        Height = 13
        Caption = 'Agrupamento marcado:'
      end
      object edtArquivo: TEdit
        Left = 13
        Top = 27
        Width = 676
        Height = 21
        TabOrder = 0
      end
      object DBGrid1: TDBGrid
        Left = 14
        Top = 72
        Width = 699
        Height = 209
        DataSource = DsOrdem
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentShowHint = False
        PopupMenu = PopupMenu1
        ShowHint = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
      end
      object StaticText1: TStaticText
        Left = 480
        Top = 287
        Width = 241
        Height = 17
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = '.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
    end
  end
  inherited Dock971: TDock97
    Top = 354
    Width = 735
    inherited tb97Fundo: TToolbar97
      Left = 487
      DockPos = 487
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 318
      DockPos = 318
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
    inline fraMens: TfraMensagem
      Width = 296
      Height = 37
      TabOrder = 2
      inherited pnlProgresso: TPanel
        Width = 296
        Height = 37
        inherited pnlProgressoMensagem: TPanel
          Width = 162
          Height = 35
          inherited lblProgressoMensagem: TfcLabel
            Width = 160
            Height = 33
          end
        end
        inherited pnlProgressoBarra: TPanel
          Left = 163
          Width = 132
          Height = 35
          inherited pgbProcesso: TProgressBar
            Width = 130
            Height = 33
          end
        end
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 363
    Top = 3
    TargetsData = (
      1
      2
      (
        ''
        'DisplayLabel'
        0)
      (
        ''
        'Filter'
        0))
  end
  object OpenDialog1: TOpenDialog
    FileName = 'COTMECA.XLS'
    Filter = 'texto|*.txt'
    InitialDir = 'C:\'
    Title = 'Busca Arquivo de Importação '
    Left = 421
    Top = 48
  end
  object DsOrdem: TDataSource
    DataSet = QryOrdem
    Left = 121
    Top = 229
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 263
    Top = 159
    object ExcluirImportao1: TMenuItem
      Caption = 'Excluir Importação'
      OnClick = ExcluirImportao1Click
    end
  end
  object QryOrdem: TQuery
    AutoCalcFields = False
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select'
      
        'Idimportacao "Codigo Importação" ,DataOrdMovInv "Data Operação",' +
        'count(staconfirma) "Conferência",count(Staautoriza) "Autoriza", '
      
        '(select count(1) from ordmovinv where idimportacao = ord.idimpor' +
        'tacao and STATMOVINV ='#39'L'#39')'
      '"Calcula Despesa" ,count(1)as "Total Ordens Importadas" '
      'from ordmovinv ord'
      'where tipoinclusao = '#39'I'#39
      'group by Idimportacao,DataOrdMovInv'
      'order by DataOrdMovInv desc'
      ' ')
    Left = 133
    Top = 149
    object QryOrdemCodigoImportao: TFloatField
      FieldName = 'Codigo Importação'
    end
    object QryOrdemDataOperao: TDateTimeField
      FieldName = 'Data Operação'
    end
    object QryOrdemConferncia: TFloatField
      FieldName = 'Conferência'
    end
    object QryOrdemAutoriza: TFloatField
      FieldName = 'Autoriza'
    end
    object QryOrdemCalculaDespesa: TFloatField
      FieldName = 'Calcula Despesa'
    end
    object QryOrdemTotalOrdensImportadas: TFloatField
      FieldName = 'Total Ordens Importadas'
    end
  end
end
