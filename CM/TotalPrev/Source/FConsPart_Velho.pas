unit FConsPart_Velho;

interface                           

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, Mask, wwdbedit, Grids,
  Wwdbigrd, Wwdbgrid, ExtCtrls, ComCtrls, Db, DBTables, Wwdatsrc, Wwquery,
  DBGrids, MontaSelect, wwdblook, DBCtrls, DBCGrids, ufiario;

type

  TfrmConsPart_Velho = class(TForm)
    pnlFundo: TPanel;
    pgcrtlConsPart: TPageControl;
    TbShtPartic: TTabSheet;
    PagFuncionarios: TPageControl;
    TbShtPes: TTabSheet;
    Panel2: TPanel;
    Splitter1: TSplitter;
    ScrollBox1: TScrollBox;
    lblNomePai: TLabel;
    lblNomeMae: TLabel;
    lblsexo: TLabel;
    lbldataFalecimento: TLabel;
    lbldataNascimento: TLabel;
    dbednomepai: TwwDBEdit;
    dbednomemae: TwwDBEdit;
    dbeddatafalecimento: TwwDBEdit;
    dbeddatanasc: TwwDBEdit;
    dbedSexo: TwwDBEdit;
    Panel12: TPanel;
    pnlEnderecos: TPanel;
    dbgridenderecos: TwwDBGrid;
    TbShtFunc: TTabSheet;
    Panel13: TPanel;
    lblDataAdmissao: TLabel;
    lblSalarioTotal: TLabel;
    lblNomeCargo: TLabel;
    lblSitFunc: TLabel;
    lblnomepatro: TLabel;
    lblNomeFilial: TLabel;
    dbedsaltotal: TwwDBEdit;
    dbedcargo: TwwDBEdit;
    dbeddataadmissao: TwwDBEdit;
    dbedsitfunc: TwwDBEdit;
    dbednomepatro: TwwDBEdit;
    dbedFilial: TwwDBEdit;
    pnlHstFuncional: TPanel;
    TbShtPlanos: TTabSheet;
    dbgridplanass: TwwDBGrid;
    dbgridPrev: TwwDBGrid;
    pnlAssistencial: TPanel;
    pnlPrevidenciario: TPanel;
    TbShtContrib: TTabSheet;
    PageContrib: TPageControl;
    TbShtContPrev: TTabSheet;
    dbgrdContribPrev: TwwDBGrid;
    Panel3: TPanel;
    TbShtContAss: TTabSheet;
    dbgirdcontrib: TwwDBGrid;
    pnlContribAssistencial: TPanel;
    TbShtBenef: TTabSheet;
    dbgirdbenef: TwwDBGrid;
    pnlBeneficios: TPanel;
    TbShtBenefic: TTabSheet;
    TbShtEvent: TTabSheet;
    TbShTReserv: TTabSheet;
    pnlResPoupanca: TPanel;
    TbShtProc: TTabSheet;
    dbgridproc: TwwDBGrid;
    pnlProcessoRAD: TPanel;
    tbhRub: TTabSheet;
    Splitter3: TSplitter;
    Dock971: TDock97;
    tb97Fundo: TToolbar97;
    sep1: TToolbarSep97;
    sep3: TToolbarSep97;
    bbtnSair: TBitBtn;
    bbtnAjuda: TmaHelpBitBtn;
    lblnome: TLabel;
    pnlNomeElegPart: TPanel;
    qryAux: TwwQuery;
    pgCrtlEvent: TPageControl;
    tbShtEventPrev: TTabSheet;
    tbShtEventAssistencial: TTabSheet;
    pnlEventos: TPanel;
    dbgrdEventos: TwwDBGrid;
    pnlEventPrev: TPanel;
    grpbxHstEventPro: TGroupBox;
    dbgEventosPrev: TwwDBGrid;
    GroupBox2: TGroupBox;
    pnlEventPrevHstContrib: TPanel;
    Shape1: TShape;
    Shape4: TShape;
    lblLegendaNovasContrib: TLabel;
    lblLegendaContribSusp: TLabel;
    Splitter5: TSplitter;
    Panel1: TPanel;
    dbgHstContFechado: TwwDBGrid;
    Splitter6: TSplitter;
    Splitter7: TSplitter;
    bbtnProcurar: TBitBtn;
    lblEstadoCivil: TLabel;
    dbedEstadoCivil: TwwDBEdit;
    lblEMail: TLabel;
    dbedEMail: TwwDBEdit;
    Panel5: TPanel;
    Splitter2: TSplitter;
    GrdRub: TwwDBGrid;
    Panel23: TPanel;
    Panel27: TPanel;
    wwDBGrid4: TwwDBGrid;
    Panel30: TPanel;
    Splitter8: TSplitter;
    Panel28: TPanel;
    Splitter10: TSplitter;
    Panel22: TPanel;
    wwDBGrid5: TwwDBGrid;
    Panel29: TPanel;
    wwDBGrid6: TwwDBGrid;
    Panel31: TPanel;
    Label1: TLabel;
    dbgridhistfunc: TwwDBGrid;
{ ==========================================================================
 | Sistema  .: ADMPREV                                                      |
 | Alterações solicitadas a Pedido do Usuário (REFER)                       |
 | Data     .: 05/12/2000                                                   |
 | Autor    .: Marco Diniz                                                  |
 | Objetivo .: DBEdit para mostrar o Nível do Participante                  |
  ========================================================================== }
    dbednivel: TwwDBEdit;
{ ==========================================================================
 | Objetivo .: Label para mostrar o Nome da Patrocinadora                   |
  ========================================================================== }
    lblpatro: TLabel;
{ ==========================================================================
 | Objetivo .: Label e DBEdit para mostrar o Anuênio                        |
  ========================================================================== }
    lblValor1: TLabel;
    dbeValor1: TwwDBEdit;
{ ==========================================================================
 | Objetivo .: Label e DBEdit para mostrar o Vantagem                       |
  ========================================================================== }
    lblValor2: TLabel;
    dbeValor2: TwwDBEdit;
{ ==========================================================================
 | Objetivo .: Label e DBEdit para mostrar o Tempo Creditado                |
  ========================================================================== }
    lblValor3: TLabel;
    dbeValor3: TwwDBEdit;
{ ==========================================================================
 | Objetivo .: Page para mostrar as Contribuições do Participante           |
  ========================================================================== }
    TbShFuncContribuicoes: TTabSheet;
    dbgridcontribuicoes: TwwDBGrid;
{ ==========================================================================
 | Objetivo .: Page para mostrar os Benefícios do Participante              |
  ========================================================================== }
    TbShFuncBeneficios: TTabSheet;
    dbgridbeneficios: TwwDBGrid;
    TabSheet1: TTabSheet;
    dbgrdResPoupanca: TwwDBGrid;
    dbgrHistReserva: TwwDBGrid;
    tbsPagamento: TTabSheet;
    dbgrVersoes: TwwDBGrid;
    wwDBGrid1: TwwDBGrid;
    Panel7: TPanel;
    dblkRecebedor: TwwDBLookupCombo;
    Recebedor: TLabel;
    wwDBEdit1: TwwDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    wwDBEdit2: TwwDBEdit;
    Label4: TLabel;
    wwDBEdit3: TwwDBEdit;
    wwDBEdit7: TwwDBEdit;
    Label5: TLabel;
    wwDBEdit4: TwwDBEdit;
    Label6: TLabel;
    wwDBEdit5: TwwDBEdit;
    Label7: TLabel;
    wwDBEdit6: TwwDBEdit;
    Label8: TLabel;
    TabSheet2: TTabSheet;
    DBCtrlGrid1: TDBCtrlGrid;
    DBMemo1: TDBMemo;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    wwDBEdit8: TwwDBEdit;
    Label12: TLabel;
    Label13: TLabel;
    wwDBEdit9: TwwDBEdit;
    dbgrMovBenef: TwwDBGrid;
    wwDBEdit10: TwwDBEdit;
    Label14: TLabel;
    wwDBEdit11: TwwDBEdit;
    Label15: TLabel;
    tbsEmprestimo: TTabSheet;
    tbContaCorrente: TTabSheet;
    dbgrContaBancaria: TwwDBGrid;
    tbsRubIndiv: TTabSheet;
    Panel8: TPanel;
    Label26: TLabel;
    DBEdit7: TDBEdit;
    Label22: TLabel;
    DBEdit13: TDBEdit;
    DBEdit8: TDBEdit;
    Label25: TLabel;
    Label18: TLabel;
    DBEdit9: TDBEdit;
    Label23: TLabel;
    DBEdit12: TDBEdit;
    DBEdit11: TDBEdit;
    Label24: TLabel;
    Label19: TLabel;
    DBEdit14: TDBEdit;
    DBEdit10: TDBEdit;
    Label20: TLabel;
    Label21: TLabel;
    DBEdit16: TDBEdit;
    Label27: TLabel;
    DBEdit17: TDBEdit;
    DBEdit15: TDBEdit;
    dbgRubIndiv: TwwDBGrid;
    Label16: TLabel;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    DBEdit28: TDBEdit;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    DBEdit30: TDBEdit;
    Label43: TLabel;
    DBEdit31: TDBEdit;
    Label44: TLabel;
    DBEdit4: TDBEdit;
    PageControl1: TPageControl;
    tbsBenefPrevid: TTabSheet;
    pnlBenefPrevidenciario: TPanel;
    dbgridpartprev: TwwDBGrid;
    tbsBenefAssist: TTabSheet;
    pnlBenefAssistencial: TPanel;
    dbgridpart: TwwDBGrid;
    Label50: TLabel;
    DBEdit36: TDBEdit;
    Label55: TLabel;
    DBEdit41: TDBEdit;
    DBEdit42: TDBEdit;
    Label56: TLabel;
    DBEdit35: TDBEdit;
    Label49: TLabel;
    Label48: TLabel;
    DBEdit34: TDBEdit;
    DBEdit33: TDBEdit;
    Label47: TLabel;
    Label17: TLabel;
    DBEdit5: TDBEdit;
    Label28: TLabel;
    DBEdit6: TDBEdit;
    DBEdit29: TDBEdit;
    Label45: TLabel;
    Label46: TLabel;
    DBEdit32: TDBEdit;
    DBEdit43: TDBEdit;
    Label57: TLabel;
    Label58: TLabel;
    DBEdit44: TDBEdit;
    Panel4: TPanel;
    dbgriddepen: TwwDBGrid;
    pnlDependentes: TPanel;
    wwDBEdit12: TwwDBEdit;
    Label59: TLabel;
    Label60: TLabel;
    wwDBEdit13 : TwwDBEdit;
    wwDBEdit14: TwwDBEdit;
    Label61: TLabel;
    edTempoTotal: TEdit;
    edTempoEspecial: TEdit;
    pnlTotais: TPanel;
    lblSaldosReserva: TLabel;
    lblDatacota: TLabel;
    TabSheet3: TTabSheet;
    wwDBGrid2: TwwDBGrid;
    wwDBGrid3: TwwDBGrid;
    wwDBEdit15: TwwDBEdit;
    Label62: TLabel;
    lblBloqueio: TLabel;
    MSConsPart_VELHO: TMontaSelect;
    wwwEdtCPF: TwwDBEdit;
    Label63: TLabel;
    DBEdit45: TDBEdit;
    Label64: TLabel;
    TbshHstRubricas: TTabSheet;
    Label65: TLabel;
    dblkMesCobranca: TwwDBLookupCombo;
    Panel6: TPanel;
    wwDBGrid7: TwwDBGrid;
    wwDBGrid8: TwwDBGrid;
    Naturalidade: TLabel;
    wwDBEdit16: TwwDBEdit;
    wwDBEdit17: TwwDBEdit;
    Label51: TLabel;
    DBEdtTelRes: TwwDBEdit;
    Label52: TLabel;
    DbEdtDDDres: TwwDBEdit;
    Label53: TLabel;
    DbEdtDDDcel: TwwDBEdit;
    DBEdtTelCel: TwwDBEdit;
    Label54: TLabel;
    Label66: TLabel;
    wwDBEdit18: TwwDBEdit;
    Label67: TLabel;
    wwDBEdit19: TwwDBEdit;
    wwDBEdit20: TwwDBEdit;
    Label68: TLabel;
    Label69: TLabel;
    MsConsPart: TMontaSelect;
{ ==============================================================
 |  FIM  - Continua na Implementation - procedure Selecionaqry  |
  ============================================================== }
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSairClick(Sender: TObject);
    procedure pgcrtlConsPartChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgHstContFechadoCalcCellColors(Sender: TObject;
      Field: TField; State: TGridDrawState; Highlight: Boolean;
      AFont: TFont; ABrush: TBrush);
    procedure Selecionaqry;
    procedure AtualizaDadosRub;
    procedure AtualizaDadosPlano;
    procedure bbtnProcurarClick(Sender: TObject);
    procedure PagFuncionariosChange(Sender: TObject);
    procedure pgCrtlEventChange(Sender: TObject);
    procedure dbgridPrevFieldChanged(Sender: TObject; Field: TField);
    procedure dblkRecebedorChange(Sender: TObject);
    procedure dbgrVersoesRowChanged(Sender: TObject);
    procedure dbgridbeneficiosFieldChanged(Sender: TObject; Field: TField);
    Function TransformaDiasTempo(Tempo:Integer):String;
    Function TempoExtenso(Tempo:Integer):String;
    procedure wwDBGrid3RowChanged(Sender: TObject);
    procedure dblkMesCobrancaChange(Sender: TObject);
    procedure wwDBGrid5CalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    // tavares
    procedure MostraBloqueio;
    procedure TbshHstRubricasShow(Sender: TObject);
    procedure RodaRegraElegibilidade;
  private
    { Private declarations }
  public
    { Public declarations }
    sidpessoaconspart, sidpessjurconspart, sidplanoprevconspart,
    sseqpropostaconspart, sdatabasename, sIDRGELEGBENEF : String;
    bRodandoElegibilidade : boolean;
  end;

