{-------------------------------------------------------------------------------
------------------------ HISTÓRICO DE ALTERAÇÕES -------------------------------
--------------------------------------------------------------------------------
WO        : 23149
Analista  : Leandro Pocebon
Descrição : Alteração no parametros de processamento
--------------------------------------------------------------------------------}
program ExecutaRegra;

{%File '..\..\Cm\Regra\Package\CMRegra50.dpk'}

uses
  Forms,
  uAutorizacao,
  fCMEntrada,
  FPai in '..\..\Cm\Forms\Source\FPai.pas' {frmPai},
  FTelaAut in '..\..\Cm\Forms\Source\FTelaAut.pas' {frmTelaAutorizacao},
  fAguarde in '..\..\Cm\Forms\Source\fAguarde.pas' {frmAguarde},
  FCadastroPai in '..\..\CM\Forms\Source\FCadastroPai.pas' {FrmCadastroPai},
  FSairAjuda in '..\..\Cm\Forms\Source\FSairAjuda.pas' {frmSairAjuda},
  FOkCancelar in '..\..\Cm\Forms\Source\FOkCancelar.pas' {frmOkCancelar},
  FCadastroCS in '..\..\Cm\Forms\Source\FCadastroCS.pas' {frmCadastroCS},
  FCadMestreDetCS in '..\..\Cm\Forms\Source\FCadMestreDetCS.pas' {frmCadMestreDetalheCS},
  dReports in '..\..\Cm\Forms\Source\dReports.pas' {dtmReports: TDataModule},
  FCadastroGridCS in '..\..\Cm\Forms\Source\FCadastroGridCS.pas' {FrmCadastroGridCS},
  FCadastro in '..\..\Cm\Forms\Source\FCadastro.pas' {frmCadastro},
  FCadMulti in '..\..\Cm\Forms\Source\FCadMulti.pas' {frmCadastroMulti},
  FCadMestreDet in '..\..\Cm\Forms\Source\FCadMestreDet.pas' {frmCadMestreDetalhe},
  FCadastroMestreDetMT in '..\..\Cm\Forms\Source\FCadastroMestreDetMT.pas',
  FCadastroMT in '..\..\Cm\Forms\Source\FCadastroMT.pas' {FrmCadastroMT},
  FCadastroGridMT in '..\..\Cm\Forms\Source\FCadastroGridMT.pas' {FrmCadastroGridMT},
  FCMPrincipalForms in '..\..\Cm\Forms\Source\FCMPrincipalForms.pas' {frmCMPrincipalForms},
  FCMPrincipal in '..\..\Cm\Forms\CMPrincipal\FCMPrincipal.pas' {frmCMPrincipal},
  fPrincipal in 'fPrincipal.pas' {frmPrincipal},
  fExecutaRegra in 'fExecutaRegra.pas' {frmExecutaRegra},
  uExecutaRegra in 'uExecutaRegra.pas' {dtmExecutaRegra: TDataModule},
  FInputVar in '..\..\CM\Regra\Source\finputvar.pas' {frmInputVar},
  FMostraPassos in '..\..\Cm\Regra\Source\FMostraPassos.pas' {FrmMostraPassos},
  Fpassoapasso in '..\..\CM\Regra\Source\fpassoapasso.pas' {FrmPassoAPasso},
  Fpegatab in '..\..\CM\Regra\Source\fpegatab.pas' {frmpegatab};

{$R *.RES}
{$R EXECUTAREGRA_RES.RES}

VAR
 iProcesso, sUser, sPass, iSeqIni, iSeqFim, sDebug, sEscopo, sPathArq, sNomeArq, sDisplay : string;
 bErroProc : integer;
