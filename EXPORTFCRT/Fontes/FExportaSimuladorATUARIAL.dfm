inherited frmExportaSimuladorATUARIAL: TfrmExportaSimuladorATUARIAL
  Left = 227
  Top = 8
  Caption = 'Exportação de Dados para Avaliação Atuarial'
  ClientHeight = 459
  ClientWidth = 501
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 501
    Height = 420
    object PageControl1: TPageControl
      Left = 5
      Top = 5
      Width = 491
      Height = 410
      ActivePage = tbsExportacao
      Align = alClient
      TabOrder = 0
      TabPosition = tpBottom
      object tbsExportacao: TTabSheet
        Caption = 'Dados da Exportação'
        object lblProcessando: TLabel
          Left = 9
          Top = 364
          Width = 90
          Height = 13
          Caption = 'Processando ...'
        end
        object Button1: TButton
          Left = 459
          Top = 330
          Width = 7
          Height = 25
          Caption = 'Acerta RESERVAS'
          TabOrder = 0
          Visible = False
        end
        object GroupBox1: TGroupBox
          Left = 6
          Top = 0
          Width = 472
          Height = 184
          Caption = ' Indique os Arquivos a Serem Gerados '
          TabOrder = 1
          object Label1: TLabel
            Left = 12
            Top = 16
            Width = 188
            Height = 13
            Caption = 'Destino para o Arquivo de Ativos'
          end
          object sbtnAtivos: TSpeedButton
            Left = 435
            Top = 33
            Width = 23
            Height = 22
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
              5555555555555555555555555555555555555555555555555555555555555555
              555555555555555555555555555555555555555FFFFFFFFFF555550000000000
              55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
              B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
              000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
              555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
              55555575FFF75555555555700007555555555557777555555555555555555555
              5555555555555555555555555555555555555555555555555555}
            NumGlyphs = 2
            OnClick = sbtnAtivosClick
          end
          object Label2: TLabel
            Left = 12
            Top = 101
            Width = 209
            Height = 13
            Caption = 'Destino para o Arquivo de Assistidos'
          end
          object sbtnAssistidos: TSpeedButton
            Left = 435
            Top = 114
            Width = 23
            Height = 22
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
              5555555555555555555555555555555555555555555555555555555555555555
              555555555555555555555555555555555555555FFFFFFFFFF555550000000000
              55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
              B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
              000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
              555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
              55555575FFF75555555555700007555555555557777555555555555555555555
              5555555555555555555555555555555555555555555555555555}
            NumGlyphs = 2
            OnClick = sbtnAssistidosClick
          end
          object Label3: TLabel
            Left = 12
            Top = 140
            Width = 224
            Height = 13
            Caption = 'Destino para o Arquivo de Pensionistas'
          end
          object sbtnPensionistas: TSpeedButton
            Left = 435
            Top = 154
            Width = 23
            Height = 22
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
              5555555555555555555555555555555555555555555555555555555555555555
              555555555555555555555555555555555555555FFFFFFFFFF555550000000000
              55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
              B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
              000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
              555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
              55555575FFF75555555555700007555555555557777555555555555555555555
              5555555555555555555555555555555555555555555555555555}
            NumGlyphs = 2
            OnClick = sbtnPensionistasClick
          end
          object Label5: TLabel
            Left = 12
            Top = 59
            Width = 253
            Height = 13
            Caption = 'Destino para o Arquivo de AutoPatrocinados'
          end
          object sbtnMantidos: TSpeedButton
            Left = 435
            Top = 72
            Width = 23
            Height = 22
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
              5555555555555555555555555555555555555555555555555555555555555555
              555555555555555555555555555555555555555FFFFFFFFFF555550000000000
              55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
              B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
              000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
              555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
              55555575FFF75555555555700007555555555557777555555555555555555555
              5555555555555555555555555555555555555555555555555555}
            NumGlyphs = 2
            OnClick = sbtnMantidosClick
          end
          object edArqATIVOS: TEdit
            Left = 12
            Top = 34
            Width = 421
            Height = 21
            TabOrder = 0
            Text = 'C:\FCRT_ATIVOS.TXT'
          end
          object edArqASSISTIDOS: TEdit
            Left = 12
            Top = 115
            Width = 421
            Height = 21
            TabOrder = 2
            Text = 'C:\FCRT_ASSISTIDOS.TXT'
          end
          object edArqPENSIONISTAS: TEdit
            Left = 12
            Top = 155
            Width = 421
            Height = 21
            TabOrder = 3
            Text = 'C:\FCRT_PENSIONISTAS.TXT'
          end
          object edArqMantidos: TEdit
            Left = 12
            Top = 73
            Width = 421
            Height = 21
            TabOrder = 1
            Text = 'C:\FCRT_AUTOPAT.TXT'
          end
        end
        object GroupBox2: TGroupBox
          Left = 6
          Top = 283
          Width = 472
          Height = 74
          Caption = ' Selecione os Parâmetros para a Geração'
          TabOrder = 2
          object Label4: TLabel
            Left = 12
            Top = 14
            Width = 112
            Height = 13
            Caption = 'Data de Referência'
          end
          object dtDataREF: TCMDateTimePicker
            Left = 12
            Top = 27
            Width = 121
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
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
            TabOrder = 0
          end
          object chkAutoPat: TCheckBox
            Left = 12
            Top = 53
            Width = 220
            Height = 17
            Caption = 'Só Autopatrocinados - SETEMBRO'
            TabOrder = 1
            Visible = False
          end
          object rgrpParticip: TRadioGroup
            Left = 258
            Top = 10
            Width = 185
            Height = 52
            Caption = ' Participantes '
            ItemIndex = 0
            Items.Strings = (
              'Todos'
              'Selecionar Alguns')
            TabOrder = 2
            OnClick = rgrpParticipClick
          end
        end
        object GroupBox3: TGroupBox
          Left = 6
          Top = 186
          Width = 472
          Height = 94
          Caption = 
            ' Indique os Arquivos Auxiliares ( para Ativos e AutoPatrocinados' +
            ' )'
          Color = clSilver
          ParentColor = False
          TabOrder = 3
          object Label11: TLabel
            Left = 12
            Top = 16
            Width = 146
            Height = 13
            Caption = 'Arquivo Auxiliar de Ativos'
          end
          object sbtnAtivosAUX: TSpeedButton
            Left = 435
            Top = 29
            Width = 23
            Height = 22
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
              5555555555555555555555555555555555555555555555555555555555555555
              555555555555555555555555555555555555555FFFFFFFFFF555550000000000
              55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
              B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
              000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
              555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
              55555575FFF75555555555700007555555555557777555555555555555555555
              5555555555555555555555555555555555555555555555555555}
            NumGlyphs = 2
            OnClick = sbtnAtivosAUXClick
          end
          object Label14: TLabel
            Left = 12
            Top = 52
            Width = 210
            Height = 13
            Caption = 'Arquivo Auxiliar de Autopatrocinados'
          end
          object sbtnAutoPatAUX: TSpeedButton
            Left = 435
            Top = 65
            Width = 23
            Height = 22
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
              5555555555555555555555555555555555555555555555555555555555555555
              555555555555555555555555555555555555555FFFFFFFFFF555550000000000
              55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
              B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
              000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
              555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
              55555575FFF75555555555700007555555555557777555555555555555555555
              5555555555555555555555555555555555555555555555555555}
            NumGlyphs = 2
            OnClick = sbtnAutoPatAUXClick
          end
          object edAuxAtivos: TEdit
            Left = 12
            Top = 30
            Width = 421
            Height = 21
            TabOrder = 0
            Text = 'C:\FCRT_ATIVOSAUX.TXT'
          end
          object edAuxAutopat: TEdit
            Left = 12
            Top = 66
            Width = 421
            Height = 21
            TabOrder = 1
            Text = 'C:\FCRT_AUTOPATAUX.TXT'
          end
        end
      end
      object tbsSelParticip: TTabSheet
        Caption = 'Selecionar Participantes'
        ImageIndex = 2
        object Label6: TLabel
          Left = 15
          Top = 3
          Width = 228
          Height = 13
          Caption = 'Digite Abaixo as Matrículas Desejadas :'
        end
        object Label7: TLabel
          Left = 243
          Top = 21
          Width = 87
          Height = 13
          Caption = 'Observações : '
        end
        object Label8: TLabel
          Left = 243
          Top = 41
          Width = 220
          Height = 13
          Caption = '1.) Digite uma matrícula em cada linha'
        end
        object Label9: TLabel
          Left = 243
          Top = 61
          Width = 283
          Height = 13
          Caption = '2.) A matrícula não deve conter zeros a esquerda'
        end
        object Label10: TLabel
          Left = 243
          Top = 81
          Width = 225
          Height = 13
          Caption = '3.) A matrícula deve conter -00 no final'
        end
        object memMatriculas: TMemo
          Left = 15
          Top = 18
          Width = 223
          Height = 328
          TabOrder = 0
        end
      end
      object tbsLogErros: TTabSheet
        Caption = 'Log de Erros'
        ImageIndex = 1
        object memErros: TMemo
          Left = 0
          Top = 0
          Width = 464
          Height = 358
          Align = alClient
          TabOrder = 0
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 420
    Width = 501
    inherited tb97Fundo: TToolbar97
      Left = 253
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 162
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 82
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 164
      end
      object bbtnExportar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Exportar'
        Default = True
        TabOrder = 2
        OnClick = bbtnExportarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
          333333333333337FF3333333333333903333333333333377FF33333333333399
          03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
          99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
          99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
          03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
          33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
          33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
          3333777777333333333333333333333333333333333333333333}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 4
    Top = 404
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object SaveDlg: TSaveDialog
    DefaultExt = '.txt'
    Title = 'Arquivo para Exportação'
    Left = 501
    Top = 252
  end
  object qry: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 510
    Top = 309
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 495
    Top = 162
  end
  object regraAPrev: TRegra
    QueryIn = qryRegra
    DatabaseName = 'BaseDados'
    IdCalculo = 0
    IdEmpresa = -1
    Left = 483
    Top = 48
  end
  object qryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 513
    Top = 357
  end
  object qryDadosTemp: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 495
    Top = 111
  end
  object qrySimulador: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 495
    Top = 195
  end
  object qryAtivosAUX: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT EL.MATRICULA, 0 AS TEMPOINSS, 0 AS SALPARTICIPACAO, 0 AS ' +
        'RPTRIBUTAVEL,'
      
        '       0 AS RPNAOTRIBUTAVEL, 0 AS SRB, 0 AS CONTRIBUICAO, 0 AS J' +
        'OIA,'
      '       0 AS REMUNERACAO '
      'FROM   ELEGPATRO EL'
      'WHERE  EL.IDPESSOA = -1'
      ' '
      ' '
      ' ')
    UpdateObject = updAtivosAUX
    ValidateWithMask = True
    Left = 375
    Top = 378
  end
  object qryAutoPatAUX: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT EL.MATRICULA, 0 AS TEMPOINSS, 0 AS SALPARTICIPACAO, 0 AS ' +
        'RPTRIBUTAVEL,'
      
        '       0 AS RPNAOTRIBUTAVEL, 0 AS SRB, 0 AS CONTRIBUICAO, 0 AS J' +
        'OIA , 0 AS REMUNERACAO '
      'FROM   ELEGPATRO EL'
      'WHERE  EL.IDPESSOA = -1'
      ' '
      ' ')
    UpdateObject = updAutoPatAUX
    ValidateWithMask = True
    Left = 336
    Top = 375
  end
  object updAtivosAUX: TUpdateSQL
    ModifySQL.Strings = (
      'update ELEGPATRO'
      'set'
      '  MATRICULA = :MATRICULA'
      'where'
      '  MATRICULA = :OLD_MATRICULA')
    InsertSQL.Strings = (
      'insert into ELEGPATRO'
      '  (MATRICULA)'
      'values'
      '  (:MATRICULA)')
    DeleteSQL.Strings = (
      'delete from ELEGPATRO'
      'where'
      '  MATRICULA = :OLD_MATRICULA')
    Left = 444
    Top = 377
  end
  object updAutoPatAUX: TUpdateSQL
    ModifySQL.Strings = (
      'update ELEGPATRO'
      'set'
      '  MATRICULA = :MATRICULA'
      'where'
      '  MATRICULA = :OLD_MATRICULA')
    InsertSQL.Strings = (
      'insert into ELEGPATRO'
      '  (MATRICULA)'
      'values'
      '  (:MATRICULA)')
    DeleteSQL.Strings = (
      'delete from ELEGPATRO'
      'where'
      '  MATRICULA = :OLD_MATRICULA')
    Left = 462
    Top = 363
  end
end