var
  frmConsPart_Velho: TfrmConsPart_Velho;
  iIdCalculoGeral     : longInt ; // variavel criada para passar para a funcao RegraNumerica

  function RegraBooleana(sNumRegra,sSQL : string;var bErro : boolean) : boolean;
  procedure TiraSQL( qry : TwwQuery);

implementation

uses dConsPart, UMensErro, UConsPart;

{$R *.DFM}

procedure TfrmConsPart_Velho.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  With dtmConsPart do
  begin
    qryHstRubricas.Close;
    qrypartgeral.Close;
    qryTelefonesRes.Close;
    qryTelefonesCel.Close;
    qryendereco.Close;
    qrydepentit.Close;
    qryhistfunc.Close;
    qryDataInicioInss.Close;
    qryTelefoneComercial.Close;
    qryplanprev.Close;
    qryplanass.Close;
    qrycontribprev.Close;
    qrycontrib.Close;
    qrybenef.Close;
    qrypartprev.Close;
    qryContaCorrentePartPrev.Close;
    qryPart.Close;
    qryevent.Close;
    qryEventosPrev.Close;
    qryHstContF.Close;
    qryReserva.Close;
    qryProcesso.Close;
    qryRUBpendentes.Close;
    qryTipoDocRubPendentes.Close;
    qryRubs.Close;
    qryRubXBeneficio.Close;
    qryTipoDocXRub.Close;
    qryHistRubs.Close;
  end;
  action := cafree;