begin
  frmCMEntrada := TfrmCMEntrada.Create(Application);
  //frmCMEntrada.Show;
  frmCMEntrada.Update;

  Application.Initialize;
  Application.Title := 'Executa Regras de Negócio';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  Application.CreateForm(TdtmExecutaRegra, dtmExecutaRegra);
  Application.CreateForm(TfrmExecutaRegra, frmExecutaRegra);

  //WO23149 - Lezndo - Inicio
  //iProcesso := ParamStr(1);
  //sUser     := ParamStr(2);
  //sPass     := ParamStr(3);
  //iSeqIni   := ParamStr(4);
  //iSeqFim   := ParamStr(5);
  //sDebug    := ParamStr(6);
  {regra dos parametros

   Parâmetro	            Descrição	                                                          Regra	                                                                Obrigatório
   -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
   Executável	            executaregra.exe	                                                  Case insensitive 	                                                     X
   Usuário	            Usuário de acesso ao Planus	                                          Case insensitive
                                                                                                  Transformar tudo pra maiúsculo quando for mandar pro módulo executar	     X
   Senha	            Senha do usuário informado	                                          Case sensitive	                                                     X
   ID execução	            ID da execução - cm.lista_regra_execucao.id_execucao	          Numérico
   Escopo da execução	    T - Todos (todos os registros referente ao ID execução)               Default T
                            A - Abertos (apenas o registros que ainda não foram processados,      A - cm.lista_regra_execucao.data_execucao is null
                            referente ao ID execução)
   Caminho arquivo texto    caminho para gravação de arquivo texto. Indicativo de finalização     Gerado ao final do processamento
                            do processamento
                                                                                                  Se não preenchido, não gravar arquivo
   Nome do arquivo texto    Nome do arquivo texto	                                          Nome do arquivo gerado ao final do processamento
                                                                                                  Se não preenchido, não gravar arquivo, mesmo tendo preenchido o caminho
   ID Seq inicial	    ID Seq da execução - cm.lista_regra_execucao.id_seq (range inicial)
   ID Seq final	            ID Seq da execução - cm.lista_regra_execucao.id_seq (range final)
   Debug - Log	            S - Sim, gera log
                            N - Não, não gera log	                                          Default S
   Debug - Exibe tela	    S - Sim, exibe tela
                            N - Não, não exibe tela	                                          Default N
  }



  sUser     := ParamStr(1);
  sPass     := ParamStr(2);
  iProcesso := ParamStr(3);
  sEscopo   := ParamStr(4);
  sPathArq  := ParamStr(5);
  sNomeArq  := ParamStr(6);
  iSeqIni   := ParamStr(7);
  iSeqFim   := ParamStr(8);
  sDebug    := ParamStr(9);
  sDisplay  := ParamStr(10);
  //WO23149 - Leandro - Inicio


  if not Autorizacao.LoginAutomatico(sUser, sPass, iProcesso, iSeqIni, iSeqFim) then
  begin
    Application.Terminate;
  end
  else
  begin
    if iProcesso <> '#' then
      frmExecutaRegra.idProcesso := iProcesso
    else
      frmExecutaRegra.idProcesso := iProcesso;

    frmExecutaRegra.idSeqIni   := iSeqIni;
    frmExecutaRegra.idSeqFim   := iSeqFim;

    //WO23149 - Lezndo - Inicio
    {if sDebug = 'S' then
    begin
      frmExecutaRegra.Debug      := True;
      frmExecutaRegra.Display    := False;
    end
    else
      if sDebug = 'D' then
      begin
        frmExecutaRegra.Debug      := True;
        frmExecutaRegra.Display    := True;
      end
      else
      begin
        frmExecutaRegra.Debug      := False;
        frmExecutaRegra.Display    := False;
      end;
    }
    if sDebug = 'N' then
      frmExecutaRegra.Debug      := False
    else
      frmExecutaRegra.Debug      := True;

    if sDisplay = 'S' then
      frmExecutaRegra.Display    := True
    else
      frmExecutaRegra.Display    := False;

    if sPathArq <> '#' then
     frmExecutaRegra.PathArq  := sPathArq
    else
     frmExecutaRegra.PathArq  := '';

    if sNomeArq <> '#' then
      frmExecutaRegra.NomeArq  := sNomeArq
    else
      frmExecutaRegra.NomeArq  := '';

    if sEscopo = 'A' then
      frmExecutaRegra.Escopo   := 'A'
    else
      frmExecutaRegra.Escopo   := 'T';

    //WO23149 - Leandro - Fim

    try
      frmExecutaRegra.Dispara;


      //wo25641 - Leandro Inicio
      if not frmExecutaRegra.ErroProcessar then
      begin
        frmExecutaRegra.QryExecucao.close();

        frmExecutaRegra.QryExecucao.Open();

        if frmExecutaRegra.QryExecucao.RecordCount > 0 then
          bErroProc := 1
        else
          bErroProc := 0;

        frmExecutaRegra.Close();
        //wo25641 - Leandro Fim
      end
      else
      begin
        bErroProc := 1;
      end;
    except
      //Application.Terminate;
      bErroProc := 1;
    end;
  end;

  Application.Terminate;
  Application.Run;

  Halt(bErroProc);


end.

