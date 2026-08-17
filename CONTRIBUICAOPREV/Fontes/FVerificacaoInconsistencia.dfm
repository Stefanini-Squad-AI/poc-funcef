inherited frmVerificacaoInconsistencia: TfrmVerificacaoInconsistencia
  Left = 20
  Top = 51
  Caption = 'Verificação de Inconsistências'
  ClientHeight = 338
  ClientWidth = 694
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 694
    Height = 299
    object v: TPanel
      Left = 5
      Top = 5
      Width = 684
      Height = 289
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 0
      object Label1: TLabel
        Left = 400
        Top = 225
        Width = 117
        Height = 13
        Caption = '< nome do arquivo >'
      end
      object Label4: TLabel
        Left = 347
        Top = 266
        Width = 145
        Height = 13
        Caption = 'Aguarde Processando ....'
        Visible = False
      end
      object Label5: TLabel
        Left = 344
        Top = 225
        Width = 52
        Height = 13
        Caption = 'Arquivo :'
      end
      object lblcontador: TLabel
        Left = 512
        Top = 266
        Width = 129
        Height = 13
        Caption = '0 registro processados'
      end
      object Animate1: TAnimate
        Left = 345
        Top = 241
        Width = 313
        Height = 18
        Active = False
        AutoSize = False
        CommonAVI = aviCopyFiles
        StopFrame = 34
        Visible = False
      end
      object memResult: TMemo
        Left = -8
        Top = 500
        Width = 113
        Height = 33
        Lines.Strings = (
          '')
        TabOrder = 0
        Visible = False
      end
      object GroupBox1: TGroupBox
        Left = 5
        Top = 6
        Width = 327
        Height = 171
        Caption = 'Banco de Dados REFER'
        TabOrder = 2
        object Label6: TLabel
          Left = 17
          Top = 25
          Width = 216
          Height = 13
          Caption = '&Contribuição X Situação na Fundação'
        end
        object Bevel1: TBevel
          Left = 16
          Top = 47
          Width = 269
          Height = 17
          Shape = bsTopLine
        end
        object Label3: TLabel
          Left = 17
          Top = 63
          Width = 138
          Height = 13
          Caption = '&Contribuição X Histórico'
        end
        object c: TBevel
          Left = 16
          Top = 81
          Width = 269
          Height = 17
          Shape = bsTopLine
        end
        object Label2: TLabel
          Left = 17
          Top = 99
          Width = 88
          Height = 13
          Caption = '&Histórico X DIB'
        end
        object Bevel2: TBevel
          Left = 16
          Top = 119
          Width = 269
          Height = 13
          Shape = bsTopLine
        end
        object TBitBtn
          Left = 257
          Top = 17
          Width = 28
          Height = 24
          Hint = 'Executar'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = bbtnContXSitFundClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
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
        object bbtnHistXDIB: TBitBtn
          Left = 258
          Top = 90
          Width = 28
          Height = 24
          Hint = 'Executar'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = bbtnHistXDIBClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
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
        object bbtnContXHist: TBitBtn
          Left = 257
          Top = 54
          Width = 28
          Height = 24
          Hint = 'Executar'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = bbtnContXHistClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
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
      object GroupBox3: TGroupBox
        Left = 339
        Top = 6
        Width = 327
        Height = 210
        Caption = 'Outros'
        TabOrder = 3
        object Label7: TLabel
          Left = 17
          Top = 25
          Width = 259
          Height = 13
          Caption = 'Participantes com mais de um benefício ativo'
        end
        object Bevel3: TBevel
          Left = 16
          Top = 47
          Width = 300
          Height = 17
          Shape = bsTopLine
        end
        object Label8: TLabel
          Left = 17
          Top = 60
          Width = 259
          Height = 13
          Caption = 'Participantes com mais de um benefício ativo'
        end
        object Bevel6: TBevel
          Left = 16
          Top = 79
          Width = 300
          Height = 17
          Shape = bsTopLine
        end
        object Label11: TLabel
          Left = 17
          Top = 92
          Width = 254
          Height = 13
          Caption = 'Participantes sem Abono e com Contribuição'
        end
        object Bevel7: TBevel
          Left = 16
          Top = 111
          Width = 300
          Height = 17
          Shape = bsTopLine
        end
        object Label12: TLabel
          Left = 17
          Top = 124
          Width = 254
          Height = 13
          Caption = 'Participantes com Abono e sem Contribuição'
        end
        object Bevel8: TBevel
          Left = 16
          Top = 142
          Width = 300
          Height = 17
          Shape = bsTopLine
        end
        object Label13: TLabel
          Left = 17
          Top = 155
          Width = 211
          Height = 13
          Caption = 'Acerto de Data Final de Contribuição'
        end
        object Label14: TLabel
          Left = 17
          Top = 187
          Width = 199
          Height = 13
          Caption = 'Acerto de Saldo Inicial de Reserva'
        end
        object Bevel9: TBevel
          Left = 16
          Top = 174
          Width = 300
          Height = 17
          Shape = bsTopLine
        end
        object bbtnInconsist06: TBitBtn
          Left = 287
          Top = 17
          Width = 28
          Height = 24
          Hint = 'Executar'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = bbtnInconsist06Click
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
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
        object bbtnAcertar: TBitBtn
          Left = 287
          Top = 52
          Width = 28
          Height = 24
          Hint = 'Acertar situação de participantes com mais de um beneficio ativo'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = bbtnAcertarClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            555555555555555555555555555555555555555555FF55555555555559055555
            55555555577FF5555555555599905555555555557777F5555555555599905555
            555555557777FF5555555559999905555555555777777F555555559999990555
            5555557777777FF5555557990599905555555777757777F55555790555599055
            55557775555777FF5555555555599905555555555557777F5555555555559905
            555555555555777FF5555555555559905555555555555777FF55555555555579
            05555555555555777FF5555555555557905555555555555777FF555555555555
            5990555555555555577755555555555555555555555555555555}
          NumGlyphs = 2
        end
        object bbtnAcertaContribAssistido: TBitBtn
          Left = 287
          Top = 84
          Width = 28
          Height = 24
          Hint = 'Acertar contribuição de participante com abono'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = bbtnAcertaContribAssistidoClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            555555555555555555555555555555555555555555FF55555555555559055555
            55555555577FF5555555555599905555555555557777F5555555555599905555
            555555557777FF5555555559999905555555555777777F555555559999990555
            5555557777777FF5555557990599905555555777757777F55555790555599055
            55557775555777FF5555555555599905555555555557777F5555555555559905
            555555555555777FF5555555555559905555555555555777FF55555555555579
            05555555555555777FF5555555555557905555555555555777FF555555555555
            5990555555555555577755555555555555555555555555555555}
          NumGlyphs = 2
        end
        object bbtnAcertaContribAssistido2: TBitBtn
          Left = 287
          Top = 116
          Width = 28
          Height = 24
          Hint = 'Acertar contribuição de participante com abono'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = bbtnAcertaContribAssistido2Click
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            555555555555555555555555555555555555555555FF55555555555559055555
            55555555577FF5555555555599905555555555557777F5555555555599905555
            555555557777FF5555555559999905555555555777777F555555559999990555
            5555557777777FF5555557990599905555555777757777F55555790555599055
            55557775555777FF5555555555599905555555555557777F5555555555559905
            555555555555777FF5555555555559905555555555555777FF55555555555579
            05555555555555777FF5555555555557905555555555555777FF555555555555
            5990555555555555577755555555555555555555555555555555}
          NumGlyphs = 2
        end
        object bbtnRenovados: TBitBtn
          Left = 287
          Top = 147
          Width = 28
          Height = 24
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          OnClick = bbtnRenovadosClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            555555555555555555555555555555555555555555FF55555555555559055555
            55555555577FF5555555555599905555555555557777F5555555555599905555
            555555557777FF5555555559999905555555555777777F555555559999990555
            5555557777777FF5555557990599905555555777757777F55555790555599055
            55557775555777FF5555555555599905555555555557777F5555555555559905
            555555555555777FF5555555555559905555555555555777FF55555555555579
            05555555555555777FF5555555555557905555555555555777FF555555555555
            5990555555555555577755555555555555555555555555555555}
          NumGlyphs = 2
        end
        object bbtnAcertaSaldoIniReserva: TBitBtn
          Left = 287
          Top = 179
          Width = 28
          Height = 24
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          OnClick = bbtnAcertaSaldoIniReservaClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            555555555555555555555555555555555555555555FF55555555555559055555
            55555555577FF5555555555599905555555555557777F5555555555599905555
            555555557777FF5555555559999905555555555777777F555555559999990555
            5555557777777FF5555557990599905555555777757777F55555790555599055
            55557775555777FF5555555555599905555555555557777F5555555555559905
            555555555555777FF5555555555559905555555555555777FF55555555555579
            05555555555555777FF5555555555557905555555555555777FF555555555555
            5990555555555555577755555555555555555555555555555555}
          NumGlyphs = 2
        end
      end
      object GroupBox2: TGroupBox
        Left = 5
        Top = 192
        Width = 327
        Height = 90
        Caption = 'Situação do Participante'
        TabOrder = 4
        object Label9: TLabel
          Left = 16
          Top = 24
          Width = 196
          Height = 13
          Caption = 'Verificar Situacao  do Participante'
        end
        object Bevel4: TBevel
          Left = 16
          Top = 40
          Width = 269
          Height = 17
          Shape = bsTopLine
        end
        object Label10: TLabel
          Left = 17
          Top = 59
          Width = 190
          Height = 13
          Caption = 'Acertar Situacao  do Participante'
        end
        object Bevel5: TBevel
          Left = 16
          Top = 76
          Width = 269
          Height = 17
          Shape = bsTopLine
        end
        object bbtnTipoBenef: TBitBtn
          Left = 256
          Top = 13
          Width = 28
          Height = 24
          TabOrder = 0
          OnClick = bbtnTipoBenefClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
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
        object BitBtn1: TBitBtn
          Left = 256
          Top = 48
          Width = 28
          Height = 24
          TabOrder = 1
          OnClick = BitBtn1Click
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            555555555555555555555555555555555555555555FF55555555555559055555
            55555555577FF5555555555599905555555555557777F5555555555599905555
            555555557777FF5555555559999905555555555777777F555555559999990555
            5555557777777FF5555557990599905555555777757777F55555790555599055
            55557775555777FF5555555555599905555555555557777F5555555555559905
            555555555555777FF5555555555559905555555555555777FF55555555555579
            05555555555555777FF5555555555557905555555555555777FF555555555555
            5990555555555555577755555555555555555555555555555555}
          NumGlyphs = 2
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 299
    Width = 694
    inherited tb97Fundo: TToolbar97
      Left = 197
      DockPos = 197
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 363
  end
  object qryContXSitFund: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 55
    Top = 363
  end
  object qryContXHist: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 92
    Top = 363
  end
  object qryHistXDIB: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 127
    Top = 363
  end
  object qry: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 89
    Top = 301
  end
  object qryEXEC: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 154
    Top = 301
  end
  object qryVerifTipoBenef: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 18
    Top = 301
  end
  object qryAcertoTipoBenef: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 602
    Top = 317
  end
  object qryVerifica: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 298
    Top = 11
  end
end