end;

procedure TfrmConsPart_Velho.bbtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConsPart_Velho.pgcrtlConsPartChange(Sender: TObject);
begin
  With dtmConsPart do
  begin
    MostraBloqueio;
    // telefones Residenciais
    dtmConsPart.qryTelefonesRes.Close;
    dtmConsPart.qryTelefonesRes.ParamByName('IdPessoa').asInteger := StrtoInt(sidpessoaconspart);
    dtmConsPart.qryTelefonesRES.Open;
    // telefones Celular
    dtmConsPart.qryTelefonesCel.Close;
    dtmConsPart.qryTelefonesCel.ParamByName('IdPessoa').asInteger := StrtoInt(sidpessoaconspart);
    dtmConsPart.qryTelefonesCel.Open;

    if Not qrypartgeral.Active      then qrypartgeral.Open;
    if Not qryendereco.Active       then qryendereco.Open;
    if Not qrydepentit.Active       then qrydepentit.Open;
    if Not qrycontribuicoes.Active  then qrycontribuicoes.Open;
    if Not qrybeneficios.Active     then qrybeneficios.Open;
    if Not qryMovBenef.Active       then qryMovBenef.Open;
    if Not qryReserva.Active        then qryReserva.Open;
    if Not qryContaCorrente.Active  then qryContaCorrente.Open;
    if Not qryRubIndiv.Active       then qryRubIndiv.Open;

    Case pgcrtlConsPart.ActivePage.PageIndex of
       4:
       begin
         if Not Qrypartprev.Active then Qrypartprev.Open;
         if Not QryContaCorrentepartprev.Active then QryContaCorrentepartprev.Open;
         if Not QryPart.Active     then QryPart.Open;
       end;
       6:
       begin
         if Not qryEventosPrev.Active then qryEventosPrev.Open;
         With qryHstContF Do
         begin
           if not Active then
           begin
             if not Prepared then Prepare;
             DatabaseName := sdatabasename;
             ParamByName('IdEventosPrev').AsString := qryEventosPrev.FieldByName('IDEVENTOSPREV').AsString;
             Open;
           end;
         end;
       end;
      8: if Not qryProcesso.Active then qryProcesso.Open;
      9: AtualizaDadosRub;
      10: if Not qryVersoes.Active Then Begin
              qryVersoes.ParamByName('IDTITULAR').AsInteger := StrtoInt(sidpessoaconspart);
              qryVersoes.Open;
              qryRecebedor.Close;
              qryRecebedor.ParamByName('IDTITULAR').AsInteger := StrtoInt(sidpessoaconspart);
              qryRecebedor.ParamByName('IDHSTFOLHABENEF').AsInteger := qryVersoes.FieldByName('IDHSTFOLHABENEF').AsInteger;;
              qryRecebedor.Open;
              qryRecebedor.First;
              dblkRecebedor.Text := qryRecebedorNOME.asString;
              qryHstVersoes.Close;
              qryHstVersoes.ParamByName('IDTITULAR').AsInteger       := StrtoInt(sidpessoaconspart);
              qryHstVersoes.ParamByName('IDHSTFOLHABENEF').AsInteger := qryVersoes.FieldByName('IDHSTFOLHABENEF').AsInteger;
              qryHstVersoes.ParamByName('IDRESPONSAVEL').AsInteger   := qryRecebedor.FieldByName('IDRESPONSAVEL').AsInteger;
              qryHstVersoes.Open;
          end;
      11:
         //tavares if Not qryFiario.Active Then
         Begin
           qryFiario.Close;
           qryFiario.ParamByName('IDTITULAR').AsInteger := StrtoInt(sidpessoaconspart);
           qryFiario.Open;
         end;

      12: if Not qryEmprestimos.Active Then Begin              // Empréstimos
              qryEmprestimos.Close;
              qryEmprestimos.ParamByName('IDPESSOA').AsInteger := StrtoInt(sidpessoaconspart);
              qryEmprestimos.Open;
              qryhstEmprestimo.Close;
              qryhstEmprestimo.ParamByName('IDCONTRATOEMPTMO').AsInteger :=
              qryEmprestimos.FieldByName('IDCONTRATOEMPTMO').AsInteger;
              qryhstEmprestimo.Open;

          end;
    end;


    if (pgcrtlConsPart.activePage = TbShtPlanos) or
       (pgcrtlConsPart.activePage = TbShtContAss) then
    begin
      if Not qryplanprev.Active then qryplanprev.Open;
      if Not qryplanass.Active  then qryplanass.Open;
    end;

    //histórico de Reserva/Saldo Conta
    if pgcrtlConsPart.activePage = TbShTReserv then
    begin
      if Not qryHistReserva.Active  then
         qryHistReserva.Open;
    end;

    //histórico contribuições previdenciarias
    if pgcrtlConsPart.activePage = TbShtContrib then
    begin
      if pageContrib.activePage = TbShtContPrev then
      begin
        if Not qrycontribprev.Active then
          qrycontribprev.Open;
        if Not qrycontrib.Active then qrycontrib.Open;
      end
    end;

    //histórico de Benefícios
    if pgcrtlConsPart.activePage = TbShtBenef then
    begin
      if Not Qrybenef.Active then
        Qrybenef.Open;
    end;


    if pgcrtlConsPart.activePage = TbshHstRubricas then
    begin
      qryMesRubrica.Close;
      qryMesRubrica.ParamByName('idPessoa').asInteger := StrtoInt(sidpessoaconspart);
      qryMesRubrica.open;
      qryMesRubrica.First;
      DblkMesCobranca.Text := qryMesRubricaMESCOBRANCA.asString;
      DblkMesCobranca.LookupValue := qryMesRubricaMESCOBRANCA.asString;
      dblkMesCobrancaChange(Sender);
    end;
  end;
end;


procedure TfrmConsPart_Velho.FormShow(Sender: TObject);
begin
   MostraBloqueio;
   Selecionaqry;
   pgcrtlConsPart.ActivePage := TbShtPartic;
   PagFuncionarios.Activepage := TbShtPes;
end;

