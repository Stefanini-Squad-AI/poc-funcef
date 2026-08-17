object wmdlAutoAtendimento: TwmdlAutoAtendimento
  OldCreateOrder = False
  OnCreate = WebModuleCreate
  OnDestroy = WebModuleDestroy
  Actions = <
    item
      Name = 'Conecta'
      PathInfo = '/Conecta'
      OnAction = wmdlAutoAtendimentoConectaAction
    end
    item
      Name = 'Sobre'
      PathInfo = '/Sobre'
      OnAction = wmdlAutoAtendimentoSobreAction
    end
    item
      Name = 'Elegivel'
      PathInfo = '/Elegivel'
      OnAction = wmdlAutoAtendimentoElegivelAction
    end
    item
      Name = 'Simulacao'
      PathInfo = '/Simulacao'
      OnAction = wmdlAutoAtendimentoSimulacaoAction
    end
    item
      Name = 'Concessao'
      PathInfo = '/Concessao'
      OnAction = wmdlAutoAtendimentoConcessaoAction
    end
    item
      Name = 'AssinaContrato'
      PathInfo = '/AssinaContrato'
      OnAction = wmdlAutoAtendimentoAssinaContratoAction
    end
    item
      Name = 'Validacao'
      PathInfo = '/Validacao'
      OnAction = wmdlAutoAtendimentoValidacaoAction
    end
    item
      Name = 'RemoveAssinatura'
      PathInfo = '/RemoveAssinatura'
      OnAction = wmdlAutoAtendimentoRemoveAssinaturaAction
    end>
  Left = 353
  Top = 180
  Height = 513
  Width = 576
  object pgpResposta: TPageProducer
    OnHTMLTag = pgpRespostaHTMLTag
    Left = 24
    Top = 16
  end
end
