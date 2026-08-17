(*******************************************************************************
 Analista Responsável: Gustavo Viegas
 - Atualizado em 15/10/2000
*******************************************************************************)

unit FAtend;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cmseldlg, wwidlg, Db, Wwdatsrc, DBCtrls, MAHlpBtn,
  StdCtrls, Buttons,  ComCtrls, ToolWin, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, wwdblook, Mask, MskEdDlg, DBTables, 
  wwdbedit, wwriched,  TB97, TB97Ctls, TB97Tlbr, IvDictio, IvMulti,
  IvEMulti, Menus, CMDBLookupCombo, FCadastroGrid, MontaSelect, Wwdotdot,
  Wwdbcomb, FCadastroCS, fcOutlookList, fcButton, fcImgBtn, fcShapeBtn,
  fcClearPanel, fcButtonGroup, fcOutlookBar, CMProcura, uComum, Wwtable,
  wwdbdatetimepicker, CMDateTimePicker, CmEventosCadastro, ImgList, Wwquery,
  TREdit,Ufiario,UBIBLIOTECA, UConsPart;

type
  TRegAtendimento = Record
     IDATEND: Real;
     IDTIPOATEND: Real;
     CODATEND: Real;
     DATA: TDateTime;
     NOMESOLICITANTE: String;
     TELSOLICITANTE: String;
     CODATENDENTE: String;
     RESPOSTA: String;
     STATUS: String;
     OBSERVACAO: String;
     IDTITULAR: Real;
     IDPESSJUR: Real;
     DATAINICIO: TDateTime;
     LOGRADOURO: String;
     NUMEROSOLIC: String;
     COMPLEMSOLIC: String;
     BAIRROSOLIC: String;
     CEPSOLIC: String;
     CIDADESOLIC: String;
     IDESTADO: Integer;
     PERGUNTA: String;
     COMPLCODATEND: Real;
     IDLOCALATENDXCPU: Real;
     DDISOLIC: String;
     DDDSOLIC: String;
     TIPOSOLIC: String;
     NUMEROTELSOLIC: String;
     IDTELEFONE: Real;
     CODESTADOSOLIC :String;
     IDBENEFICIARIO :Real;
     IDPLANOPREV : Integer;
     sequencia : Integer;
  End;

  TfrmAtend = class(TfrmCadastroCS)
    PgAtend: TPageControl;
    TbShtAtend: TTabSheet;
    TbShtPartic: TTabSheet;
    TbShtBenef: TTabSheet;
    dbgirdbenef: TwwDBGrid;
    TbShtPlanos: TTabSheet;
    dbgridplanass: TwwDBGrid;
    Timer1: TTimer;
    TbShtContrib: TTabSheet;
    dbgridplanprev: TwwDBGrid;
    TbShtProc: TTabSheet;
    dbgridproc: TwwDBGrid;
    dspartprev: TwwDataSource;
    TbShtBenefic: TTabSheet;
    dbgridpartprev: TwwDBGrid;
    dbgridpart: TwwDBGrid;
    TbShtEvent: TTabSheet;
    wwDBGrid2: TwwDBGrid;
    TbShTReserv: TTabSheet;
    wwDBGrid3: TwwDBGrid;
    dsreserva: TwwDataSource;
    PageContrib: TPageControl;
    TbShtContPrev: TTabSheet;
    TbShtContAss: TTabSheet;
    tbhRub: TTabSheet;
    Panel7: TPanel;
    Label32: TLabel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    wwDBGrid1: TwwDBGrid;
    dbgirdcontrib: TwwDBGrid;
    TbsRubs: TTabSheet;
    PagFuncionarios: TPageControl;
    TbShtPes: TTabSheet;
    Panel2: TPanel;
    Splitter1: TSplitter;
    Splitter4: TSplitter;
    Panel4: TPanel;
    dbgridendereco: TwwDBGrid;
    Panel11: TPanel;
    ScrollBox1: TScrollBox;
    Label13: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    dbednomepai: TwwDBEdit;
    dbednomemae: TwwDBEdit;
    dbednatural: TwwDBEdit;
    dbeddatanasc: TwwDBEdit;
    Panel12: TPanel;
    Panel15: TPanel;
    DBGridDepen: TwwDBGrid;
    TbShtFunc: TTabSheet;
    Panel13: TPanel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    lblnomepatro: TLabel;
    Label15: TLabel;
    edsaltotal: TwwDBEdit;
    edcargo: TwwDBEdit;
    eddataadmissao: TwwDBEdit;
    edsitfunc: TwwDBEdit;
    edsalparticip: TwwDBEdit;
    ednomepatro: TwwDBEdit;
    wwDBEdit1: TwwDBEdit;
    Panel14: TPanel;
    dbgridhistfunc: TwwDBGrid;
    MSParticipante: TMontaSelect;
    Panel1: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label39: TLabel;
    edmat: TEdit;
    edcpf: TEdit;
    edinsc: TEdit;
    edPlano: TEdit;
    ednome: TEdit;
    edPatro: TEdit;
    BtnConsultaAtendimento: TBitBtn;
    bb_procparticipante: TBitBtn;
    PageDadosAssunto: TPageControl;
    TbDadosAtend: TTabSheet;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label2: TLabel;
    Label10: TLabel;
    Label9: TLabel;
    Label17: TLabel;
    Label28: TLabel;
    Label40: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label26: TLabel;
    eddlghora: TcmMaskEditDlg;
    eddlghorainicio: TcmMaskEditDlg;
    edtLogradouro: TwwDBEdit;
    edtNumero: TwwDBEdit;
    edtComplem: TwwDBEdit;
    edtbairro: TwwDBEdit;
    edtcep: TwwDBEdit;
    edtcidade: TwwDBEdit;
    dbednomesol: TwwDBEdit;
    dbedtel: TwwDBEdit;
    dbdateInicio: TCMDateTimePicker;
    dbdateFim: TCMDateTimePicker;
    edseq: TwwDBEdit;
    ednum: TwwDBEdit;
    TbsAssuntos: TTabSheet;
    MsResposta: TMontaSelect;
    dbedatend: TEdit;
    GpAnteiror: TGroupBox;
    edcod: TEdit;
    edseque: TEdit;
    TbsGeral: TTabSheet;
    Observacao: TLabel;
    Label25: TLabel;
    MemResposta: TwwDBRichEdit;
    MenPergunta: TwwDBRichEdit;
    Label29: TLabel;
    MemObs: TwwDBRichEdit;
    Dock973: TDock97;
    tb97BotoesDetalhe: TToolbar97;
    sbtnInsDet: TSpeedButton;
    sbtnExcluiDet: TSpeedButton;
    PnlAssunto: TPanel;
    assunto: TLabel;
    Label27: TLabel;
    BtnGetResposta: TBitBtn;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    Dock974: TDock97;
    tb97Detalhe: TToolbar97;
    bbtnOkDet: TBitBtn;
    bbtnCancelarDet: TBitBtn;
    bbtnVoltarDet: TBitBtn;
    QryAssuntoxAtend: TwwQuery;
    QryAssuntoxAtendIDASSUNTOXATEND: TFloatField;
    QryAssuntoxAtendIDASSUNTO: TFloatField;
    QryAssuntoxAtendIDATEND: TFloatField;
    QryAssuntoxAtendIDASSUNTOXRESP: TFloatField;
    QryAssuntoxAtendIDPROCESSO: TFloatField;
    DsAssuntoxAtend: TwwDataSource;
    UpdAssuntoxAtend: TUpdateSQL;
    QryAssuntoxAtendEXISTERAD: TFloatField;
    QryAssuntoxAtendEXISTERUB: TFloatField;
    QryAssuntoxAtendNOME: TStringField;
    qryIDATEND: TFloatField;
    qryIDTIPOATEND: TFloatField;
    qryCODATEND: TFloatField;
    qryDATA: TDateTimeField;
    qryNOMESOLICITANTE: TStringField;
    qryTELSOLICITANTE: TStringField;
    qryCODATENDENTE: TStringField;
    qryRESPOSTA: TStringField;
    qrySTATUS: TStringField;
    qryOBSERVACAO: TStringField;
    qryIDTITULAR: TFloatField;
    qryIDPESSJUR: TFloatField;
    qryDATAINICIO: TDateTimeField;
    qryLOGRADOURO: TStringField;
    qryNUMEROSOLIC: TStringField;
    qryCOMPLEMSOLIC: TStringField;
    qryBAIRROSOLIC: TStringField;
    qryCEPSOLIC: TStringField;
    qryCIDADESOLIC: TStringField;
    qryCOMPLCODATEND: TFloatField;
    qryIDLOCALATENDXCPU: TFloatField;
    qryPERGUNTA: TStringField;
    QryAssuntoxAtendIDTIPOPROCESSO: TFloatField;
    EdtSitCad: TEdit;
    QryAssuntoxAtendIDMODELORUB: TFloatField;
    Panel3: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel19: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    wwDBEdit2: TwwDBEdit;
    Label30: TLabel;
    wwDBEdit3: TwwDBEdit;
    QryAssuntoxAtendAnt: TwwQuery;
    DsAssuntoxAtendAnt: TwwDataSource;
    QryAssuntoxAtendAntIDASSUNTOXATEND: TFloatField;
    QryAssuntoxAtendAntIDASSUNTO: TFloatField;
    QryAssuntoxAtendAntIDATEND: TFloatField;
    QryAssuntoxAtendAntIDASSUNTOXRESP: TFloatField;
    QryAssuntoxAtendAntIDPROCESSO: TFloatField;
    QryAssuntoxAtendAntEXISTERAD: TFloatField;
    QryAssuntoxAtendAntEXISTERUB: TFloatField;
    QryAssuntoxAtendAntNOME: TStringField;
    QryAssuntoxAtendAntIDTIPOPROCESSO: TFloatField;
    QryAssuntoxAtendAntIDMODELORUB: TFloatField;
    BtnAtendAnt: TBitBtn;
    LblAssunto: TLabel;
    MsBeneficiario: TMontaSelect;
    QryAssuntoxAtendAntDESCRESPATEN: TMemoField;
    DBEdit1: TDBEdit;
    ReResposta: TwwDBRichEdit;
    ProcuraFormaAtend: TCMProcura;
    MsFormaAtend: TMontaSelect;
    MsAssunto: TMontaSelect;
    PnlAssuntoAtend: TPanel;
    GrdAssunto: TwwDBGrid;
    Splitter5: TSplitter;
    ReRespostaAux: TwwDBRichEdit;
    QryBuscaResposta: TwwQuery;
    QryBuscaRespostaDESCRESPATEN: TMemoField;
    QryAssuntoxAtendDESCRESPATEN: TMemoField;
    ProcuraAssunto: TCMProcura;
    Splitter3: TSplitter;
    PpmRubsPendentes: TPopupMenu;
    PpmCancela: TMenuItem;
    PpmGera2via: TMenuItem;
    PpmEmite2Via: TMenuItem;
    PpmEmite: TMenuItem;
    Panel6: TPanel;
    Panel26: TPanel;
    Panel24: TPanel;
    GrdDocRecebidos: TwwDBGrid;
    GrdRubPendente: TwwDBGrid;
    Panel25: TPanel;
    Panel5: TPanel;
    GrdRub: TwwDBGrid;
    Panel23: TPanel;
    Splitter2: TSplitter;
    Panel28: TPanel;
    Panel22: TPanel;
    wwDBGrid5: TwwDBGrid;
    Splitter6: TSplitter;
    Splitter7: TSplitter;
    Panel27: TPanel;
    wwDBGrid4: TwwDBGrid;
    Panel30: TPanel;
    Panel29: TPanel;
    wwDBGrid6: TwwDBGrid;
    Panel31: TPanel;
    CkbFiltraPlano: TCheckBox;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Label4: TLabel;
    QryEstado: TwwQuery;
    QryEstadoCODESTADO: TStringField;
    qryIDESTADO: TFloatField;
    tbsTelefone: TTabSheet;
    Label38: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label31: TLabel;
    edtDDI: TwwDBEdit;
    edtDDD: TwwDBEdit;
    edtTipoTelefone: TwwDBEdit;
    edtNumeroTelefone: TwwDBEdit;
    qryDDISOLIC: TStringField;
    qryDDDSOLIC: TStringField;
    qryTIPOSOLIC: TStringField;
    qryNUMEROTELSOLIC: TStringField;
    qryIDTELEFONE: TFloatField;
    qryCODESTADOSOLIC: TStringField;
    edtuf: TwwDBEdit;
    qryIDBENEFICIARIO: TFloatField;
    QryEstadoIDESTADO: TFloatField;
    Label43: TLabel;
    MSKVALORRESERVA: TRealEdit;
    QryAssuntoxAtendAntIDRUB: TFloatField;
    QryAssuntoxAtendIDRUB: TFloatField;
    qryultrub: TwwQuery;
    qryultrubULTRUB: TFloatField;
    TabSheet1: TTabSheet;
    dbgversao: TwwDBGrid;
    dbgpagamento: TwwDBGrid;
    Label44: TLabel;
    Label45: TLabel;
    qryversao: TwwQuery;
    dsversao: TwwDataSource;
    qryversaoIDHSTFOLHABENEF: TFloatField;
    qryversaoMESREFERENCIA: TStringField;
    qryversaoHISTORICO: TStringField;
    qryversaoDATAPREVPAGTO: TDateTimeField;
    qryversaoDATAEFETIVACAO: TDateTimeField;
    dspagamento: TwwDataSource;
    qrypagamento: TwwQuery;
    Button1: TButton;
    qryversaoIDPESSOA: TFloatField;
    edprovento: TRealEdit;
    eddesconto: TRealEdit;
    edliquido: TRealEdit;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    QRYALTRUBS: TwwQuery;
    qryultrubFLGSTATUS: TStringField;
    TabSheet2: TTabSheet;
    dbDataDib: TCMDateTimePicker;
    dbdatademissao: TCMDateTimePicker;
    dbdatarequerimento: TCMDateTimePicker;
    dbDataEvento: TCMDateTimePicker;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    bbnumerobeneficiario: TMaskEdit;
    qrypagamentoDESCRICAO: TStringField;
    qrypagamentoMES: TStringField;
    qrypagamentoVALORPROVENTO: TFloatField;
    qrypagamentoPROVDESC: TStringField;
    qrypagamentoBANCO: TStringField;
    qrypagamentoAGENCIA: TStringField;
    qrypagamentoCONTA: TStringField;
    TabSheet3: TTabSheet;
    ConsPart1: TConsPart;
    procedure Timer1Timer(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure qrydepentitAfterOpen(DataSet: TDataSet);
    procedure PageContribChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmbfilialEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bb_procparticipanteClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure BtnConsultaAtendimentoClick(Sender: TObject);
    procedure BtnGetRespostaClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure dbgridprocDblClick(Sender: TObject);
    procedure BtnAtendAntClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure ProcuraAssuntoValidaDados(Sender: TObject);
    procedure ProcuraAssuntoApertouBotao(Sender: TObject);
    procedure PgAtendChange(Sender: TObject);
    procedure PagFuncionariosChange(Sender: TObject);
    procedure GrdDocRecebidosCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure CkbFiltraPlanoClick(Sender: TObject);
    procedure edtufExit(Sender: TObject);
    Procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeCadastroCancel(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure TabSheet3Enter(Sender: TObject);
  private
    idtitular,idpessjur,idtelefone, IDPESSOA, idbeneficiario, IDPLANOPREV, sequencia: string;
    bNovoAtendimento :Boolean;
    iLinhaFiltro :Integer;
    procedure Selecionar(const IdAtend: LongInt);
    procedure Selecionarfilhas;
    procedure PegaParticipante(Var MsPegaParticipante:TMontaSelect);
    procedure AbrirQryReserva;
    Procedure AtualizaDadosRub;
    procedure AtualizaDetalhe(bAtualiza: Boolean);
    procedure AbreQryAssuntoxAtend;
    procedure BuscaAtendPend(IdTitular :LongInt);
    

  public

  end;

var
  frmAtend: TfrmAtend;

implementation

uses  UDataBase, UGeral,  UAutorizacao, UMensErro, FTelaAut, FConsHistRecEmp,
      USistema, dAtend, dRelCentralAP, Fconsatend, umoduloCap, uRad,
      uFuncaoGeral, uRubs, FAcompProc, dBasedados, uAtendimento;

{$R *.DFM}


procedure TFrmAtend.CmeCadastroInsert(Sender: TObject);
Var
   RegAtendimento :TRegAtendimento;
begin
   CmeCadastro.RepetirInsert := false;
   PgAtend.ActivePage          := TbShtAtend;
   PageDadosAssunto.ActivePage := TbDadosAtend;

   BtnAtendAnt.Tag := 0;
   sbtnInsDet.Visible := True;
   sbtnExcluiDet.Visible := True;
   BtnGetResposta.Visible := True;
   tb97BotoesDetalhe.Visible := True;
   GrdAssunto.DataSource := DsAssuntoxAtend;
   LblAssunto.Caption := 'Assuntos Do Atendimento Corrente';
   LblAssunto.Left := 112;

   If Qry.IsEmpty Or (Application.MessageBox('Deseja Continuar o atendimento ?','Atendimento',Mb_YesNo + Mb_IConQuestion) = Id_No) Then
   Begin
     //Novo Atendimento
     bNovoAtendimento := True;
     If QryAssuntoxAtendAnt.Active Then QryAssuntoxAtendAnt.Close;

     inherited;
     bb_procparticipante.Enabled := True;
     GpAnteiror.Visible          := False;

     if MSParticipante.Executar = MrOk then
     begin
        tag := 0;
        PegaParticipante(MSParticipante);
        qrycodatendente.AsFloat     := Sistema.IdUsuario;
        qryIdPessjur.AsFloat        := StrToFloat(idpessjur);
        qryIdTitular.AsFloat        := StrToFloat(idTitular);
        qryCODATEND.AsFloat         := qryIDATEND.AsFloat;
        qryIDLOCALATENDXCPU.AsFloat := ModuloCap.IdLocaAtendxCpu;
        qryCOMPLCODATEND.AsFloat    := 0;
        If ModuloCap.IdTipoAtend <> 0 Then
           qryIDTIPOATEND.AsFloat := ModuloCap.IdTipoAtend;

        AbreQryAssuntoxAtend;

        BuscaAtendPend(StrToInt(idTitular));
     end
     Else
     Begin
        if MsBeneficiario.Executar = MrOk then
        Begin
            tag := 1;
            PegaParticipante(MsBeneficiario);
            qrycodatendente.AsFloat     := Sistema.IdUsuario;
            qryIdPessjur.AsFloat        := StrToFloat(idpessjur);
            qryIdTitular.AsFloat        := StrToFloat(idTitular);
             qryIdBeneficiario.AsFloat  := StrToFloat(idBeneficiario);
            qryCODATEND.AsFloat         := qryIDATEND.AsFloat;
            qryIDLOCALATENDXCPU.AsFloat := ModuloCap.IdLocaAtendxCpu;
            qryCOMPLCODATEND.AsFloat    := 0;
            If ModuloCap.IdTipoAtend <> 0 Then
               qryIDTIPOATEND.AsFloat := ModuloCap.IdTipoAtend;


            AbreQryAssuntoxAtend;
            BuscaAtendPend(StrToInt(idTitular));
        End
        Else
          bbtnCancelar.Click;
     End;

     edcod.Text                  := '';
     edseque.Text                := '';
   End
   Else
   Begin
     bb_procparticipante.Enabled := False;
     GpAnteiror.Visible          := True;
     bNovoAtendimento            := False;

     With RegAtendimento Do
     Begin
       IDATEND:=          qryIDATEND.AsFloat;
       IDTIPOATEND:=      qryIDTIPOATEND.AsFloat;
       CODATEND:=         qryCODATEND.AsFloat;
       DATA:=             qryDATA.AsDateTime;
       NOMESOLICITANTE:=  qryNOMESOLICITANTE.AsString;
       TELSOLICITANTE:=   qryTELSOLICITANTE.AsString;
       CODATENDENTE:=     qryCODATENDENTE.AsString;
       RESPOSTA:=         qryRESPOSTA.AsString;
       STATUS:=           qrySTATUS.AsString;
       OBSERVACAO:=       qryOBSERVACAO.AsString;
       IDTITULAR:=        qryIDTITULAR.AsFloat;
       IDPESSJUR:=        qryIDPESSJUR.AsFloat;
       DATAINICIO:=       qryDATAINICIO.AsDateTime;
       LOGRADOURO:=       qryLOGRADOURO.AsString;
       NUMEROSOLIC:=      qryNUMEROSOLIC.AsString;
       COMPLEMSOLIC:=     qryCOMPLEMSOLIC.AsString;
       BAIRROSOLIC:=      qryBAIRROSOLIC.AsString;
       CEPSOLIC:=         qryCEPSOLIC.AsString;
       CIDADESOLIC:=      qryCIDADESOLIC.AsString;
       IDESTADO:=         qryIDESTADO.AsInteger;
       PERGUNTA:=         qryPERGUNTA.AsString;
       COMPLCODATEND:=    qryCOMPLCODATEND.AsFloat;
       IDLOCALATENDXCPU:= qryIDLOCALATENDXCPU.AsFloat;
       DDISOLIC:=         qryDDISOLIC.AsString;
       DDDSOLIC:=         qryDDDSOLIC.AsString;
       TIPOSOLIC:=        qryTIPOSOLIC.AsString;
       NUMEROTELSOLIC:=    qryNUMEROTELSOLIC.AsString;
      IDTelefone:=        qryIDTelefone.AsFloat;
      CODESTADOSOLIC:=    qryCODESTADOSOLIC.AsString;
      IDbeneficiario:=     qryIDbeneficiario.AsFloat;
     End;

     Qry.Cancel;
     Qry.Edit;
     qrySTATUS.AsString := 'Concluído';
     Qry.Post;

     With QryAssuntoxAtendAnt Do
     Begin
       If Active Then Close;
       If Not Prepared Then Prepare;
       ParamByName('IDATEND').AsFloat := qryIDATEND.AsFloat;
       Open;
     End;

     Qry.Append;

     CmeCadastro.Operacao := OpInserir;
     CmeCadastro.AtualizaBotoes(self);

     With RegAtendimento Do
     Begin
       qryIDATEND.AsFloat := IDATEND;
       qryCODATEND.AsFloat := CODATEND;
       qryDATA.AsDateTime := Date;
       qryNOMESOLICITANTE.AsString := NOMESOLICITANTE;
       qryTELSOLICITANTE.AsString := TELSOLICITANTE;
       qryCODATENDENTE.AsString := CODATENDENTE;
       qryRESPOSTA.AsString := RESPOSTA;
       qrySTATUS.AsString := STATUS;
       qryOBSERVACAO.AsString := OBSERVACAO;
       qryIDTITULAR.AsFloat := IDTITULAR;
       qryIDPESSJUR.AsFloat := IDPESSJUR;
       qryDATAINICIO.AsDateTime := Date;
       qryLOGRADOURO.AsString := LOGRADOURO;
       qryNUMEROSOLIC.AsString := NUMEROSOLIC;
       qryCOMPLEMSOLIC.AsString := COMPLEMSOLIC;
       qryBAIRROSOLIC.AsString := BAIRROSOLIC;
       qryCEPSOLIC.AsString := CEPSOLIC;
       qryCIDADESOLIC.AsString := CIDADESOLIC;
       qryDDISOLIC.AsString := DDISOLIC;
       qryDDDSOLIC.AsString := DDDSOLIC;
       qryTIPOSOLIC.AsString := TIPOSOLIC;
       qryNUMEROTELSOLIC.AsString := NUMEROTELSOLIC ;
       qryIDTelefone.AsFloat := IDTELEFONE;
       qrycodestadosolic.AsString := CODESTADOSOLIC;
       qryIDbeneficiario.AsFloat := idbeneficiario;
       If IDESTADO <> 0 Then
          qryIDESTADO.AsInteger := IDESTADO
       Else
          qryIDESTADO.Clear;

       qryPERGUNTA.AsString := PERGUNTA;
       qryCOMPLCODATEND.AsFloat := COMPLCODATEND;
       If ModuloCap.IdTipoAtend <> 0 Then
          qryIDTIPOATEND.AsFloat := ModuloCap.IdTipoAtend;

     End;

     eddlghorainicio.text := timetostr(time);
     eddlghora.text := timetostr(time);

     qrycodatendente.AsFloat     := Sistema.IdUsuario;

     qryIDLOCALATENDXCPU.AsFloat := ModuloCap.IdLocaAtendxCpu;

     Selecionarfilhas;

     With dtmAtend.QryCountAtend Do
     Begin
       If Active Then Close;
       If Not Prepared Then Prepare;
       ParamByname('CODATEND').AsFloat := RegAtendimento.CodAtend;
       Open;

       qryCOMPLCODATEND.AsFloat := FieldByName('NUMATEND').AsFloat;

       edcod.Text                  := qryCODATEND.AsString;
       edseque.Text                := FloatToStr(FieldByName('NUMATEND').AsFloat - 1);

       Close;
     End;

     AbreQryAssuntoxAtend;
     BuscaAtendPend(StrToInt(idTitular));
   End;

   BtnAtendAnt.Visible := Not bNovoAtendimento;
end;

procedure TFrmAtend.PegaParticipante(Var MsPegaParticipante:TMontaSelect);
begin
  // Carrega campos da tela
  ednome.Text    := MsPegaParticipante.ValoresChave[0];
  edcpf.Text     := MsPegaParticipante.ValoresChave[1];
  edmat.Text     := MsPegaParticipante.ValoresChave[2];
  edinsc.Text    := MsPegaParticipante.ValoresChave[3];
  edPlano.Text   := MsPegaParticipante.ValoresChave[4];
  edPatro.Text   := MsPegaParticipante.ValoresChave[5];
  idPessjur      := MsPegaParticipante.ValoresChave[6];
  idTitular      := MsPegaParticipante.ValoresChave[7];
  EdtSitCad.Text := MsPegaParticipante.ValoresChave[8];
  idbeneficiario :=  MsPegaParticipante.ValoresChave[9];
   IDPLANOPREV :=  MsPegaParticipante.ValoresChave[10];
   sequencia := MsPegaParticipante.ValoresChave[11];
  PgAtend.activepage := TbShtAtend;

  eddlghorainicio.text := timetostr(time);
  eddlghorainicio.Enabled:=false;
  timer1.enabled := true;

  dbedatend.text := Sistema.NomeUsuario;

  If dbednomesol.CanFocus Then dbednomesol.SetFocus;

  If (CmeCadastro.Operacao = OpInserir) Then
  Begin
    If dtmAtend.QryDadosParticip.Active Then dtmAtend.QryDadosParticip.Close;
    If Not dtmAtend.QryDadosParticip.Prepared Then dtmAtend.QryDadosParticip.Prepare;
    dtmAtend.QryDadosParticip.ParamByName('IDPESSOA').AsFloat := StrToFloat(MsPegaParticipante.ValoresChave[MsPegaParticipante.Tag]);
    dtmAtend.QryDadosParticip.Open;

    qryNOMESOLICITANTE.AsString  := dtmAtend.QryDadosParticipNOME.AsString;
    qryTELSOLICITANTE.AsString   := dtmAtend.QryDadosParticipNUMTEL.AsString;
    qryLOGRADOURO.AsString       := dtmAtend.QryDadosParticipLOGRADOURO.AsString;
    qryNUMEROSOLIC.AsString      := dtmAtend.QryDadosParticipNUMERO.AsString;
    qryCOMPLEMSOLIC.AsString     := dtmAtend.QryDadosParticipCOMPLEMENTO.AsString;
    qryBAIRROSOLIC.AsString      := dtmAtend.QryDadosParticipBAIRRO.AsString;
    qryCEPSOLIC.AsString         := dtmAtend.QryDadosParticipCEP.AsString;
    qryCIDADESOLIC.AsString      := dtmAtend.QryDadosParticipCIDADE.AsString;
    qryDDISOLIC.AsString         := dtmAtend.QryDadosParticipDDI.AsString;
    qryDDDSOLIC.AsString         := dtmAtend.QryDadosParticipDDD.AsString;
    qryTIPOSOLIC.AsString        := dtmAtend.QryDadosParticipTIPO.AsString;
    qryNUMEROTELSOLIC.AsString   := dtmAtend.QryDadosParticipNUMTEL.AsString;
    qrycodestadoSOLIC.AsString   := dtmAtend.QryDadosParticipcodestado.AsString;
     If qryversao.Active Then qryversao.Close;
    If Not qryversao.Prepared Then Qryversao.Prepare;
    qryversao.ParamByName('IDPESSOA').AsFloat := StrToFloat(MsPegaParticipante.ValoresChave[MsPegaParticipante.Tag]);
    qryversao.Open;

    If dtmAtend.QryDadosParticipIDESTADO.IsNull Then
       qryIDESTADO.Clear
    Else
       qryIDESTADO.AsInteger        := dtmAtend.QryDadosParticipIDESTADO.AsInteger;

    qryIdPessjur.AsFloat        := StrToFloat(idpessjur);
    qryIdTitular.AsFloat        := StrToFloat(idTitular);
    qryIdbeneficiario.AsFloat   := StrToFloat(idbeneficiario);

     If dtmAtend.QryDadosParticipIDtelefone.IsNull Then
       qryidTelefone.Clear
    Else
       qryidTelefone.AsFloat        := dtmAtend.QryDadosParticipIDTelefone.AsInteger;

    Selecionarfilhas;

    dtmAtend.QryDadosParticip.Close;
  End;
end;

procedure TFrmAtend.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
  Begin
    Selecionar(StrToInt(MontaSelect.ValoresChave[6]));
    ednome.Text        := MontaSelect.ValoresChave[0];
    edcpf.Text         := MontaSelect.ValoresChave[1];
    edmat.Text         := MontaSelect.ValoresChave[2];
    edinsc.Text        := MontaSelect.ValoresChave[3];
    edPlano.Text       := MontaSelect.ValoresChave[4];
    edPatro.Text       := MontaSelect.ValoresChave[5];
    idpessjur          := MontaSelect.ValoresChave[7];
    idTitular          := MontaSelect.ValoresChave[8];
    EdtSitCad.Text     := MontaSelect.ValoresChave[9];

    dbedatend.text     := dtmAtend.qryusuario.fieldbyname('nomeusuario').AsString;
    If (dbedatend.Text = '') Then dbedatend.text := Sistema.NomeUsuario;

    eddlghorainicio.text := timetostr(time);
    eddlghorainicio.Enabled:=false;
    timer1.enabled := true;

    AbreQryAssuntoxAtend;
  End;
end;

procedure TFrmAtend.Selecionarfilhas;
Begin
  with dtmAtend do
  begin
    With qryusuario Do
    Begin
      If Active Then close;
      If Not Prepared Then Prepare;
      ParamByName('CODATEND').AsFloat := qryCODATEND.AsFloat;
    End;

    With qryscroll Do
    Begin
      If Active Then close;
      If Not Prepared Then Prepare;
      ParamByName('IDTITULAR').AsFloat := qryIDTITULAR.AsFloat;
      ParamByName('IDPESSJUR').AsFloat := qryIDPESSJUR.AsFloat;
    End;

    With qryevent Do
    Begin
      If Active Then close;
      If Not Prepared Then Prepare;
      ParamByName('IDTITULAR').AsFloat := qryIDTITULAR.AsFloat;
      ParamByName('IDPESSJUR').AsFloat := qryIDPESSJUR.AsFloat;
    End;

    With qryplanprev Do
    Begin
      If Active Then close;
      If Not Prepared Then Prepare;
      ParamByName('IDPESSOA').AsFloat := qryIDTITULAR.AsFloat;
      ParamByName('IDPESSJUR').AsFloat := qryIDPESSJUR.AsFloat;
      Open;
    End;

    With qrycontrib Do
    Begin
      If Active Then close;
      If Not Prepared Then Prepare;
      ParamByName('IDTITULAR').AsFloat := qryIDTITULAR.AsFloat;
      ParamByName('IDPESSJUR').AsFloat := qryIDPESSJUR.AsFloat;
    End;

    With qrybenef Do
    Begin
      If Active Then close;
      If Not Prepared Then Prepare;
      ParamByName('IDTITULAR').AsFloat := qryIDTITULAR.AsFloat;
      ParamByName('IDPESSJUR').AsFloat := qryIDPESSJUR.AsFloat;
    End;

    With qrypartprev Do
    Begin
      If Active Then close;
      If Not Prepared Then Prepare;
      ParamByName('IDTITULAR').AsFloat := qryIDTITULAR.AsFloat;
      ParamByName('IDPESSJUR').AsFloat := qryIDPESSJUR.AsFloat;
    End;



    With qryhistfunc Do
    Begin
      If Active Then close;
      If Not Prepared Then Prepare;
      ParamByName('IDTITULAR').AsFloat := qryIDTITULAR.AsFloat;
      ParamByName('IDPESSJUR').AsFloat := qryIDPESSJUR.AsFloat;
    End;

    With qrypartgeral Do
    Begin
      If Active Then close;
      If Not Prepared Then Prepare;
      ParamByName('IDTITULAR').AsFloat := qryIDTITULAR.AsFloat;
      ParamByName('IDPESSJUR').AsFloat := qryIDPESSJUR.AsFloat;
    End;

    With qrydepentit Do
    Begin
      If Active Then close;
      If Not Prepared Then Prepare;
      ParamByName('IDTITULAR').AsFloat := qryIDTITULAR.AsFloat;
    End;

    With qryendereco Do
    Begin
      If Active Then close;
      If Not Prepared Then Prepare;
      ParamByName('IDTITULAR').AsFloat := qryIDTITULAR.AsFloat;
    End;

    With qryplanass Do
    Begin
      If Active Then close;
      If Not Prepared Then Prepare;
      ParamByName('IDTITULAR').AsFloat := qryIDTITULAR.AsFloat;
      ParamByName('IDPESSJUR').AsFloat := qryIDPESSJUR.AsFloat;
    End;

    With qrypart Do
    Begin
      If Active Then close;
      If Not Prepared Then Prepare;
      ParamByName('IDTITULAR').AsFloat := qryIDTITULAR.AsFloat;
      ParamByName('IDPESSJUR').AsFloat := qryIDPESSJUR.AsFloat;
    End;

    With qryprocesso Do
    Begin
      If Active Then close;
      If Not Prepared Then Prepare;
      ParamByName('IDTITULAR').AsFloat := qryIDTITULAR.AsFloat;
    End;

    With qrycontribprev Do
    Begin
      If Active Then close;
      If Not Prepared Then Prepare;
      ParamByName('IDTITULAR').AsFloat := qryIDTITULAR.AsFloat;
      ParamByName('IDPESSJUR').AsFloat := qryIDPESSJUR.AsFloat;
    End;

    FuncaoGeral.FechaQry([qryRubXBeneficio,qryTipoDocRubPendentes,qryRUBpendentes,
                          qryTipoDocXRub, qryRUBpendentesHistorico],false,True);
  End;
End;

procedure TFrmAtend.Selecionar(const IdAtend: LongInt);
begin
  with qry do
  begin
    QRY.Close;
    If Not QRY.Prepared Then QRY.Prepare;
    QRY.Params[0].AsFloat := IdAtend;
    TRY
       QRY.Open;
    EXCEPT
      QRY.OPEN;
    END;
  end;

  If IdAtend <> -1 Then
     Selecionarfilhas
  Else
  Begin
    ednome.text := '';
    edcpf.text := '';
    edinsc.text := '';
    edPlano.text := '';
    edmat.text := '';
    edPatro.text := '';
    eddlghorainicio.text := '';
    eddlghora.text := '';
    edcod.text := '';
    edseque.text := '';
    EdtSitCad.Text := '';
  End;
end;

procedure TfrmAtend.Timer1Timer(Sender: TObject);
begin
  inherited;
  eddlghora.text := timetostr(time);
end;

procedure TfrmAtend.sbtnAlterarClick(Sender: TObject);
begin
  PgAtend.activepage := TbShtAtend;
  inherited;
end;

procedure TfrmAtend.bbtnSairClick(Sender: TObject);
begin
  timer1.enabled := false;
  inherited;
end;

procedure TfrmAtend.qrydepentitAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DBGridDepen.ApplySelected;
end;

procedure TfrmAtend.PageContribChange(Sender: TObject);
begin
  inherited;

  If (PagFuncionarios.ActivePage.PageIndex = 1) And
      (Not dtmAtend.qrycontrib.Active) Then
      dtmAtend.qrycontrib.Open;
end;


procedure TfrmAtend.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
   Fiario.Free;
  FuncaoGeral.FechaQry([
    QryBuscaResposta,
    dtmAtend.qryplanass,
    dtmAtend.qryplanprev,
    dtmAtend.qrycontrib,
    dtmAtend.qrypart,
    dtmAtend.qrybenef,
    dtmAtend.qrypartgeral,
    dtmAtend.qryendereco,
    dtmAtend.qryhistfunc,
    dtmAtend.qrycontribprev,
    dtmAtend.qryprocesso,
    dtmAtend.qrypartprev,
    dtmAtend.qryusuario,
    dtmAtend.qryscroll,
    qry,
    dtmAtend.qryfilial,
    dtmAtend.qrydepentit,
    dtmAtend.qryevent,
    QryAssuntoxAtendAnt,
    dtmAtend.qryreserva],TRUE,FALSE);

  Rad.Free;
end;


procedure TfrmAtend.AbrirQryReserva;
var
   valor : real;
begin
  inherited;
  //Testar
  dtmAtend.qryreserva.Close;
  If Not dtmAtend.qryreserva.Prepared then dtmAtend.qryreserva.Prepare;
  dtmAtend.qryreserva.parambyname('IDPESSJUR').AsFloat := qryIDPESSJUR.AsFloat;
  dtmAtend.qryreserva.parambyname('IDTITULAR').AsFloat := qryIDTITULAR.AsFloat;
  dtmAtend.qryreserva.parambyname('IDPLANOPREV').AsFloat :=  dtmAtend.qryplanprev.FieldByName('idplanoprev').AsFloat;
  dtmAtend.qryreserva.Open;

  valor := 0;
   LABEL43.VISIBLE := TRUE;
   MSKVALORRESERVA.VISIBLE := TRUE;
  With dtmAtend Do
   begin
   Qryreserva.First;
      While Not Qryreserva.Eof Do
         Begin
                 valor := valor + qryreservaVLRATUAL.AsFloat ;
                 Qryreserva.Next;
         end;
         mskvalorreserva.text := FloatToStr(valor);
    end;
end;


procedure TfrmAtend.cmbfilialEnter(Sender: TObject);
begin
  inherited;
  if not dtmAtend.qryfilial.active then
     dtmAtend.qryfilial.open;
end;

procedure TfrmAtend.FormCreate(Sender: TObject);
begin
  inherited;
  Fiario := TFiario.Create;
  iLinhaFiltro := -1;
  Rad  := Trad.Create;

  CmeCadastro.RepetirInsert := false;
  Selecionar(-1);

  PgAtend.ActivePage := TbShtAtend;
  PgAtend.ActivePage          := TbShtAtend;
  PageDadosAssunto.ActivePage := TbDadosAtend;
  
end;

procedure TfrmAtend.bb_procparticipanteClick(Sender: TObject);
begin
  inherited;
  If Qry.State In [DsEdit,DsInsert] Then
  Begin
     if MSParticipante.Executar = MrOk then
        PegaParticipante(MSParticipante)
     Else
        if MsBeneficiario.Executar = MrOk then
           PegaParticipante(MsBeneficiario);
  End;
end;

procedure TfrmAtend.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
     If (Shift = [ssAlt]) Then
       Case Key Of
          VK_F1: PgAtend.ActivePage := TbsRubs;
          VK_F2:
          Begin
              PgAtend.ActivePage         := TbShtPartic;
              PagFuncionarios.ActivePage := TbShtPes;
          End;
          VK_F3:
          Begin
              PgAtend.ActivePage         := TbShtPartic;
              PagFuncionarios.ActivePage := TbShtFunc;
          End;
          VK_F5:
          Begin
              PgAtend.ActivePage         := TbShtContrib;
              PageContrib.ActivePage     := TbShtContPrev;
              PageContribChange(Self);
          End;
          VK_F6:
          Begin
              PgAtend.ActivePage         := TbShtContrib;
              PageContrib.ActivePage     := TbShtContAss;
              PageContribChange(Self);
          End;

          VK_F7:
          Begin
              PgAtend.ActivePage         := TbShtAtend;
              PageDadosAssunto.ActivePage     := TbDadosAtend;
          End;

          VK_F8:
          Begin
              PgAtend.ActivePage              := TbShtAtend;
              PageDadosAssunto.ActivePage     := TbsAssuntos;
          End;

          VK_F9:
          Begin
              PgAtend.ActivePage              := TbShtAtend;
              PageDadosAssunto.ActivePage     := TbsGeral;
          End;

          VK_F10: PgAtend.ActivePage := TbShTReserv;
          VK_F11: PgAtend.ActivePage := TbShtProc;
          VK_F12: PgAtend.ActivePage := tbhRub;
       End
     Else
       Case Key Of
          VK_F2:  PgAtend.ActivePage := TbShtAtend;
          VK_F3:  PgAtend.ActivePage := TbShtPartic;
          VK_F4:  PgAtend.ActivePage := TbShtPlanos;
          VK_F5:  PgAtend.ActivePage := TbShtContrib;
          VK_F6:  PgAtend.ActivePage := TbShtBenef;
          VK_F7:  PgAtend.ActivePage := TbShtBenefic;
          VK_F9:  PgAtend.ActivePage := TbShtEvent;
       End;
     PgAtendChange(Self);
     PagFuncionariosChange(Self);
     PageContribChange(Self); 
end;

procedure TfrmAtend.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  Selecionar(-1);
end;

procedure TfrmAtend.BtnConsultaAtendimentoClick(Sender: TObject);
begin
  inherited;
  If Qry.State In [DsEdit,DsInsert] Then
  Begin
     AbrirForm( frmConsAtend, TfrmConsAtend, false );
     Application.ProcessMessages;
     frmConsAtend.cmbpatroEnter(frmConsAtend.cmbpatro);
     Application.ProcessMessages;
     frmConsAtend.cmbpatro.Text        := edPatro.Text;
     frmConsAtend.cmbpatro.LookupValue := qryIDPESSJUR.AsString;
     frmConsAtend.edmatricula.Text     := edmat.Text;
     frmConsAtend.edcpf.Text           := edcpf.Text;
     frmConsAtend.ednome.Text          := ednome.Text;
     frmConsAtend.edinsc.Text          := edinsc.Text;

     frmConsAtend.bbtnConsultar.Click;
  End;
end;

procedure TfrmAtend.BtnGetRespostaClick(Sender: TObject);
begin
  inherited;

  If ProcuraAssunto.Text = '' Then
     MsgDlg('Obrigatório Indicar o Assunto','Erro',MtError,[MbOk],0)
  Else
  Begin
     MsResposta.Caption := 'Seleciona Resposta Padrão Para o Assunto ' + ProcuraAssunto.Text;
     MsResposta.Filtro.Clear;
     MsResposta.Filtro.Add('ASSUNTOXRESP.IDASSUNTO = ' + QryAssuntoxAtendIDASSUNTO.AsString);
     MsResposta.Filtro.Add('RESPATEND.IDRESPATEND = ASSUNTOXRESP.IDRESPATEND');
     MsResposta.Executar;
     If MsResposta.RetornouValor Then
     Begin
       If QryBuscaResposta.Active Then QryBuscaResposta.Close;
       If Not QryBuscaResposta.Prepared Then QryBuscaResposta.Prepare;
       QryBuscaResposta.Params[0].AsFloat := StrToInt(MsResposta.ValoresChave[2]);
       QryBuscaResposta.Open;

       If QryBuscaResposta.IsEmpty Then
          QryAssuntoxAtendDESCRESPATEN.Clear
       Else
          QryAssuntoxAtendDESCRESPATEN.AsString := QryBuscaRespostaDESCRESPATEN.AsString;

       QryAssuntoxAtendIDASSUNTOXRESP.AsFloat := StrToInt(MsResposta.ValoresChave[0]);
     End
     Else
     Begin
       QryAssuntoxAtendDESCRESPATEN.Clear;
       QryAssuntoxAtendIDASSUNTOXRESP.Clear;
     End;
  End;

end;

Procedure TfrmAtend.AtualizaDadosRub;
Begin
  With dtmAtend Do
  Begin
     With qryTipoDocRubPendentes Do
     Begin
      Close;
      If Not Prepared Then Prepare;
      ParamByName('idpessjur').AsFloat   := qryidpessjur.AsFloat ;
      ParamByName('idTitular').AsFloat   := qryidTitular.AsFloat ;
      ParamByName('idplanoprev').AsFloat := qryplanprev.FieldByName('idplanoprev').AsFloat;
      Open;
     End;

     With qryRUBpendentes Do
     Begin
      Close;
      If Not Prepared Then Prepare;
      ParamByName('idpessjur').AsFloat   := qryidpessjur.AsFloat ;
      ParamByName('idTitular').AsFloat   := qryidTitular.AsFloat ;
      ParamByName('idplanoprev').AsFloat := qryplanprev.FieldByName('idplanoprev').AsFloat;
      Open;
     End;

     With qryRUBpendentesHistorico Do
     Begin
      Close;
      If Not Prepared Then Prepare;
      ParamByName('idpessjur').AsFloat   := qryidpessjur.AsFloat ;
      ParamByName('idTitular').AsFloat   := qryidTitular.AsFloat ;
      ParamByName('idplanoprev').AsFloat := qryplanprev.FieldByName('idplanoprev').AsFloat;
      Open;
     End;

     With qryTpRecebimento Do
     Begin
       Close;
       Open;
     End;

     With qryTpCancelamento Do
     Begin
       Close;
       Open;
     End;

     With QryRubs Do
     Begin
       if Active then Close;
       if Not Prepared then Prepare;
       ParamByName('idpessjur').AsFloat := qryidpessjur.AsFloat ;
       ParamByName('idTitular').AsFloat := qryidTitular.AsFloat ;
       ParamByName('idplanoprev').AsFloat := qryplanprev.FieldByName('idplanoprev').AsFloat;
       Open;
     End;

     qryTipoDocXRub.Close;
     qryTipoDocXRub.Open;

     QryHistRubs.Close;
     QryHistRubs.Open;
  End;
End;

procedure TfrmAtend.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  If Qry.State In [DsEdit,DsInsert] Then
  Begin
    AtualizaDetalhe(True);
    QryAssuntoxAtend.Append;
    QryAssuntoxAtendIDATEND.AsFloat := QryIDATEND.AsFloat;
    QryAssuntoxAtendDESCRESPATEN.Clear;
  End;
end;

procedure TfrmAtend.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
  AtualizaDetalhe(True);
  QryAssuntoxAtend.Edit;
end;

procedure TfrmAtend.sbtnExcluiDetClick(Sender: TObject);
begin
  inherited;
  If Qry.State In [DsEdit,DsInsert] Then
  Begin
    If Application.MessageBox('Confirma a Exclusão ?','Atenção',Mb_YesNo + Mb_IconQuestion) = Id_Yes Then
       QryAssuntoxAtend.Delete;
  End;
end;

procedure TfrmAtend.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  AtualizaDetalhe(False);
  QryAssuntoxAtend.Cancel;
end;

procedure TfrmAtend.AtualizaDetalhe(bAtualiza: Boolean);
begin
  inherited;
  If bAtualiza Then
  Begin
     PnlAssuntoAtend.SendToBack;
     If ProcuraAssunto.CanFocus Then ProcuraAssunto.SetFocus;
  End
  Else
     PnlAssuntoAtend.BringToFront;

  BtnGetResposta.Enabled := bAtualiza;
  sbtnInsDet.Enabled     := Not bAtualiza;
  sbtnExcluiDet.Enabled  := Not bAtualiza;
end;


procedure TfrmAtend.bbtnOkDetClick(Sender: TObject);
begin
  inherited;
  //Valida Assunto
  If (ProcuraAssunto.Valida = VcOk) Then
  Begin
     If QryAssuntoxAtend.State = DsInsert Then
     Begin
        QryAssuntoxAtend.Post;
        sbtnInsDet.Click;
     End
     Else
     Begin
        QryAssuntoxAtend.Post;
        bbtnVoltarDet.Click;
     End;
  End;
end;

procedure TfrmAtend.AbreQryAssuntoxAtend;
Begin
  With QryAssuntoxAtend Do
  Begin
     If Active Then Close;
     If Not Prepared Then Prepare;
     ParamByname('IDATEND').AsFloat := qryIDATEND.AsFloat;
     Open;
  End;
End;

procedure TfrmAtend.CmeCadastroConfirma(Sender: TObject);
Var
  idEndereco, iIdCidade,Idtelefone:LongInt;
  id : integer;
Begin
   Try
      StartTransacao;

      If dtmAtend.QryDadosParticip.Active Then dtmAtend.QryDadosParticip.Close;
      If Not dtmAtend.QryDadosParticip.Prepared Then dtmAtend.QryDadosParticip.Prepare;
      if SELF.tag = 0      then
      dtmAtend.QryDadosParticip.ParamByName('IDPESSOA').AsFloat := qryIDTITULAR.AsFloat
      else
       dtmAtend.QryDadosParticip.ParamByName('IDPESSOA').AsFloat := qryIDBENEFICIARIO.AsFloat;

      dtmAtend.QryDadosParticip.Open;

      //Troca de Endereço
      If ((qryLOGRADOURO.AsString <> dtmAtend.QryDadosParticipLOGRADOURO.AsString) OR
          (qryNUMEROSOLIC.AsString <> dtmAtend.QryDadosParticipNUMERO.AsString) OR
          (qryCOMPLEMSOLIC.AsString <> dtmAtend.QryDadosParticipCOMPLEMENTO.AsString) OR
          (qryBAIRROSOLIC.AsString <> dtmAtend.QryDadosParticipBAIRRO.AsString) OR
          (qryCEPSOLIC.AsString <> dtmAtend.QryDadosParticipCEP.AsString) OR
          (qryNUMEROTELSOLIC.AsString <> dtmAtend.QryDadosParticipNUMTEL.AsString)OR
          (qryDDISOLIC.AsString     <> dtmAtend.QryDadosParticipDDI.AsString) OR
          (qryDDDSOLIC.AsString      <> dtmAtend.QryDadosParticipDDD.AsString) OR
          (qryTIPOSOLIC.AsString      <> dtmAtend.QryDadosParticipTIPO.AsString) OR
          (qryCODESTADOSOLIC.AsString      <> dtmAtend.QryDadosParticipCODESTADO.AsString) OR
          (qryCIDADESOLIC.AsString <> dtmAtend.QryDadosParticipCIDADE.AsString)) And
          (MsgDlg('Deseja alterar o endereço para correspondência do Elegível ou Participante ?', 'Alteração de Dados Cadastrais', mtConfirmation, [mbYes,mbNo],0) = mrYes) Then
      Begin

          Fiario.IdPessoa := strtoint(idbeneficiario);
          Fiario.IdTitular := strtoint(idtitular);
          Fiario.Idusuario :=sistema.idusuario;
          Fiario.Idmodulo :=  19;
          Fiario.Idrubs := 0;
          Fiario.DataInclusao := Date;


          IF (qryLOGRADOURO.AsString <> dtmAtend.QryDadosParticipLOGRADOURO.AsString) or
              (qryNUMEROSOLIC.AsString <> dtmAtend.QryDadosParticipNUMERO.AsString)  or
              (qryCOMPLEMSOLIC.AsString <> dtmAtend.QryDadosParticipCOMPLEMENTO.AsString) or
              (qryBAIRROSOLIC.AsString <> dtmAtend.QryDadosParticipBAIRRO.AsString) or
              (qryCEPSOLIC.AsString <> dtmAtend.QryDadosParticipCEP.AsString)  or
              (qryCODESTADOSOLIC.AsString      <> dtmAtend.QryDadosParticipCODESTADO.AsString) or
              (qryCIDADESOLIC.AsString <> dtmAtend.QryDadosParticipCIDADE.AsString)
                 THEN
             BEGIN
               Fiario.Descricao :=  'Alteracao de Endereco' ;
               Fiario.Inserir;
             END;
          IF  (qryDDISOLIC.AsString     <> dtmAtend.QryDadosParticipDDI.AsString) or
              (qryNUMEROTELSOLIC.AsString <> dtmAtend.QryDadosParticipNUMTEL.AsString) or
              (qryDDDSOLIC.AsString      <> dtmAtend.QryDadosParticipDDD.AsString) or
              (qryTIPOSOLIC.AsString      <> dtmAtend.QryDadosParticipTIPO.AsString) 
               THEN
              BEGIN
               Fiario.Descricao :=  'Alteracao de Telefone ';
               Fiario.Inserir;
             END;


          With dtmAtend Do
          Begin
             If QryBuscaCidade.Active Then QryBuscaCidade.Close;
             QryBuscaCidade.Params[0].AsString := qryCIDADESOLIC.AsString;
             QryBuscaCidade.Open;
             If Not QryBuscaCidade.IsEmpty Then
                iIdCidade := QryBuscaCidadeIDCIDADES.AsInteger;

            If (QryDadosParticipIDENDERECO.IsNull)     Then

             Begin //Inclui Endereço
                idEndereco := LeultRegistro(NIL,'ENDPESS');
                if SELF.tag = 0      then
                     QryInsereEndereco.ParamByName('IDPESSOA').AsFloat := qryIDTITULAR.AsFloat
                else
                    QryInsereEndereco.ParamByName('IDPESSOA').AsFloat := qryIDbeneficiario.AsFloat;


                 IF iIdCidade = 0  then
                       iIdCidade := 1;
                QryInsereEndereco.ParamByName('IDENDERECO').AsFloat := idEndereco;
                QryInsereEndereco.ParamByName('IDCIDADES').AsFloat := iIdCidade;
                QryInsereEndereco.ParamByName('LOGRADOURO').AsString := qryLOGRADOURO.AsString;
                QryInsereEndereco.ParamByName('NUMERO').AsString := qryNUMEROSOLIC.AsString;
                QryInsereEndereco.ParamByName('COMPLEMENTO').AsString := qryCOMPLEMSOLIC.AsString;
                QryInsereEndereco.ParamByName('BAIRRO').AsString := qryBAIRROSOLIC.AsString;
                QryInsereEndereco.ParamByName('CEP').AsString := qryCEPSOLIC.AsString;
                QryInsereEndereco.ParamByName('CODESTADO').AsString := qryCODESTADOSOLIC.AsString;
                QryInsereEndereco.ExecSQL;
                   //iNCLUI TELEFONE
                 IdTELEFONE := LeultRegistro(NIL,'TELENDPESS');
                 QryInsertTelefone.ParamByName('DDD').AsString := qryDDDSOLIC.AsString ;
                 QryInsertTelefone.ParamByName('DDI').AsString := qryDDISOLIC.AsString ;
                 QryInsertTelefone.ParamByName('IDTELEFONE').AsFloat := IDTELEFONE;
                 QryInsertTelefone.ParamByName('IDENDERECO').AsFloat := idEndereco;
                 QryInsertTelefone.ParamByName('NUMERO').AsString := qryNUMEROTELSOLIC.AsString ;
                 QryInsertTelefone.ParamByName('TIPO').AsString := qryTIPOSOLIC.AsString ;
                 QryInsertTelefone.ExecSql;
                 if SELF.tag = 0      then
                     QryAlteraPessoa.ParamByName('IDPESSOA').AsFloat := qryIDTITULAR.AsFloat
                else
                    QryAlteraPessoa.ParamByName('IDPESSOA').AsFloat := qryIDbeneficiario.AsFloat;

                QryAlteraPessoa.ParamByName('IDENDRESIDENCIAL').AsFloat := idEndereco;
                QryAlteraPessoa.ParamByName('IDENDCORRESP').AsFloat := idEndereco;
                QryAlteraPessoa.ExecSql;
                 tag  := 0 ;
             End
             Else //Altera Endereço
             Begin
                 if SELF.tag = 0      then
                     QryAlteraEndereco.ParamByName('IDPESSOA').AsFloat := qryIDTITULAR.AsFloat
                else
                    QryAlteraEndereco.ParamByName('IDPESSOA').AsFloat := qryIDbeneficiario.AsFloat;

                tag  := 0;
                if iIdCidade = 0 then iIdCidade := 1;
                QryAlteraEndereco.ParamByName('IDENDERECO').AsFloat := QryDadosParticipIDENDERECO.AsFloat;
                QryAlteraEndereco.ParamByName('IDCIDADES').AsFloat := iIdCidade;
                QryAlteraEndereco.ParamByName('LOGRADOURO').AsString := qryLOGRADOURO.AsString;
                QryAlteraEndereco.ParamByName('NUMERO').AsString := qryNUMEROSOLIC.AsString;
                QryAlteraEndereco.ParamByName('COMPLEMENTO').AsString := qryCOMPLEMSOLIC.AsString;
                QryAlteraEndereco.ParamByName('BAIRRO').AsString := qryBAIRROSOLIC.AsString;
                QryAlteraEndereco.ParamByName('CEP').AsString := qryCEPSOLIC.AsString;
                QryAlteraEndereco.ParamByName('CODESTADO').AsString := qryCODESTADOSOLIC.AsString;
                QryAlteraEndereco.ExecSQL;
                if dtmAtend.QryDadosParticipNUMTEL.IsNull then
                Begin
                    IdTELEFONE := LeultRegistro(NIL,'TELENDPESS');
                    QryInsertTelefone.ParamByName('DDD').AsString := qryDDDSOLIC.AsString ;
                    QryInsertTelefone.ParamByName('DDI').AsString := qryDDISOLIC.AsString ;
                    QryInsertTelefone.ParamByName('IDTELEFONE').AsFloat := IDTELEFONE;
                    QryInsertTelefone.ParamByName('IDENDERECO').AsFloat := QryDadosParticipIDENDERECO.AsFloat;
                    QryInsertTelefone.ParamByName('NUMERO').AsString := qryNUMEROTELSOLIC.AsString ;
                     QryInsertTelefone.ParamByName('TIPO').AsString := qryTIPOSOLIC.AsString ;
                    QryInsertTelefone.ExecSql;
                end
                else
                begin

                    QryAlteraTelefone.ParamByName('DDD').AsString := qryDDDSOLIC.AsString ;
                    QryAlteraTelefone.ParamByName('DDI').AsString := qryDDISOLIC.AsString ;
                    QryAlteraTelefone.ParamByName('IDTELEFONE').AsFloat := qryIDTELEFONE.AsFloat;
                    QryAlteraTelefone.ParamByName('IDENDERECO').AsFloat := QryDadosParticipIDENDERECO.AsFloat;
                    QryAlteraTelefone.ParamByName('NUMERO').AsString := qryNUMEROTELSOLIC.AsString ;
                    QryAlteraTelefone.ParamByName('TIPO').AsString := qryTIPOSOLIC.AsString ;
                    QryAlteraTelefone.ExecSql;
               End;
             End;
          End;
      End;

      dtmAtend.QryDadosParticip.Close;

      If Trim(dbdateFim.Text) = '' Then dbdateFim.Date :=Date;

      Qry.First;
      While Not Qry.Eof Do
      Begin
         Atendimento.IdAtend := qryIDATEND.AsFloat;
         Atendimento.IdTipoAtend := qryIDTIPOATEND.AsFloat;
         Atendimento.IdTitular := qryIDTITULAR.AsFloat;
         Atendimento.IdPessjur := qryIDPESSJUR.AsFloat;
         Atendimento.ComplCondAtend := qryCOMPLCODATEND.AsFloat;
         Atendimento.IdLocalAtendXCpu := qryIDLOCALATENDXCPU.AsFloat;
         Atendimento.Data := qryDATA.AsDateTime;
         Atendimento.DataInicio := qryDATAINICIO.AsDateTime;
         Atendimento.CodAtend := qryCODATEND.AsString;
         Atendimento.CodAtendente := qryCODATENDENTE.AsString;
         Atendimento.Resposta := qryRESPOSTA.AsString;
         Atendimento.Status := qrySTATUS.AsString;
         Atendimento.Observacao := qryOBSERVACAO.AsString;
         Atendimento.Pergunta := qryPERGUNTA.AsString;
         Atendimento.NomeSolicitante := qryNOMESOLICITANTE.AsString;
         Atendimento.TelSolicitante := qryTELSOLICITANTE.AsString;
         Atendimento.Logradouro := qryLOGRADOURO.AsString;
         Atendimento.NumeroSolic := qryNUMEROSOLIC.AsString;
         Atendimento.ComplemSolic := qryCOMPLEMSOLIC.AsString;
         Atendimento.BairroSolicitante := qryBAIRROSOLIC.AsString;
         Atendimento.CepSolicitante := qryCEPSOLIC.AsString;
         Atendimento.CidadeSolicitante := qryCIDADESOLIC.AsString;
         Atendimento.IdEstado := QryIdEstado.AsInteger;
         Atendimento.CODESTADOSOLICITANTE := qryCODESTADOSOLIC.AsString;

         If qryIDATEND.AsFloat > 0 Then
            Atendimento.Edit
         Else
            Atendimento.Insert;

         Qry.Next;
      End;

      QryAssuntoxAtend.First;
      While Not QryAssuntoxAtend.Eof Do
      Begin
        //Gera Rad
        If (Sistema.UsaRAD) And
           (Not QryAssuntoxAtendIDTIPOPROCESSO.isNull) And
           (QryAssuntoxAtendIDPROCESSO.IsNull) Then
        Begin
           rad.TipoProcesso          := QryAssuntoxAtendIDTIPOPROCESSO.AsInteger;
           rad.IdPessoa              := Sistema.IdEmpresa;
           rad.IdPessResp            := qryIDTITULAR.AsInteger;
           rad.OBS                   := Trim(Copy(' Atendimento Nº: ' + qryIDATEND.AsString + ' Complemento: ' + qryCOMPLCODATEND.AsString + (#13+#10) +
                                                  ' Assunto: ' + ProcuraAssunto.Text +
                                                  ' Atendente: ' + dbedatend.Text +
                                                  ' Solicitante: ' + dbednomesol.Text +
                                                  ' Elegível ou Participante: ' + ednome.Text,1,200));
           QryAssuntoxAtend.Edit;
           QryAssuntoxAtendIDPROCESSO.AsFloat   := rad.IniciarProcesso;
           QryAssuntoxAtend.Post;

           MsgDlg('Foi Iniciado o processo no RAD número: ' + QryAssuntoxAtendIDPROCESSO.AsString,'Atenção',mtInformation,[mbOk],0);
        End
        Else
        Begin
           QryAssuntoxAtend.Edit;
           QryAssuntoxAtendIDPROCESSO.Clear;
           QryAssuntoxAtend.Post;
        End;

        //Insere o Assunto do Atendimento Atendimento
        Atendimento.Assuntos.IdAssuntoxAtend := QryAssuntoxAtendIDASSUNTOXATEND.AsFloat;
        Atendimento.Assuntos.IdAssunto := QryAssuntoxAtendIDASSUNTO.AsFloat;
        Atendimento.Assuntos.IdAssuntoxResposta := QryAssuntoxAtendIDASSUNTOXRESP.AsFloat;
        Atendimento.Assuntos.IdProcesso := QryAssuntoxAtendIDPROCESSO.AsFloat;
        Atendimento.Assuntos.Insert;

        //Gera Rub fiario
        if (QryAssuntoxAtendEXISTERUB.AsFloat > 0) Then
        Begin
          Rubs.FormCaption := 'Assunto: ' + QryAssuntoxAtendNOME.AsString;
          Rubs.IdAssuntoxAtend := Atendimento.Assuntos.IdAssuntoxAtend;


          Rubs.Execute;
          If Qryultrub.Active Then Qryultrub.Close;
            qryultrub.open;

         IF  qryultrubFLGSTATUS.ASSTRING = '0' THEN
             BEGIN
              Fiario.IdPessoa := strtoint(idbeneficiario);
              Fiario.IdTitular := strtoint(idtitular);
              Fiario.Idusuario :=sistema.idusuario;
              Fiario.Idmodulo :=  19;
              Fiario.Idrubs := qryultrubultrub.ASinteger;
              Fiario.Descricao :=  'Geração de Rub referente ao  '+qryassuntoxAtendnome.AsString;
              Fiario.DataInclusao := Date;
              Fiario.Inserir;
              With QRYALTRUBS Do
               Begin
                 ParamByName('IDRUBS').AsINTEGER := qryultrubultrub.ASinteger;
                 ParamByName('FLGSTATUS').AsString := '1';

                 ExecSql;
              END;
         END;
          QryAssuntoxAtend.Edit;
          QryAssuntoxAtendEXISTERUB.AsFloat := -1;
          QryAssuntoxAtend.Post;
        End;

        QryAssuntoxAtend.Next;
      End;

      Atendimento.Data := StrToDateTime(dbdateFim.Text + ' ' + eddlghora.Text);
      Atendimento.DataInicio :=StrToDateTime(dbdateInicio.Text + ' ' + eddlghorainicio.Text);
      Atendimento.Status := ModuloCap.GetStatusAtend(bNovoAtendimento);
      Atendimento.Edit;

      CommitTransacao;

      FuncaoGeral.FechaQry([Qry,QryAssuntoxAtend],false,true);
      Qry.Open;
      QryAssuntoxAtend.Open;
   Except
      RollbackTransacao;
      MsgDlg('Erro Ao Confirmar Atendimento','Atenção',mtError,[mbOk],0);
      Raise;
   End;

   Selecionar(-1);

   CmeCadastro.AtualizaBotoes(Self);

   AbreQryAssuntoxAtend;

   BtnAtendAnt.Tag := 0;
   sbtnInsDet.Visible := False;
   sbtnExcluiDet.Visible := True;
   BtnGetResposta.Visible := True;
   tb97BotoesDetalhe.Visible := True;
   GrdAssunto.DataSource := DsAssuntoxAtend;
   LblAssunto.Caption := 'Assuntos Do Atendimento Corrente';
   LblAssunto.Left := 112;
End;

procedure TfrmAtend.CmeCadastroCancel(Sender: TObject);
Begin
  Inherited;
  If QryAssuntoxAtend.Active And QryAssuntoxAtend.UpdatesPending Then
     QryAssuntoxAtend.cancelUpdates;

  qry.Close;
  qry.Open;

  AbreQryAssuntoxAtend;
End;

Procedure TfrmAtend.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
Begin
   Accept := False;

   If QryAssuntoxAtend.State In [DsEdit,DsInsert] Then
     bbtnCancelarDet.Click;

   if dbednomesol.Text = ''  then
    begin
       MsgDlg('Favor informar o solicitante!','Atenção',mtError,[mbOk],0);
       If dbednomesol.CanFocus Then dbednomesol.SetFocus;
       exit;
    end;
  if dbdateInicio.Text = ''  then
    begin
       MsgDlg('Favor informar a Data Inicio!','Atenção',mtError,[mbOk],0);
       If dbdateInicio.CanFocus Then dbdateInicio.SetFocus;
       exit;
    end;
  if dbdateInicio.Text > dbdateFim.Text  then
    begin
       MsgDlg('Data Inicial maior que a Final!','Atenção',mtError,[mbOk],0);
       If dbdateInicio.CanFocus Then dbdateInicio.SetFocus;
       exit;
    end;
   if edtLogradouro.Text = ''  then
    begin
       MsgDlg('Favor informar o logradouro do solicitante!','Atenção',mtError,[mbOk],0);
       If edtLogradouro.CanFocus Then edtLogradouro.SetFocus;
       exit;
    end;

   if edtbairro.Text = ''  then
    begin
       MsgDlg('Favor informar o bairro do endereço do solicitante!','Atenção',mtError,[mbOk],0);
       If edtbairro.CanFocus Then edtbairro.SetFocus;
       exit;
    end;

   if edtcep.Text = ''  then
    begin
       MsgDlg('Favor informar o CEP do endereço do solicitante!','Atenção',mtError,[mbOk],0);
       If edtcep.CanFocus Then edtcep.SetFocus;
       exit;
    end;

   if edtcidade.Text = ''  then
    begin
       MsgDlg('Favor informar a Cidade do endereço do solicitante!','Atenção',mtError,[mbOk],0);
       If edtcidade.CanFocus Then edtcidade.SetFocus;
       exit;
    end;

   if edtuf.Text = ''  then
    begin
       MsgDlg('Favor informar o Estado do endereço do solicitante!','Atenção',mtError,[mbOk],0);
       If edtuf.CanFocus Then edtuf.SetFocus;
       exit;
    end;

   if (ProcuraFormaAtend.Valida <> VcOk) then
      begin
        If ProcuraFormaAtend.CanFocus Then ProcuraFormaAtend.SetFocus;
        exit;
      end;

   if QryAssuntoxAtend.IsEmpty then
      begin
        MsgDlg('Favor informar o Assunto!','Atenção',mtError,[mbOk],0);
        If ProcuraAssunto.CanFocus Then ProcuraAssunto.SetFocus;
        exit;
      end;

   Accept := True;
End;

procedure TfrmAtend.CmeCadastroAtualizaBotoes(Sender: TObject);
Begin
  Inherited;
  pnlFundo.Enabled := True;
  sbtnProcurar.Enabled := Not (CmeCadastro.Operacao In [OpInserir,Opalterar])
End;

procedure TfrmAtend.dbgridprocDblClick(Sender: TObject);
begin
  inherited;
  With dtmAtend Do
  Begin
     If Not qryprocesso.IsEmpty Then
     Begin
        Application.CreateForm(TFrmAcompProc,FrmAcompProc);

        FrmAcompProc.sTipoProc := qryprocessoTIPOPROCESSO.AsString;
        FrmAcompProc.sObs      := Trim(Copy(' Atendimento Nº: ' + qryCODATEND.AsString + ' Complemento: ' + qryCOMPLCODATEND.AsString + (#13+#10) +
                                               ' Assunto: ' + ProcuraAssunto.Text +
                                               ' Atendente: ' + dbedatend.Text +
                                               ' Solicitante: ' + dbednomesol.Text +
                                               ' Elegível ou Participante: ' + ednome.Text,1,200));
        FrmAcompProc.iNumProc  := qryprocessoIDPROCESSO.AsInteger;
        FrmAcompProc.sPessoa   := ednome.Text;
        FrmAcompProc.sDoc      := edmat.Text;
        FrmAcompProc.sUsuario  := Sistema.NomeUsuario;
        FrmAcompProc.ShowModal;
     End;
  End;
end;

procedure TfrmAtend.BtnAtendAntClick(Sender: TObject);
begin
  inherited;
  Case BtnAtendAnt.Tag of
  0:
  Begin
    BtnAtendAnt.Tag := 1;
    sbtnInsDet.Visible := False;
    sbtnExcluiDet.Visible := False;
    BtnGetResposta.Visible := False;
    GrdAssunto.DataSource := DsAssuntoxAtendAnt;
    ReRespostaAux.DataSource := DsAssuntoxAtendAnt;
    LblAssunto.Caption := 'Assuntos Do Atendimento Anterior';
    LblAssunto.Left := 37;
  End;
  1:
  Begin
    BtnAtendAnt.Tag := 0;
    sbtnInsDet.Visible := True;
    sbtnExcluiDet.Visible := True;
    BtnGetResposta.Visible := True;
    tb97BotoesDetalhe.Visible := True;
    GrdAssunto.DataSource := DsAssuntoxAtend;
    ReRespostaAux.DataSource := DsAssuntoxAtend;
    LblAssunto.Caption := 'Assuntos Do Atendimento Corrente';
    LblAssunto.Left := 112;
  End;
  End;
end;

procedure TfrmAtend.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  AtualizaDetalhe(False);
  QryAssuntoxAtend.Cancel;
end;

procedure TfrmAtend.BuscaAtendPend(IdTitular :LongInt);
Begin
  If FazQuery(DtmbaseDados.Qry,'SELECT IDATEND FROM ATEND WHERE (STATUS = ''Pendente'') AND (IDTITULAR = ' + IntToStr(IdTitular) + ')' ) Then
     Application.MessageBox('Existem atendimentos pendentes para este Titular. ','Atendimento',Mb_IconInformation);
End;

procedure TfrmAtend.ProcuraAssuntoValidaDados(Sender: TObject);
begin
  inherited;
  If (ActiveControl <> nil) And
     (ActiveControl.Tag <> 9) Then
  Begin
    If (QryAssuntoxAtend.State In [DsEdit, DsInsert]) And
   (MsAssunto.RetornouValor) Then
    Begin
      If (ProcuraAssunto.Valida <> VcOk) Then
      Begin
         If ProcuraAssunto.CanFocus Then ProcuraAssunto.SetFocus
      End
      Else
      Begin
         If (MsAssunto.ValoresChave[2] = '') Then
         Begin
            QryAssuntoxAtendEXISTERUB.AsFloat := 0;
            QryAssuntoxAtendIDMODELORUB.AsFloat := 0;
         End
         Else
         Begin
             QryAssuntoxAtendEXISTERUB.AsFloat := 1;
             QryAssuntoxAtendIDMODELORUB.AsFloat := StrToFloat(MsAssunto.ValoresChave[2]);
         End;

         If (MsAssunto.ValoresChave[1] = '') Then
         Begin
            QryAssuntoxAtendIDTIPOPROCESSO.Clear;
            QryAssuntoxAtendEXISTERAD.AsINTEGER := 0;
         End
         Else
         Begin
            QryAssuntoxAtendIDTIPOPROCESSO.AsFloat := StrToFloat(MsAssunto.ValoresChave[1]);
            QryAssuntoxAtendEXISTERAD.AsINTEGER := 1;
         End;

         QryAssuntoxAtendNOME.AsString := ProcuraAssunto.Text;

         BtnGetResposta.Enabled := FazQuery(DtmbaseDados.Qry,'SELECT IDRESPATEND FROM ASSUNTOXRESP WHERE IDASSUNTO = ' + QryAssuntoxAtendIdAssunto.AsString);
      End;
    End;
  End;
end;

procedure TfrmAtend.ProcuraAssuntoApertouBotao(Sender: TObject);
begin
  inherited;
  QryAssuntoxAtendDESCRESPATEN.Clear;
end;

procedure TfrmAtend.PgAtendChange(Sender: TObject);
begin
  inherited;
  LABEL43.VISIBLE := FALSE;
  MSKVALORRESERVA.VISIBLE := FALSE;
  With dtmAtend Do
  Begin
    Case PgAtend.ActivePage.PageIndex of
      1:
      Begin
        If Not qrypartgeral.Active Then qrypartgeral.Open;
        If Not qryendereco.Active  Then qryendereco.Open;
        If Not qrydepentit.Active  Then qrydepentit.Open;
      End;
      2:
      Begin
        If Not qryplanprev.Active Then qryplanprev.Open;
        If Not qryplanass.Active  Then qryplanass.Open;
      End;
      3: If Not qrycontribprev.Active Then qrycontribprev.Open;
      4: If Not Qrybenef.Active Then Qrybenef.Open;
      5:
      Begin
        If Not Qrypartprev.Active Then Qrypartprev.Open;
        If Not QryPart.Active Then QryPart.Open;
      End;
      6: If Not qryevent.Active Then qryevent.Open;
      7: AbrirQryReserva;
      8: If Not qryprocesso.Active Then qryprocesso.Open;
      9,10: If Not qryRubXBeneficio.Active Then AtualizaDadosRub;
    End;
  End;
end;

procedure TfrmAtend.PagFuncionariosChange(Sender: TObject);
begin
  inherited;

  If PagFuncionarios.ActivePage.PageIndex = 1 Then
  Begin
    With dtmAtend Do
    Begin
      If Not qrypartgeral.Active Then qrypartgeral.Open;
      If Not qryhistfunc.Active  Then qryhistfunc.Open;
    End;
  End;
end;

procedure TfrmAtend.GrdDocRecebidosCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  If Field.FieldName = 'FLGRECEBIDO' Then  ABrush.Color := $00C6FFFF; 
end;

procedure TfrmAtend.CkbFiltraPlanoClick(Sender: TObject);
begin
  inherited;
  If CkbFiltraPlano.Checked Then
     iLinhaFiltro := MsAssunto.Filtro.Add('(ASSUNTO.IDPLANOPREV = ' + DtmAtend.qryplanprev.FieldByName('idplanoprev').AsString + ' OR ASSUNTO.IDPLANOPREV IS NULL)')
  Else
     If iLinhaFiltro >= 0 Then  MsAssunto.Filtro.Delete(iLinhaFiltro);
end;

procedure TfrmAtend.edtufExit(Sender: TObject);
begin
  QryESTADO.ACTIVE := FALSE;
end;

procedure TfrmAtend.Button1Click(Sender: TObject);
var
provento,desconto,liquido : Real;
begin
  inherited;
  If qrypagamento.Active Then qrypagamento.Close;
    If Not qrypagamento.Prepared Then Qrypagamento.Prepare;
    qrypagamento.ParamByName('IDPESSOA').Asinteger := qryversaoidpessoa.AsINTEGER ;
    qrypagamento.ParamByName('IDHSTFOLHABENEF').AsINTEGER  := qryversaoIDHSTFOLHABENEF.AsINTEGER ;
    qrypagamento.Open;
    qrypagamento.First;
    provento := 0;
    desconto := 0;
    liquido := 0;
    While Not Qrypagamento.Eof Do
             Begin
                 if qrypagamentoProvdesc.AsString = 'Provento'  Then
                   begin
                     provento := provento + qrypagamentoValorProvento.ASFloat;
                  end;
                  if qrypagamentoProvdesc.ASString = 'Desconto' Then
                   begin
                     desconto := desconto + qrypagamentoValorProvento.ASFloat;
                  end;

                 Qrypagamento.Next;
             End;
    liquido := provento - desconto;
    edprovento.text := floattostr(provento);
    eddesconto.text := floattostr(desconto);
    edliquido.text := floattostr(liquido);
             
end;

procedure TfrmAtend.TabSheet3Enter(Sender: TObject);
begin
  inherited;
  ConsPart1.sIdPessoa    := IDBENEFICIARIO;
    ConsPart1.sIdPessjur   := IDPESSJUR;
    ConsPart1.sIdPlanoprev := IDPLANOPREV;
    ConsPart1.sSeqProposta := sequencia;
    ConsPart1.DataBaseName := 'BaseDados';
    ConsPart1.MostraConsulta;
end;

end.