procedure TfrmConsPart_Velho.dbgHstContFechadoCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  With dtmConsPart do
  begin
    if (qryEventosPrev.State in [dsInactive]) or
       (qryHstContF.State in [dsInactive]) then
        exit;


    if qryHstContF.FieldByName('FLGASSOCIADA').AsString = '0' then
    begin
       ABrush.Color := clMaroon;
       AFont.Color  := clWindow;
       if highlight then
       begin
         ABrush.Color := clMaroon;
         AFont.Color  := clWindow;
       end;
    end
    else
    if qryHstContF.FieldByName('FLGASSOCIADA').AsString = '1' then
    begin
      ABrush.Color := clTeal;
      AFont.Color  := clWindow;
      if highlight then
      begin
        ABrush.Color := clTeal;
        AFont.Color  := clWindow;
      end;
    end;
  end;
end;


procedure TfrmConsPart_Velho.Selecionaqry;
begin
  if sidpessjurconspart = '' then
    sidpessjurconspart := '0';
  if sidplanoprevconspart = '' then
    sidplanoprevconspart := '0';
  if sseqpropostaconspart = '' then
    sseqpropostaconspart := '0';

  With dtmConsPart Do
  begin
    With qrypartgeral Do
    begin
      if Active Then Close;
      if not Prepared then Prepare;
      DatabaseName := sdatabasename;
      ParamByName('IDTITULAR').AsFloat := StrtoInt(sidpessoaconspart);
      ParamByName('IDPESSJUR').AsFloat := StrToInt(sidpessjurconspart);
      Open;

    // telefones Residenciais
    dtmConsPart.qryTelefonesRes.Close;
    dtmConsPart.qryTelefonesRes.ParamByName('IdPessoa').asInteger := StrtoInt(sidpessoaconspart);
    dtmConsPart.qryTelefonesRES.Open;
    // telefones Celular
    dtmConsPart.qryTelefonesCel.Close;
    dtmConsPart.qryTelefonesCel.ParamByName('IdPessoa').asInteger := StrtoInt(sidpessoaconspart);
    dtmConsPart.qryTelefonesCel.Open;

 { ==========================================================================
 | Objetivo .: mostrar o Nível do Participante, Anuênios, Vantagem e Tempo  |
 |             Creditado                                                    |
  ========================================================================== }
      lblValor1.Caption := FieldByName('NOMEVALORBASE1').AsString;
      lblValor2.Caption := FieldByName('NOMEVALORBASE2').AsString;
      lblValor3.Caption := FieldByName('NOMEVALORBASE3').AsString;
    end;

{ ==========================================================================
 | Objetivo .: query para mostrar as Contribuições do Participante          |
  ========================================================================== }
    With qryContribuicoes Do
    begin
      if Active Then Close;
      if not Prepared then Prepare;
      DatabaseName := sdatabasename;
      ParamByName('IDTITULAR').AsFloat   := Strtofloat(sidpessoaconspart);
      ParamByName('IDPESSJUR').AsFloat   := StrTofloat(sidpessjurconspart);
      ParamByName('IDPLANOPREV').AsFloat := StrTofloat(sidplanoprevconspart);
      ParamByName('SEQPROPOSTA').AsFloat := StrTofloat(sseqpropostaconspart);
      Open;
    end;
{ ==========================================================================
 | Objetivo .: query para mostrar os Benefícios do Participante             |
  ========================================================================== }
    With qryBeneficios Do
    begin
      if Active Then Close;
      if not Prepared then Prepare;
      DatabaseName := sdatabasename;
      ParamByName('IDTITULAR').AsFloat   := StrtoInt(sidpessoaconspart);
      ParamByName('IDPESSJUR').AsFloat   := StrToInt(sidpessjurconspart);
      ParamByName('IDPLANOPREV').AsFloat := StrToInt(sidplanoprevconspart);
      ParamByName('SEQPROPOSTA').AsFloat := StrToInt(sseqpropostaconspart);
      Open;
    end;
    With qryMovBenef Do
    Begin
      Close;
      ParamByName('IDTITULAR').AsInteger      := StrtoInt(sidpessoaconspart);
      ParamByName('NUMEROPROCESSO').AsInteger := dtmConsPart.qrybeneficios.FieldByName('NUMEROPROCESSO').AsInteger;
      Open;
    end;
{ ==================================================
 |  FIM  - Continua na procedure bbtnProcurarClick  |
  ================================================== }
    With qryendereco Do
    begin
      if Active Then Close;
      if not Prepared then Prepare;
      DatabaseName := sdatabasename;
      ParamByName('IDTITULAR').AsFloat := StrtoInt(sidpessoaconspart);
      Open;
    end;

    With qrydepentit Do
    begin
      if Active Then Close;
      if not Prepared then Prepare;
      DatabaseName := sdatabasename;
      ParamByName('IDTITULAR').AsFloat := StrtoInt(sidpessoaconspart);
      Open;
      if not dtmconsPart.qryDepentit.IsEmpty then
        RodaRegraElegibilidade;
    end;

    With qryContaCorrente Do
    begin
      if Active Then Close;
      if not Prepared then Prepare;
      DatabaseName := sdatabasename;
      ParamByName('IDPESSOA').AsFloat := StrtoInt(sidpessoaconspart);
      Open;
    end;

    With qryRubIndiv Do
    begin
      if Active Then Close;
      if not Prepared then Prepare;
      DatabaseName := sdatabasename;
      ParamByName('IDPESSOA').AsFloat := StrtoInt(sidpessoaconspart);
      Open;
    end;

    With qryReserva Do
    begin
      if Active Then Close;
      if not Prepared then Prepare;
      DatabaseName := sdatabasename;
      ParamByName('IDTITULAR').AsFloat   := StrtoInt(sidpessoaconspart);
      ParamByName('IDPESSJUR').AsFloat   := StrToInt(sidpessjurconspart);
      ParamByName('IDPLANOPREV').AsFloat := StrToInt(sidplanoprevconspart);
      ParamByName('SEQPROPOSTA').AsFloat := StrToInt(sseqpropostaconspart);
      Open;
    end;

    With qryhistfunc Do
    begin
      if Active Then Close;
      if not Prepared then Prepare;
      DatabaseName := sdatabasename;
      ParamByName('IDTITULAR').AsFloat := StrtoInt(sidpessoaconspart);
      ParamByName('IDPESSJUR').AsFloat := StrToInt(sidpessjurconspart);
    end;
    qryDataInicioInss.Close;
    qryDataInicioInss.ParamByName('IdPessoa').asInteger := StrtoInt(sidpessoaconspart);
    if not qryDataInicioInss.prepared then qryDataInicioInss.Prepare;
    qryTelefoneComercial.Close;
    qryTelefoneComercial.ParamByName('IdPessoa').asInteger := StrtoInt(sidpessoaconspart);
    if not qryTelefoneComercial.prepared then qryTelefoneComercial.Prepare;

    With qryplanprev Do
    begin
      if Active Then Close;
      if not Prepared then Prepare;
      DatabaseName := sdatabasename;
      ParamByName('IDTITULAR').AsFloat := StrtoInt(sidpessoaconspart);
    end;

    With qryplanass Do
    begin
      if Active Then Close;
      if not Prepared then Prepare;
      DatabaseName := sdatabasename;
      ParamByName('IDTITULAR').AsFloat := StrtoInt(sidpessoaconspart);
      ParamByName('IDPESSJUR').AsFloat := StrToInt(sidpessjurconspart);
      ParamByName('SEQPROPOSTA').AsFloat := StrToInt(sseqpropostaconspart);
    end;

    With qrycontribprev Do
    begin
      if Active Then Close;
      if not Prepared then Prepare;
      DatabaseName := sdatabasename;
      ParamByName('IDTITULAR').AsFloat   := StrtoInt(sidpessoaconspart);
      ParamByName('IDPESSJUR').AsFloat   := StrToInt(sidpessjurconspart);
      ParamByName('IDPLANOPREV').AsFloat := StrToInt(sidplanoprevconspart);
      ParamByName('SEQPROPOSTA').AsFloat := StrToInt(sseqpropostaconspart);
    end;

    With qrycontrib Do
    begin
      if Active Then Close;
      if not Prepared then Prepare;
      DatabaseName := sdatabasename;
      ParamByName('IDTITULAR').AsFloat   := StrtoInt(sidpessoaconspart);
      ParamByName('IDPESSJUR').AsFloat   := StrToInt(sidpessjurconspart);
      ParamByName('IDPLANOPREV').AsFloat := StrToInt(sidplanoprevconspart);
      ParamByName('SEQPROPOSTA').AsFloat := StrToInt(sseqpropostaconspart);
    end;

    With qrybenef Do
    begin
      if Active Then Close;
      if not Prepared then Prepare;
      DatabaseName := sdatabasename;
      ParamByName('IDTITULAR').AsFloat   := StrtoInt(sidpessoaconspart);
      ParamByName('IDPESSJUR').AsFloat   := StrToInt(sidpessjurconspart);
      ParamByName('IDPLANOPREV').AsFloat := StrToInt(sidplanoprevconspart);
      ParamByName('SEQPROPOSTA').AsFloat := StrToInt(sseqpropostaconspart);
    end;

    With qrypartprev Do
    begin
      if Active Then Close;
      if not Prepared then Prepare;
      DatabaseName := sdatabasename;
      ParamByName('IDTITULAR').AsFloat := StrtoInt(sidpessoaconspart);
      ParamByName('IDPESSJUR').AsFloat := StrToInt(sidpessjurconspart);
      ParamByName('IDPLANOPREV').AsFloat := StrToInt(sidplanoprevconspart);
      ParamByName('SEQPROPOSTA').AsFloat := StrToInt(sseqpropostaconspart);
    end;

    With qrypart Do
    begin
      if Active Then Close;
      if not Prepared then Prepare;
      DatabaseName := sdatabasename;
      ParamByName('IDTITULAR').AsFloat := StrtoInt(sidpessoaconspart);
      ParamByName('IDPESSJUR').AsFloat := StrToInt(sidpessjurconspart);
      ParamByName('IDPLANOPREV').AsFloat := StrToInt(sidplanoprevconspart);
      ParamByName('SEQPROPOSTA').AsFloat := StrToInt(sseqpropostaconspart);
    end;

    With qryevent Do
    begin
      if Active Then Close;
      if not Prepared then Prepare;
      DatabaseName := sdatabasename;
      ParamByName('IDTITULAR').AsFloat := StrtoInt(sidpessoaconspart);
      ParamByName('IDPESSJUR').AsFloat := StrToInt(sidpessjurconspart);
      ParamByName('IDPLANOPREV').AsFloat := StrToInt(sidplanoprevconspart);
      ParamByName('SEQPROPOSTA').AsFloat := StrToInt(sseqpropostaconspart);
    end;

    With qryEventosPrev Do
    begin
      if Active Then Close;
      if not Prepared then Prepare;
      DatabaseName := sdatabasename;
      ParamByName('IDTITULAR').AsFloat := StrtoInt(sidpessoaconspart);
    end;

    With qryHistReserva Do
    begin
      if Active Then Close;
      if not Prepared then Prepare;
      DatabaseName := sdatabasename;
      ParamByName('IDTITULAR').AsFloat   := StrtoInt(sidpessoaconspart);
      ParamByName('IDPESSJUR').AsFloat   := StrToInt(sidpessjurconspart);
      ParamByName('IDPLANOPREV').AsFloat := StrToInt(sidplanoprevconspart);
      ParamByName('SEQPROPOSTA').AsFloat := StrToInt(sseqpropostaconspart);
    end;
    With qryprocesso Do
    begin
      if Active Then Close;
      if not Prepared then Prepare;
      DatabaseName := sdatabasename;
      ParamByName('IDTITULAR').AsFloat := StrtoInt(sidpessoaconspart);
    end;
    With qryEmprestimos Do
    begin
      if Active Then Close;
      if not Prepared then Prepare;
      DatabaseName := sdatabasename;
      ParamByName('IDPESSOA').AsFloat := StrtoInt(sidpessoaconspart);
    end;

  end;
  dtmConsPart.qryVersoes.Close;
  dtmConsPart.qryRecebedor.Close;
  dtmConsPart.qryHstVersoes.Close;
  dtmConsPart.qryFiario.Close;

  if (sidpessoaconspart <> '') then
  begin
    dtmConsPart.qryDocPessoa.close;
    dtmConsPart.qryDocPessoa.paramByName('idpessoa').asInteger :=  strToInt(sidpessoaconspart);
    dtmConsPart.qryDocPessoa.Open;
    wwwEdtCPF.Text := dtmConsPart.qryDocPessoaNUMDOCUMENTO.asString;
  end;
end;

procedure TfrmConsPart_Velho.bbtnProcurarClick(Sender: TObject);
begin
  MSConsPart.Executar;
  if MSConsPart.RetornouValor then
  begin
    // Consulta Participante
    sidpessoaconspart    := MSConsPart.ValoresChave[5];
    sidpessjurconspart   := MSConsPart.ValoresChave[1];
    sidplanoprevconspart := MSConsPart.ValoresChave[2];
    sseqpropostaconspart := MSConsPart.ValoresChave[3];

    sdatabasename := 'BaseDados';
    MostraBloqueio;
  end;
  With qryaux Do
  begin
    Close;
    DatabaseName := sdatabasename;
    Sql.clear;
{ ==========================================================================
 | Sistema  .: ADMPREV                                                      |
 | Alterações solicitadas a Pedido do Usuário (REFER)                       |
 | Objetivo .: mostrar o Nome da Patrocinadora e Situação do Participante   |
 | Data     .: 05/12/2000                                                   |
 | Autor    .: Marco Diniz                                                  |
  ==========================================================================}

    if sseqpropostaconspart = '' then
      sseqpropostaconspart := '0';
    if sidplanoprevconspart = '' then
      sidplanoprevconspart := '0';
    if sidpessjurconspart = '' then
      sidpessjurconspart := '0';

  Sql.TEXT := ' SELECT EL.IDPESSOA, P.NOME, NVL(PA.NOME, ''SEM PATROCINADORA'') AS PATROCINADORA, '+
              '   NVL(SIT.DESCRICAO, ''NÃO PARTICIPANTE'') AS SITPART, EL.MATRICULA '+
              ' FROM ELEGPATRO EL , PARTPREVPLAN PPP, PESSOA P, PESSOA PA, SITPART SIT '+
              ' WHERE EL.IDPESSOA = '+sidpessoaconspart+
              ' AND EL.IDPESSOA = P.IDPESSOA '+
              ' AND EL.IDPESSOA  = PPP.IDPESSOA(+) '+
              ' AND EL.IDPESSJUR(+) = '+sidpessjurconspart+
              ' AND PPP.IDPESSJUR(+) = EL.IDPESSJUR '+
              ' AND (PPP.SEQPROPOSTA = '+sseqpropostaconspart+ ' OR PPP.SEQPROPOSTA IS NULL) '+
              ' AND (PPP.IDPLANOPREV = '+sidplanoprevconspart+ ' OR  PPP.IDPLANOPREV IS NULL) '+
              ' AND (PPP.IDSITPART = SIT.IDSITPART(+)) '+
              ' AND PPP.IDPESSJUR = PA.IDPESSOA(+) ';

    Open;
    if isempty then
    begin
      MsgDlg('Os dados informados não correspondem a um Elegível/Participante.','Erro',mtError,[mbOk],0);
      exit;
    end;
  end;
  lblnome.caption  := qryAux.FieldByName('NOME').AsString + ' - Matrícula : ' + qryAux.FieldByName('MATRICULA').AsString;
{ ===================================================================================
 | Objetivo .: Label para mostrar o Nome da Patrocinadora e Situação do Participante |
  =================================================================================== }
  lblpatro.caption := 'Patrocinadora : ' + qryAux.FieldByName('PATROCINADORA').AsString +
                      ' - Situação na Fundação : ' + qryAux.FieldByName('SITPART').AsString;
  Selecionaqry;
  pgcrtlConsPart.ActivePage  := TbShtPartic;
  PagFuncionarios.activepage := TbShtPes;
  MostraBloqueio;
end;

Procedure TfrmConsPart_Velho.AtualizaDadosRub;
begin
  With dtmConsPart Do
  begin
    With qryRUBpendentes Do
     begin
       if Active Then Close;
       if not Prepared then Prepare;
       DatabaseName := sdatabasename;
       ParamByName('IDTITULAR').AsFloat := StrtoInt(sidpessoaconspart);
       ParamByName('IDPESSJUR').AsFloat := StrToInt(sidpessjurconspart);
       ParamByName('IDPLANOPREV').AsFloat := StrToInt(sidplanoprevconspart);
       Open;
     end;
    qryTipoDocRubPendentes.Close;
    qryTipoDocRubPendentes.Open;

    With QryRubs Do
     Begin
       if Active then Close;
       if Not Prepared then Prepare;
       DatabaseName := sdatabasename;
       ParamByName('IDTITULAR').AsFloat := StrtoInt(sidpessoaconspart);
       Open;
     End;
    qryTipoDocXRub.Close;
    qryTipoDocXRub.Open;

    qryRubXBeneficio.Close;
    qryRubXBeneficio.Open;

    qryHistRubs.Close;
    qryHistRubs.Open;

  end;
end;

Procedure TfrmConsPart_Velho.AtualizaDadosPlano;
begin
  With dtmConsPart Do
  begin
    With qrycontribprev Do
    begin
      if Active Then Close;
      if not Prepared then Prepare;
      DatabaseName := sdatabasename;
      ParamByName('IDTITULAR').AsFloat   := StrtoInt(sidpessoaconspart);
      ParamByName('IDPESSJUR').AsFloat   := StrToInt(sidpessjurconspart);
      ParamByName('IDPLANOPREV').AsFloat := StrToInt(sidplanoprevconspart);
      ParamByName('SEQPROPOSTA').AsFloat := StrToInt(sseqpropostaconspart);
    end;

    With qrycontrib Do
    begin
      if Active Then Close;
      if not Prepared then Prepare;
      DatabaseName := sdatabasename;
      ParamByName('IDTITULAR').AsFloat   := StrtoInt(sidpessoaconspart);
      ParamByName('IDPESSJUR').AsFloat   := StrToInt(sidpessjurconspart);
      ParamByName('IDPLANOPREV').AsFloat := StrToInt(sidplanoprevconspart);
      ParamByName('SEQPROPOSTA').AsFloat := StrToInt(sseqpropostaconspart);
    end;

    With qryContribuicoes Do
    begin
      if Active Then Close;
      if not Prepared then Prepare;
      DatabaseName := sdatabasename;
      ParamByName('IDTITULAR').AsFloat   := StrtoInt(sidpessoaconspart);
      ParamByName('IDPESSJUR').AsFloat   := StrToInt(sidpessjurconspart);
      ParamByName('IDPLANOPREV').AsFloat := StrToInt(sidplanoprevconspart);
      ParamByName('SEQPROPOSTA').AsFloat := StrToInt(sseqpropostaconspart);
      Open;
    end;
    
    With qrybenef Do
    begin
      if Active Then Close;
      if not Prepared then Prepare;
      DatabaseName := sdatabasename;
      ParamByName('IDTITULAR').AsFloat   := StrtoInt(sidpessoaconspart);
      ParamByName('IDPESSJUR').AsFloat   := StrToInt(sidpessjurconspart);
      ParamByName('IDPLANOPREV').AsFloat := StrToInt(sidplanoprevconspart);
      ParamByName('SEQPROPOSTA').AsFloat := StrToInt(sseqpropostaconspart);
    end;

    With qrypartprev Do
    begin
      if Active Then Close;
      if not Prepared then Prepare;
      DatabaseName := sdatabasename;
      ParamByName('IDTITULAR').AsFloat := StrtoInt(sidpessoaconspart);
      ParamByName('IDPESSJUR').AsFloat := StrToInt(sidpessjurconspart);
      ParamByName('IDPLANOPREV').AsFloat := StrToInt(sidplanoprevconspart);
      ParamByName('SEQPROPOSTA').AsFloat := StrToInt(sseqpropostaconspart);
    end;

    With qrypart Do
    begin
      if Active Then Close;
      if not Prepared then Prepare;
      DatabaseName := sdatabasename;
      ParamByName('IDTITULAR').AsFloat := StrtoInt(sidpessoaconspart);
      ParamByName('IDPESSJUR').AsFloat := StrToInt(sidpessjurconspart);
      ParamByName('IDPLANOPREV').AsFloat := StrToInt(sidplanoprevconspart);
      ParamByName('SEQPROPOSTA').AsFloat := StrToInt(sseqpropostaconspart);
    end;

    With qryevent Do
    begin
      if Active Then Close;
      if not Prepared then Prepare;
      DatabaseName := sdatabasename;
      ParamByName('IDTITULAR').AsFloat := StrtoInt(sidpessoaconspart);
      ParamByName('IDPESSJUR').AsFloat := StrToInt(sidpessjurconspart);
      ParamByName('IDPLANOPREV').AsFloat := StrToInt(sidplanoprevconspart);
      ParamByName('SEQPROPOSTA').AsFloat := StrToInt(sseqpropostaconspart);
    end;

    With qryReserva Do
    begin
      if Active Then Close;
      if not Prepared then Prepare;
      DatabaseName := sdatabasename;
      ParamByName('IDTITULAR').AsFloat   := StrtoInt(sidpessoaconspart);
      ParamByName('IDPESSJUR').AsFloat   := StrToInt(sidpessjurconspart);
      ParamByName('IDPLANOPREV').AsFloat := StrToInt(sidplanoprevconspart);
      ParamByName('SEQPROPOSTA').AsFloat := StrToInt(sseqpropostaconspart);
    end;
    With qryHistReserva Do
    begin
      DatabaseName := sdatabasename;
      ParamByName('IDTITULAR').AsFloat   := StrtoInt(sidpessoaconspart);
      ParamByName('IDPESSJUR').AsFloat   := StrToInt(sidpessjurconspart);
      ParamByName('IDPLANOPREV').AsFloat := StrToInt(sidplanoprevconspart);
      ParamByName('SEQPROPOSTA').AsFloat := StrToInt(sseqpropostaconspart);
    end;

  end;
end;

procedure TfrmConsPart_Velho.PagFuncionariosChange(Sender: TObject);
begin
  if PagFuncionarios.ActivePage.PageIndex = 1 then
  begin
    With dtmConsPart do
    begin
        if Not qrypartgeral.Active then qrypartgeral.Open;

        // telefones Residenciais
        dtmConsPart.qryTelefonesRes.Close;
        dtmConsPart.qryTelefonesRes.ParamByName('IdPessoa').asInteger := StrtoInt(sidpessoaconspart);
        dtmConsPart.qryTelefonesRES.Open;
        // telefones Celular
        dtmConsPart.qryTelefonesCel.Close;
        dtmConsPart.qryTelefonesCel.ParamByName('IdPessoa').asInteger := StrtoInt(sidpessoaconspart);
        dtmConsPart.qryTelefonesCel.Open;

        qryDataInicioInss.Open;
        qryTelefoneComercial.Open;
        if Not qryhistfunc.Active  then Begin
           // tavares - pega a data do servidor SQL que sempre está correta.
           ProcessaHistContrib(qryAux, StrToInt(sidpessoaconspart), pegaDataDoServidor);
           qryhistfunc.Open;
           qryHistFunc.First;
           edTempoTotal.Text    := TempoExtenso(qryHistFuncTEMPOSEMCONVERSAO.AsInteger);
           edTempoEspecial.Text := TempoExtenso(qryHistFuncTEMPOSERVCALC.AsInteger);
           while not qryHistFunc.EOF Do Begin
             qryHistFunc.edit;
             qryHistFunc.FieldByName('TEMPOPOREMPRESAEXTENSO').AsString :=
                 TempoExtenso(qryHistFunc.FieldByName('TEMPOCALC').AsInteger);
              qryHistFunc.post;
             qryHistFunc.Next;
           end;
           qryHistFunc.First;
        end;
    end;
  end;
end;

procedure TfrmConsPart_Velho.pgCrtlEventChange(Sender: TObject);
begin
  if pgCrtlEvent.ActivePage.PageIndex = 1 then
  begin
    With dtmConsPart do
    if Not qryevent.Active  then qryevent.Open;
  end;

end;

procedure TfrmConsPart_Velho.dbgridPrevFieldChanged(Sender: TObject;
  Field: TField);
begin
  AtualizaDadosPlano;
end;

procedure TfrmConsPart_Velho.dblkRecebedorChange(Sender: TObject);
begin
  dtmConsPart.qryHstVersoes.Close;
  dtmConsPart.qryHstVersoes.ParamByName('IDTITULAR').AsInteger       := StrtoInt(sidpessoaconspart);
  dtmConsPart.qryHstVersoes.ParamByName('IDHSTFOLHABENEF').AsInteger := dtmConsPart.qryVersoes.FieldByName('IDHSTFOLHABENEF').AsInteger;
  dtmConsPart.qryHstVersoes.ParamByName('IDRESPONSAVEL').AsInteger   := dtmConsPart.qryRecebedor.FieldByName('IDRESPONSAVEL').AsInteger;
  dtmConsPart.qryHstVersoes.Open;
end;

procedure TfrmConsPart_Velho.dbgrVersoesRowChanged(Sender: TObject);
begin
  dtmConsPart.qryRecebedor.Close;
  dtmConsPart.qryRecebedor.ParamByName('IDTITULAR').AsInteger := StrtoInt(sidpessoaconspart);
  dtmConsPart.qryRecebedor.ParamByName('IDHSTFOLHABENEF').AsInteger := dtmConsPart.qryVersoes.FieldByName('IDHSTFOLHABENEF').AsInteger;;
  dtmConsPart.qryRecebedor.Open;
  dtmConsPart.qryHstVersoes.Close;
  dtmConsPart.qryHstVersoes.ParamByName('IDTITULAR').AsInteger       := StrtoInt(sidpessoaconspart);
  dtmConsPart.qryHstVersoes.ParamByName('IDHSTFOLHABENEF').AsInteger := dtmConsPart.qryVersoes.FieldByName('IDHSTFOLHABENEF').AsInteger;
  dtmConsPart.qryHstVersoes.ParamByName('IDRESPONSAVEL').AsInteger   := dtmConsPart.qryRecebedor.FieldByName('IDRESPONSAVEL').AsInteger;
  dtmConsPart.qryHstVersoes.Open;
end;

procedure TfrmConsPart_Velho.dbgridbeneficiosFieldChanged(Sender: TObject;
  Field: TField);
begin
  dtmConsPart.qryMovBenef.Close;
  dtmConsPart.qryMovBenef.ParamByName('IDTITULAR').AsInteger := StrtoInt(sidpessoaconspart);
  dtmConsPart.qryMovBenef.ParamByName('NUMEROPROCESSO').AsInteger := dtmConsPart.qrybeneficios.FieldByName('NUMEROPROCESSO').AsInteger;
  dtmConsPart.qryMovBenef.Open;
end;

//******************************************************************************
// Transforma numero de dias Dias em Tempo DDMMAAAA
Function TfrmConsPart_Velho.TransformaDiasTempo(Tempo:Integer):String;
Var
  I:Integer;
  wAnoF, wMesF, wDiaF:Double;
  wAno, wMes, wDia, wStrTempo:String;
Begin
  Result :='';

// Calcula Tempos
  wAnoF := (Tempo/360);
  wMesF := (Frac(wAnoF)*12);
  wDiaF := Round((wMesF-Int(wMesF))*30);

// Separa Tempos
  wAno := FloatToStr( Int( wAnoF ) );
  wMes := FloatToStr( Int( wMesF ) );
  wDia := FloatToStr( Int( wDiaF ) );

  If StrToInt(wAno) < 10 Then wAno:= '0'+wAno;
  If StrToInt(wMes) < 10 Then wMes:= '0'+wMes;
  If StrToInt(wDia) < 10 Then wDia:= '0'+wDia;

// Caso Dias = 30 Aumenta Mes
  If wDia = '30' Then Begin
    wMes:= IntToStr((StrToInt(wMes)+1));
    If (StrToInt(wMes) < 10) Then wMes:= '0'+wMes;
    wDia:= '00';
  End;
// Caso Meses = 12 Aumenta Ano
  If wMes = '12' Then Begin
    wAno:= IntToStr((StrToInt(wAno)+1));
    wMes:= '00';
  End;

  wStrTempo:=wAno+wMes+wDia;

  I := Length(wStrTempo);

  Result := StringofChar('0',(6-I))+wStrTempo; // Acerta Tamanho para 6 Casas

End;



//******************************************************************************
// Retorna tempo em extenso
Function TfrmConsPart_Velho.TempoExtenso(Tempo:Integer):String;
Var
  wStrAno, wStrMes, wStrDia, wStrTempo :String;
  wTempo, I:Integer;
Begin
// Decodifica Tempo Final
  wStrTempo:=IntToStr(Tempo);
// Caso Vazio, Sai Fora
  If Trim(wStrTempo) = '' Then Exit;

  wStrTempo := TransformaDiasTempo(StrToInt(wStrTempo));
  I := Length(wStrTempo);
  wStrTempo:= StringofChar('0',(6-I))+wStrTempo; // Acerta Tamanho para 6 Casas
  wStrAno  :=Copy(wStrTempo,1,2);
  wStrMes  :=Copy(wStrTempo,3,2);
  wStrDia  :=Copy(wStrTempo,5,2);
// Monta String do Resultador
  Result := wStrAno + ' ano(s), '+
            wStrMes + ' mes(es) e '+
            wStrDia + ' dia(s) ';
End;

procedure TfrmConsPart_Velho.wwDBGrid3RowChanged(Sender: TObject);
begin
  dtmConsPart.qryhstEmprestimo.Close;
  dtmConsPart.qryhstEmprestimo.ParamByName('IDCONTRATOEMPTMO').AsInteger :=
  dtmConsPart.qryEmprestimos.FieldByName('IDCONTRATOEMPTMO').AsInteger;
  dtmConsPart.qryhstEmprestimo.Open;
end;

procedure TfrmConsPart_Velho.wwDBGrid5CalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  If Field.FieldName = 'FLGRECEBIDO' Then  ABrush.Color := $00C6FFFF;
end;

procedure TfrmConsPart_Velho.MostraBloqueio;
begin
  dtmConsPart.qryPessoaFisica.close;
  dtmConsPart.qryPessoaFisica.paramByName('IDPESSOA').asInteger := StrtoInt(sidpessoaconspart);
  dtmConsPart.qryPessoaFisica.open;
  lblBloqueio.Visible := dtmConsPart.qryPessoaFisicaFLGBLOQUEIO.asInteger = 1;
  dtmConsPart.qryPessoaFisica.close;
end;


procedure TfrmConsPart_Velho.dblkMesCobrancaChange(Sender: TObject);
begin
  dtmConsPart.qryHstRubricas.Close;
  if (dblkMesCobranca.Text <> '') and (dblkMesCobranca.LookupValue <> '') then
  begin
    dtmConsPart.qryHstRubricas.Close;
    dtmConsPart.qryHstRubricas.ParamByName('idPessoa').asInteger := StrtoInt(sidpessoaconspart);
    dtmConsPart.qryHstRubricas.ParamByName('MesCobranca').asString := dtmConsPart.qryMesRubricaMesCobranca.asString;
    dtmConsPart.qryHstRubricas.Open;
  end;
end;

procedure TfrmConsPart_Velho.TbshHstRubricasShow(Sender: TObject);
begin
  dtmConsPart.qryHstRubricas.Close;
end;

procedure TfrmConsPart_Velho.RodaRegraElegibilidade;
var bElegivel, bErro : boolean;
    sSQL,
    sMsgErro : string;
begin
  // Rodar regra de elegibilidade de cada um dos dependentes
  bRodandoElegibilidade := True;
  dtmConsPart.qryDepentit.First;
  while not dtmConsPart.qryDepentit.Eof do
  begin
    sSQL := ' SELECT  PF.DATANASC,  PF.DATAMORTE, PF.SEXO, PF.ESTCIVIL, PP.DTINICIOINSC,  '+
            '         EL.TEMPONAOCREDITADO, EL.DATAADMISSAO, EL.IDSITFUNC,                 '+
            '         EL.TEMPOSERVANTERIOR, EL.TEMPOSITESPECIAL, DE.FLGBENEFICIARIO,       '+
            '         EL.TEMPOSERVTOTAL,    EL.DATADEMISSAO, EL.DATADEMISSAO,              '+
            '         EL.TEMPOSERVTOTMES, EL.TEMPOSERVTOTDIA, '+
            '         PP.FLGDEVEPREVIDENC, PP.FLGDEVEASSISTENC, PP.FLGDEVEEMPRESTIMO,      '+
            '         PP.IDSITPART, PP.IDSITPLANOPREV, PP.IDPESSOA, PP.SEQPROPOSTA,        '+
            '         PP.IDPESSJUR,  PP.IDPLANOPREV, PP.INSCRICAODATA,SP.FLGINTERNO,      '+
            '         D.FLGDESIGNADO, DE.IDDEPENDENCIA, D.IDSITDEPENDENTE, DE.IDTITULAR,   '+
            '''' +DateToStr(date)+ ''' AS DATAREF '+
            ' FROM  ELEGPATRO EL, DEPENTIT DE, PESSOAFISICA PF, '+
            '       PARTPREVPLAN PP, SITPART SP, DEPENDENTE D '+
            ' WHERE PP.IDPESSOA    = ' + sidpessoaconspart + ' AND '+
            '       PP.SEQPROPOSTA = ' + sseqpropostaconspart + ' AND '+
            '       PP.IDPLANOPREV = ' + sidplanoprevconspart + ' AND '+
            '       PP.IDPESSJUR   = ' + sidpessjurconspart + ' AND '+
            '       DE.IDPESSOA    = ' + dtmConsPart.qryDepentit.FieldByName('IDPESSOA').AsString + ' AND '+
            '       DE.IDPESSOA    = D.IDPESSOA AND '+
            '       EL.IDPESSOA    = PP.IDPESSOA  AND '+
            '       EL.IDPESSJUR   = PP.IDPESSJUR AND '+
            '       SP.IDSITPART   = PP.IDSITPART AND '+
            '       DE.IDTITULAR   = EL.IDPESSOA  AND '+
            '       DE.IDPESSOA    = PF.IDPESSOA(+) ';

    bElegivel := RegraBooleana(sIDRGELEGBENEF, sSQL , bErro);

    dtmConsPart.qryDepentit.Edit;
    if bElegivel
    then dtmConsPart.qryDepentit.FieldByName('FLGELEGIVEL').AsInteger := 1
    else dtmConsPart.qryDepentit.FieldByName('FLGELEGIVEL').AsInteger := 0;
    dtmConsPart.qryDepentit.Post;
    dtmConsPart.qryDepentit.Next;
  end;
  bRodandoElegibilidade := False;
end;


{ FUNCOES RELACIONADAS AO SISTEMA DE  REGRA DE NEGOCIO }
function RegraBooleana(sNumRegra,sSQL : string;var bErro : boolean) : boolean;
var sResult : string;
    cAux    : char;
begin
   Result := True;
   bErro  := False;

   if Trim(sNumRegra) = '' then Exit;
   iIdCalculoGeral := 0;

   Result := False;
   with dtmConsPart do
   begin
      regraAPrev.RuleName := sNumRegra;
      qryRegra.Close;
      qryRegra.SQL.Clear;
      qryRegra.SQl.Add(sSQL);
      qryRegra.Open;
      if qryRegra.IsEmpty
      then begin
         qryRegra.Close;
         tirasql(qryRegra);
         Exit;
      end;
      cAux := DecimalSeparator;
      regraAPrev.QueryIn := dtmConsPart.qryRegra;
      try
         regraAPrev.Execute;
      finally
         DecimalSeparator := cAux;
         iIdCalculoGeral := 0;
      end;
      if not regraAPrev.Error
      then begin
         sResult     := Trim(UpperCase(regraAPrev.Result));
         if sResult  = 'FALSE'
         then Result := False
         else Result := True;
      end // if not regra.error
      else bErro     := True;
      qryRegra.Close;
   end;
end;

procedure TiraSQL( qry : TwwQuery);
begin
   with qry do
   begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT 1 FROM DUAL ');
     Open;
     Close;
   end;
end;

end.
