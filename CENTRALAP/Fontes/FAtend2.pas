 (*******************************************************************************
 Analista Responsável: Gustavo Viegas
 - Atualizado em 15/10/2000
 - Atualizado em SET/2001 - Flavio Dias (FDIAS) (FCRT)
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
  TREdit,Ufiario,UBIBLIOTECA, UConsPart, CheckLst;

type
  TRegAtendimento = Record
     IDATEND            : Real;
     IDTIPOATEND        : Real;
     CODATEND           : Real;
     DATA               : TDateTime;
     NOMESOLICITANTE    : String;
     TELSOLICITANTE     : String;
     CODATENDENTE       : String;
     RESPOSTA           : String;
     STATUS             : String;
     OBSERVACAO         : String;
     IDTITULAR          : Real;
     IDPESSJUR          : Real;
     DATAINICIO         : TDateTime;
     LOGRADOURO         : String;
     NUMEROSOLIC        : String;
     COMPLEMSOLIC       : String;
     BAIRROSOLIC        : String;
     CEPSOLIC           : String;
     CIDADESOLIC        : String;
     IDESTADO           : Integer;
     PERGUNTA           : String;
     COMPLCODATEND      : Real;
     IDLOCALATENDXCPU   : Real;
     DDISOLIC           : String;
     DDDSOLIC           : String;
     TIPOSOLIC          : String;
     NUMEROTELSOLIC     : String;
     IDTELEFONE         : Real;
     CODESTADOSOLIC     : String;
     IDBENEFICIARIO     : Real;
     IDPLANOPREV        : Integer;
     sequencia          : Integer;
  End;

  TfrmAtend = class(TfrmCadastroCS)
    PgAtend             : TPageControl;
    TbShtAtend          : TTabSheet;
    Timer1              : TTimer;
    dspartprev          : TwwDataSource;
    dsreserva           : TwwDataSource;
    MSParticipante      : TMontaSelect;
    Panel1              : TPanel;
    Label11             : TLabel;
    Label12             : TLabel;
    Label7              : TLabel;
    Label8              : TLabel;
    Label39             : TLabel;
    edmat               : TEdit;
    edcpf               : TEdit;
    edinsc              : TEdit;
    edPlano             : TEdit;
    ednome              : TEdit;
    edPatro                : TEdit;
    BtnConsultaAtendimento : TBitBtn;
    bb_procparticipante : TBitBtn;
    PageDadosAssunto    : TPageControl;
    TbDadosAtend        : TTabSheet;
    Label2              : TLabel;
    Label20             : TLabel;
    Label21             : TLabel;
    Label22             : TLabel;
    Label23             : TLabel;
    Label24             : TLabel;
    Label26             : TLabel;
    edtLogradouro       : TwwDBEdit;
    edtNumero           : TwwDBEdit;
    edtComplem          : TwwDBEdit;
    edtbairro           : TwwDBEdit;
    edtcep              : TwwDBEdit;
    dbednomesol         : TwwDBEdit;
    TbsAssuntos         : TTabSheet;
    MsResposta          : TMontaSelect;
    GpAnteiror          : TGroupBox;
    edcod               : TEdit;
    edseque             : TEdit;
    TbsGeral            : TTabSheet;
    Observacao          : TLabel;
    Label25             : TLabel;
    MemResposta         : TwwDBRichEdit;
    MenPergunta         : TwwDBRichEdit;
    Label29             : TLabel;
    MemObs              : TwwDBRichEdit;
    Dock973             : TDock97;
    tb97BotoesDetalhe   : TToolbar97;
    sbtnInsDet          : TSpeedButton;
    sbtnExcluiDet       : TSpeedButton;
    PnlAssunto          : TPanel;
    assunto             : TLabel;
    Label27             : TLabel;
    BtnGetResposta      : TBitBtn;
    DBCheckBox1         : TDBCheckBox;
    DBCheckBox2         : TDBCheckBox;
    Dock974             : TDock97;
    tb97Detalhe         : TToolbar97;
    bbtnOkDet           : TBitBtn;
    bbtnCancelarDet     : TBitBtn;
    bbtnVoltarDet       : TBitBtn;
    QryAssuntoxAtend    : TwwQuery;
    QryAssuntoxAtendIDASSUNTOXATEND: TFloatField;
    QryAssuntoxAtendIDASSUNTO: TFloatField;
    QryAssuntoxAtendIDATEND: TFloatField;
    QryAssuntoxAtendIDASSUNTOXRESP: TFloatField;
    QryAssuntoxAtendIDPROCESSO: TFloatField;
    DsAssuntoxAtend     : TwwDataSource;
    UpdAssuntoxAtend    : TUpdateSQL;
    QryAssuntoxAtendEXISTERAD: TFloatField;
    QryAssuntoxAtendEXISTERUB: TFloatField;
    QryAssuntoxAtendNOME: TStringField;
    qryIDATEND          : TFloatField;
    qryIDTIPOATEND      : TFloatField;
    qryCODATEND         : TFloatField;
    qryDATA             : TDateTimeField;
    qryNOMESOLICITANTE  : TStringField;
    qryTELSOLICITANTE   : TStringField;
    qryCODATENDENTE     : TStringField;
    qryRESPOSTA         : TStringField;
    qrySTATUS           : TStringField;
    qryOBSERVACAO       : TStringField;
    qryIDTITULAR        : TFloatField;
    qryIDPESSJUR        : TFloatField;
    qryDATAINICIO       : TDateTimeField;
    qryLOGRADOURO       : TStringField;
    qryNUMEROSOLIC      : TStringField;
    qryCOMPLEMSOLIC     : TStringField;
    qryBAIRROSOLIC      : TStringField;
    qryCEPSOLIC         : TStringField;
    qryCIDADESOLIC      : TStringField;
    qryCOMPLCODATEND    : TFloatField;
    qryIDLOCALATENDXCPU : TFloatField;
    qryPERGUNTA         : TStringField;
    QryAssuntoxAtendIDTIPOPROCESSO: TFloatField;
    EdtSitCad           : TEdit;
    QryAssuntoxAtendIDMODELORUB: TFloatField;
    QryAssuntoxAtendAnt : TwwQuery;
    DsAssuntoxAtendAnt  : TwwDataSource;
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
    BtnAtendAnt         : TBitBtn;
    LblAssunto          : TLabel;
    MsBeneficiario      : TMontaSelect;
    QryAssuntoxAtendAntDESCRESPATEN: TMemoField;
    DBEdit1             : TDBEdit;
    ReResposta          : TwwDBRichEdit;
    MsFormaAtend        : TMontaSelect;
    MsAssunto           : TMontaSelect;
    PnlAssuntoAtend     : TPanel;
    GrdAssunto          : TwwDBGrid;
    Splitter5           : TSplitter;
    ReRespostaAux       : TwwDBRichEdit;
    QryBuscaResposta    : TwwQuery;
    QryBuscaRespostaDESCRESPATEN: TMemoField;
    QryAssuntoxAtendDESCRESPATEN: TMemoField;
    ProcuraAssunto      : TCMProcura;
    PpmRubsPendentes    : TPopupMenu;
    PpmCancela          : TMenuItem;
    PpmGera2via         : TMenuItem;
    PpmEmite2Via        : TMenuItem;
    PpmEmite            : TMenuItem;
    CkbFiltraPlano      : TCheckBox;
    Bevel1              : TBevel;
    Bevel2              : TBevel;
    Bevel3              : TBevel;
    Label4              : TLabel;
    QryEstado           : TwwQuery;
    QryEstadoCODESTADO  : TStringField;
    qryIDESTADO         : TFloatField;
    tbsDadosParticip    : TTabSheet;
    qryDDISOLIC         : TStringField;
    qryDDDSOLIC         : TStringField;
    qryTIPOSOLIC        : TStringField;
    qryNUMEROTELSOLIC   : TStringField;
    qryIDTELEFONE       : TFloatField;
    qryCODESTADOSOLIC   : TStringField;
    qryIDBENEFICIARIO   : TFloatField;
    QryEstadoIDESTADO   : TFloatField;
    QryAssuntoxAtendAntIDRUB: TFloatField;
    QryAssuntoxAtendIDRUB: TFloatField;
    qryultrub           : TwwQuery;
    qryultrubULTRUB     : TFloatField;
    QRYALTRUBS          : TwwQuery;
    qryultrubFLGSTATUS  : TStringField;
    tbShtSimulaBenef    : TTabSheet;
    dbDataDib           : TCMDateTimePicker;
    dbdatademissao      : TCMDateTimePicker;
    dbdatarequerimento  : TCMDateTimePicker;
    dbDataEvento        : TCMDateTimePicker;
    Label49             : TLabel;
    Label50             : TLabel;
    Label51             : TLabel;
    Label52             : TLabel;
    Label53             : TLabel;
    Label54             : TLabel;
    Label55             : TLabel;
    bbnumerobeneficiario: TMaskEdit;
    qryTipoAtend        : TwwQuery;
    dsTipoAtend         : TwwDataSource;
    qryCidades          : TwwQuery;
    dblkCidade          : TwwDBLookupCombo;
    qryUF               : TwwQuery;
    dblkEstado          : TwwDBLookupCombo;
    tbbConsultaParticip : TToolbarButton97;
    ConsPart1           : TConsPart;
    Label38             : TLabel;
    edtDDI              : TwwDBEdit;
    edtDDD              : TwwDBEdit;
    Label41             : TLabel;
    edtNumeroTelefone   : TwwDBEdit;
    Label31             : TLabel;
    pnlDadosAtendimento : TPanel;
    Label3              : TLabel;
    dblkTipoAtendimento : TwwDBLookupCombo;
    Label28             : TLabel;
    dbdateInicio        : TCMDateTimePicker;
    dbdateFim           : TCMDateTimePicker;
    Label1              : TLabel;
    Label40             : TLabel;
    eddlghorainicio     : TcmMaskEditDlg;
    Label6              : TLabel;
    eddlghora           : TcmMaskEditDlg;
    Label9              : TLabel;
    ednum               : TwwDBEdit;
    Label17             : TLabel;
    edseq               : TwwDBEdit;
    dbedatend           : TEdit;
    Label5              : TLabel;
    Label30             : TLabel;
    wwDBEdit3           : TwwDBEdit;
    GroupBox4           : TGroupBox;
    chkTipoTelefone     : TCheckListBox;
    pgCtrlDadosParticip : TPageControl;
    tbsEnderecos        : TTabSheet;
    tbsTelefones        : TTabSheet;
    Dock975             : TDock97;
    Toolbar972          : TToolbar97;
    tbbInsEndereco      : TToolbarButton97;
    tbbAltEndereco      : TToolbarButton97;
    tbbExcEndereco      : TToolbarButton97;
    pnlEnderecos        : TPanel;
    dbEnderecos         : TwwDBGrid;
    dsEnderecos         : TwwDataSource;
    qryEnderecos        : TwwQuery;
    Dock976             : TDock97;
    Toolbar973          : TToolbar97;
    tbbIncTelefone      : TToolbarButton97;
    tbbAltTelefone      : TToolbarButton97;
    tbbExcTelefone      : TToolbarButton97;
    pnlTelefone         : TPanel;
    dbTelefone          : TwwDBGrid;
    qryTelefones        : TwwQuery;
    dsTelefone          : TwwDataSource;
    updTelefones        : TUpdateSQL;
    updEnderecos        : TUpdateSQL;
    tbsContaCorrente    : TTabSheet;
    qryParam            : TwwQuery;
    Dock977             : TDock97;
    Toolbar974          : TToolbar97;
    tbbIncContaCorrente : TToolbarButton97;
    tbbAltContaCorrente : TToolbarButton97;
    tbbExcContaCorrente : TToolbarButton97;
    pnlContasCorrentes  : TPanel;
    wwDBGrid1           : TwwDBGrid;
    updContaCorrente    : TUpdateSQL;
    dsContaCorrente     : TwwDataSource;
    qryContaCorrente    : TwwQuery;
    procedure Timer1Timer(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmbfilialEnter(Sender: TObject);
    procedure dbgridempDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bb_procparticipanteClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure BtnConsultaAtendimentoClick(Sender: TObject);
    procedure BtnGetRespostaClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure tbbAltEnderecoClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure dbgridprocDblClick(Sender: TObject);
    procedure BtnAtendAntClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure ProcuraAssuntoValidaDados(Sender: TObject);
    procedure ProcuraAssuntoApertouBotao(Sender: TObject);
    procedure PgAtendChange(Sender: TObject);
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
    procedure tbshtConsPartEnter(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tbbConsultaParticipClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    idtitular,idpessjur,idtelefone, IDPESSOA, idbeneficiario, IDPLANOPREV, sequencia: string;
    bNovoAtendimento :Boolean;
    iLinhaFiltro :Integer;
    procedure Selecionar(const IdAtend: LongInt);
    procedure Selecionarfilhas;
    procedure PegaParticipante(Var MsPegaParticipante:TMontaSelect);
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
   CmeCadastro.RepetirInsert   := false;
   PgAtend.Enabled             := true; 
   PgAtend.ActivePage          := TbShtAtend;
   PageDadosAssunto.ActivePage := TbDadosAtend;
   TbDadosAtend.Enabled        := True;
   BtnAtendAnt.Tag             := 0;
   sbtnInsDet.Visible          := True;
   sbtnExcluiDet.Visible       := True;
   BtnGetResposta.Visible      := True;
   tb97BotoesDetalhe.Visible   := True;
   GrdAssunto.DataSource       := DsAssuntoxAtend;
   LblAssunto.Caption          := 'Assuntos Do Atendimento Corrente';
   LblAssunto.Left             := 112;
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
            qryIdBeneficiario.AsFloat   := StrToFloat(idBeneficiario);
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
     qry.FieldByName('DATAINICIO').AsDateTime := date;
     qry.FieldByName('DATA').AsDateTime       := date;
     eddlghorainicio.text        := timetostr(time);
     eddlghora.text              := timetostr(time);
     qrycodatendente.AsFloat     := Sistema.IdUsuario;

   End
   Else
   Begin
     // Continua atendimento Pendente
     bb_procparticipante.Enabled := False;
     GpAnteiror.Visible          := True;
     bNovoAtendimento            := False;
     qry.First; // FDIAS - FCRT - 25.09.2001
     With RegAtendimento Do
     Begin
       IDATEND          := qryIDATEND.AsFloat;
       IDTIPOATEND      := qryIDTIPOATEND.AsFloat;
       CODATEND         := qryCODATEND.AsFloat;
       DATA             := qryDATA.AsDateTime;
       NOMESOLICITANTE  := qryNOMESOLICITANTE.AsString;
       TELSOLICITANTE   := qryTELSOLICITANTE.AsString;
       CODATENDENTE     := qryCODATENDENTE.AsString;
       RESPOSTA         := qryRESPOSTA.AsString;
       STATUS           := qrySTATUS.AsString;
       OBSERVACAO       := qryOBSERVACAO.AsString;
       IDTITULAR        := qryIDTITULAR.AsFloat;
       IDPESSJUR        := qryIDPESSJUR.AsFloat;
       DATAINICIO       := qryDATAINICIO.AsDateTime;
       LOGRADOURO       := qryLOGRADOURO.AsString;
       NUMEROSOLIC      := qryNUMEROSOLIC.AsString;
       COMPLEMSOLIC     := qryCOMPLEMSOLIC.AsString;
       BAIRROSOLIC      := qryBAIRROSOLIC.AsString;
       CEPSOLIC         := qryCEPSOLIC.AsString;
       CIDADESOLIC      := qryCIDADESOLIC.AsString;
       IDESTADO         := qryIDESTADO.AsInteger;
       PERGUNTA         := qryPERGUNTA.AsString;
       COMPLCODATEND    := qryCOMPLCODATEND.AsFloat;
       IDLOCALATENDXCPU := qryIDLOCALATENDXCPU.AsFloat;
       DDISOLIC         := qryDDISOLIC.AsString;
       DDDSOLIC         := qryDDDSOLIC.AsString;
       TIPOSOLIC        := qryTIPOSOLIC.AsString;
       NUMEROTELSOLIC   := qryNUMEROTELSOLIC.AsString;
       IDTelefone       := qryIDTelefone.AsFloat;
       CODESTADOSOLIC   := qryCODESTADOSOLIC.AsString;
       IDbeneficiario   := qryIDbeneficiario.AsFloat;
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
       qryIDATEND.AsFloat               := 0;
       qryCODATEND.AsFloat              := CODATEND;
       qryDATA.AsDateTime               := Date;
       qryNOMESOLICITANTE.AsString      := NOMESOLICITANTE;
       qryTELSOLICITANTE.AsString       := TELSOLICITANTE;
       qryCODATENDENTE.AsString         := CODATENDENTE;
       qryRESPOSTA.AsString             := RESPOSTA;
       qrySTATUS.AsString               := STATUS;
       qryOBSERVACAO.AsString           := OBSERVACAO;
       qryIDTITULAR.AsFloat             := IDTITULAR;
       qryIDPESSJUR.AsFloat             := IDPESSJUR;
       qryDATAINICIO.AsDateTime         := Date;
       qryLOGRADOURO.AsString           := LOGRADOURO;
       qryNUMEROSOLIC.AsString          := NUMEROSOLIC;
       qryCOMPLEMSOLIC.AsString         := COMPLEMSOLIC;
       qryBAIRROSOLIC.AsString          := BAIRROSOLIC;
       qryCEPSOLIC.AsString             := CEPSOLIC;
       qryCIDADESOLIC.AsString          := CIDADESOLIC;
       qryDDISOLIC.AsString             := DDISOLIC;
       qryDDDSOLIC.AsString             := DDDSOLIC;
       qryTIPOSOLIC.AsString            := TIPOSOLIC;
       qryNUMEROTELSOLIC.AsString       := NUMEROTELSOLIC ;
       qryIDTelefone.AsFloat            := IDTELEFONE;
       qrycodestadosolic.AsString       := CODESTADOSOLIC;
       qryIDbeneficiario.AsFloat        := idbeneficiario;
       qryPERGUNTA.AsString             := PERGUNTA;
       qryCOMPLCODATEND.AsFloat         := COMPLCODATEND;
       If IDESTADO <> 0 Then
          qryIDESTADO.AsInteger := IDESTADO
       Else
          qryIDESTADO.Clear;

       If ModuloCap.IdTipoAtend <> 0 Then
          qryIDTIPOATEND.AsFloat := ModuloCap.IdTipoAtend;

     End;

     Selecionarfilhas;

     With dtmAtend.QryCountAtend Do
     Begin
       If Active Then Close;
       If Not Prepared Then Prepare;
       ParamByname('CODATEND').AsFloat := RegAtendimento.CodAtend;
       Open;

       qryCOMPLCODATEND.AsFloat := FieldByName('NUMATEND').AsFloat;

       edcod.Text                  := FloattoStr(qryCODATEND.AsFloat);
       edseque.Text                := FloatToStr(FieldByName('NUMATEND').AsFloat - 1);

       Close;
     End;

     AbreQryAssuntoxAtend;
     BuscaAtendPend(StrToInt(idTitular));
   End;
   qryIDLOCALATENDXCPU.AsFloat := ModuloCap.IdLocaAtendxCpu;
   BtnAtendAnt.Visible := Not bNovoAtendimento;
   dbednomesol.SetFocus;
end;

procedure TFrmAtend.PegaParticipante(Var MsPegaParticipante:TMontaSelect);
Var
   iLoopTel : Integer;
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
  idbeneficiario := MsPegaParticipante.ValoresChave[9];
  IDPLANOPREV    := MsPegaParticipante.ValoresChave[10];
  sequencia      := MsPegaParticipante.ValoresChave[11];
  dbedatend.text := Sistema.NomeUsuario;

  PgAtend.activepage      := TbShtAtend;
  eddlghorainicio.text    := timetostr(time);
  eddlghorainicio.Enabled :=false;
  timer1.enabled          := true;

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
    qryEnderecos.ParamByName('IDPESSOA').AsInteger   := StrToInt(idTitular);
    qryEnderecos.Open;
    qryTelefones.ParamByName('IDENDERECO').AsInteger := qryEnderecos.FieldByName('IDENDERECO').AsInteger;
    qryTelefones.Open;
    qryContaCorrente.ParamByName('IDPESSOA').AsInteger   := StrToInt(idTitular);
    qryContaCorrente.Open;
    // pega forma padrão de atendimento
    eddlghorainicio.text        := timetostr(time);
    eddlghora.text              := timetostr(time);
    dbdateInicio.Text           := datetostr(date);
    dbdateFim.Text              := datetostr(date);
    qrycodatendente.AsFloat     := Sistema.IdUsuario;
    qryCidades.Locate('IDCIDADES',dtmAtend.QryDadosParticipIDCIDADES.AsInteger,[loCaseInsensitive, loPartialKey]);
    dblkCidade.LookupValue := InttoStr(qryCidades.FieldByName('IDCIDADES').AsInteger);
    dblkCidade.Text        := qryCidades.FieldByName('NOME').AsString;
    qryUF.Locate('CODESTADO',dtmAtend.QryDadosParticipcodestado.AsString,[loCaseInsensitive, loPartialKey]);
    dblkEstado.LookupValue := dtmAtend.QryDadosParticipcodestado.AsString;
    dblkEstado.Text        := dtmAtend.QryDadosParticipcodestado.AsString;
    if qry.FieldByName('TIPOSOLIC').asString <> '' Then Begin
        for iLoopTel := 1 to 5 Do Begin
          if qry.FieldByName('TIPOSOLIC').AsString[iLoopTel] = 'C' Then
             chkTipoTelefone.Checked[0] := True
        end;
        for iLoopTel := 1 to 5 Do Begin
          if qry.FieldByName('TIPOSOLIC').AsString[iLoopTel] = 'C' Then
             chkTipoTelefone.Checked[0] := True
        end;
        for iLoopTel := 1 to 5 Do Begin
          if qry.FieldByName('TIPOSOLIC').AsString[iLoopTel] = 'P' Then
             chkTipoTelefone.Checked[1] := True
        end;
        for iLoopTel := 1 to 5 Do Begin
          if qry.FieldByName('TIPOSOLIC').AsString[iLoopTel] = 'F' Then
             chkTipoTelefone.Checked[2] := True
        end;
        for iLoopTel := 1 to 5 Do Begin
          if qry.FieldByName('TIPOSOLIC').AsString[iLoopTel] = 'L' Then
             chkTipoTelefone.Checked[3] := True
        end;
        for iLoopTel := 1 to 5 Do Begin
          if qry.FieldByName('TIPOSOLIC').AsString[iLoopTel] = 'R' Then
             chkTipoTelefone.Checked[4] := True
        end;
    end;
    dtmAtend.QryDadosParticip.Close;
  End;
  tbbConsultaParticip.Enabled := True;
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
  //Fechando as Queries filhas;
  with dtmAtend do
  begin
    With qryusuario Do
    Begin
      if dtmAtend.qryUsuario.Active Then dtmAtend.qryUsuario.close;
      If Active Then close;
      If Not Prepared Then Prepare;
      if qryCODATENDENTE.AsString <> '' Then
        ParamByName('CODATEND').AsFloat := StrtoFloat(qryCODATENDENTE.AsString);

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

    With qryemp Do
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
    Close;
    If Not Prepared Then Prepare;
    Params[0].AsFloat := IdAtend;
    Open;
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

procedure TfrmAtend.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Fiario.Free;
  Rad.Free;
  Atendimento.Free;
end;

procedure TfrmAtend.cmbfilialEnter(Sender: TObject);
begin
  inherited;
  if not dtmAtend.qryfilial.active then
     dtmAtend.qryfilial.open;
end;

procedure TfrmAtend.dbgridempDblClick(Sender: TObject);
begin
  inherited;
  if not dtmAtend.qryemp.eof then
     AbrirFormModal(frmConsHistRecEmp, TfrmConsHistRecEmp);
end;

procedure TfrmAtend.FormCreate(Sender: TObject);
begin
  inherited;
  Fiario := TFiario.Create;
  Atendimento := TAtendimento.Create;
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
  If (Shift = [ssCtrl]) Then
     Case Key Of
        ord('I'), ord('i') :
               Begin
                 if PageDadosAssunto.ActivePage = tbsDadosParticip Then Begin
                   if pgCtrlDadosParticip.ActivePage = tbsEnderecos Then
                      tbbInsEnderecoClick(Sender);
                   if pgCtrlDadosParticip.ActivePage = tbsTelefones Then
                      tbbIncTelefoneClick(Sender);
                   if pgCtrlDadosParticip.ActivePage = tbsContaCorrente Then
                      tbbIncContaCorrenteClick(Sender);
                 end;
                 if PgAtend.ActivePage = TbShtAtend Then Begin
                   if PageDadosAssunto.ActivePage = TbsAssuntos Then
                      sbtnInsDetClick(Sender);
                 end;
               end;
        ord('A') , ord('a') :
               Begin
                 if PageDadosAssunto.ActivePage = tbsDadosParticip Then Begin
                   if pgCtrlDadosParticip.ActivePage = tbsEnderecos Then
                      tbbAltEnderecoClick(Sender);
                   if pgCtrlDadosParticip.ActivePage = tbsTelefones Then
                      tbbAltTelefoneClick(Sender);
                   if pgCtrlDadosParticip.ActivePage = tbsContaCorrente Then
                      tbbAltContaCorrenteClick(Sender);
                 end;
               end;
        ord('E'), ord('e') :
               Begin
                 if PageDadosAssunto.ActivePage = tbsDadosParticip Then Begin
                   if pgCtrlDadosParticip.ActivePage = tbsEnderecos Then
                      tbbExcEnderecoClick(Sender);
                   if pgCtrlDadosParticip.ActivePage = tbsTelefones Then
                      tbbExcTelefoneClick(Sender);
                   if pgCtrlDadosParticip.ActivePage = tbsContaCorrente Then
                      tbbExcContaCorrenteClick(Sender);
                 end;
                 if PgAtend.ActivePage = TbShtAtend Then Begin
                   if PageDadosAssunto.ActivePage = TbsAssuntos Then
                      sbtnExcluiDetClick(Sender);
                 end;
               end;
        ord('R'), ord('r') :
               Begin
                 if PgAtend.ActivePage = TbShtAtend Then Begin
                   if PageDadosAssunto.ActivePage = TbsAssuntos Then
                      BtnGetRespostaClick(Sender);
                 end;
               end;
        ord('D'), ord('d') :
               Begin
                 if PgAtend.ActivePage = TbShtAtend Then Begin
                   if PageDadosAssunto.ActivePage = TbsAssuntos Then
                      BtnAtendAntClick(Sender);
                 end;
               end;

     End
  Else
     Case Key Of
        VK_F3:  PgAtend.ActivePage := TbShtAtend;
        VK_F4:  tbbConsultaParticipClick(Sender);
        VK_F5:  Begin
                  PgAtend.ActivePage := TbShtAtend;
                  PageDadosAssunto.ActivePage := TbDadosAtend;
                end;
        VK_F6:  Begin
                  PgAtend.ActivePage := TbShtAtend;
                  PageDadosAssunto.ActivePage := TbsAssuntos;
                end;
        VK_F7:  Begin
                  PgAtend.ActivePage := TbShtAtend;
                  PageDadosAssunto.ActivePage := TbsGeral;
                end;
        VK_F8:  Begin
                  PgAtend.ActivePage := TbShtAtend;
                  PageDadosAssunto.ActivePage := tbsDadosParticip;
                end;
        VK_F9:  Begin
                  PgAtend.ActivePage := TbShtAtend;
                  PageDadosAssunto.ActivePage := tbShtSimulaBenef;
                end;
     else
        PgAtend.ActivePage := TbShtAtend;
  End;
  PgAtendChange(Self);
end;

procedure TfrmAtend.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  Selecionar(-1);
  PgAtend.Enabled := False;
  PageDadosAssunto.Enabled := False;
  tbbConsultaParticip.Enabled := false;
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

     qryRubXBeneficio.Close;
     qryRubXBeneficio.Open;

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

procedure TfrmAtend.tbbAltEnderecoClick(Sender: TObject);
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
  sTipo : String;
Begin
   Try
      StartTransacao;
      // Telefone do Solicitante
      begin
         sTipo := '';
         if chkTipoTelefone.Checked[0] then
            sTipo := sTipo + 'C';
         if chkTipoTelefone.Checked[1] then
            sTipo := sTipo + 'P';
         if chkTipoTelefone.Checked[2] then
            sTipo := sTipo + 'F';
         if chkTipoTelefone.Checked[3] then
            sTipo := sTipo + 'L';
         if chkTipoTelefone.Checked[4] then
            sTipo := sTipo + 'R';

         if sTipo = '' then
         begin
              chkTipoTelefone.State[0] := cbChecked;
              sTipo := 'C';
         end;
         qry.FieldByName('TIPOSOLIC').AsString := sTipo;
      end;
      If dtmAtend.QryDadosParticip.Active Then dtmAtend.QryDadosParticip.Close;
      If Not dtmAtend.QryDadosParticip.Prepared Then dtmAtend.QryDadosParticip.Prepare;
      if SELF.tag = 0      then
        dtmAtend.QryDadosParticip.ParamByName('IDPESSOA').AsFloat := qryIDTITULAR.AsFloat
      else
        dtmAtend.QryDadosParticip.ParamByName('IDPESSOA').AsFloat := qryIDBENEFICIARIO.AsFloat;

      dtmAtend.QryDadosParticip.Open;
      dtmAtend.QryDadosParticip.Close;

      If Trim(dbdateFim.Text) = '' Then dbdateFim.Date :=Date;

      Qry.First;
      While Not Qry.Eof Do Begin
        Atendimento.IdAtend              := qryIDATEND.AsFloat;
        Atendimento.IdTipoAtend          := StrtoInt(dblkTipoAtendimento.LookupValue);
        Atendimento.IdTitular            := qryIDTITULAR.AsFloat;
        Atendimento.IdPessjur            := qryIDPESSJUR.AsFloat;
        Atendimento.ComplCondAtend       := qryCOMPLCODATEND.AsFloat;
        Atendimento.IdLocalAtendXCpu     := qryIDLOCALATENDXCPU.AsFloat;
        Atendimento.Data                 := qryDATA.AsDateTime;
        Atendimento.DataInicio           := qryDATAINICIO.AsDateTime;
        Atendimento.CodAtend             := qryCODATEND.AsFloat;
        Atendimento.CodAtendente         := qryCODATENDENTE.AsString;
        Atendimento.Resposta             := qryRESPOSTA.AsString;
        Atendimento.Status               := qrySTATUS.AsString;
        Atendimento.Observacao           := qryOBSERVACAO.AsString;
        Atendimento.Pergunta             := qryPERGUNTA.AsString;
        Atendimento.NomeSolicitante      := qryNOMESOLICITANTE.AsString;
        Atendimento.TelSolicitante       := qryTELSOLICITANTE.AsString;
        Atendimento.Logradouro           := qryLOGRADOURO.AsString;
        Atendimento.NumeroSolic          := qryNUMEROSOLIC.AsString;
        Atendimento.ComplemSolic         := qryCOMPLEMSOLIC.AsString;
        Atendimento.BairroSolicitante    := qryBAIRROSOLIC.AsString;
        Atendimento.CepSolicitante       := qryCEPSOLIC.AsString;
        Atendimento.CidadeSolicitante    := qryCIDADESOLIC.AsString;
        Atendimento.IdEstado             := QryIdEstado.AsInteger;
        Atendimento.CODESTADOSOLICITANTE := qryCODESTADOSOLIC.AsString;
        {FDIAS - FCRT - SET/2001}
        Atendimento.TipoSolic            := qryTIPOSOLIC.AsString;
        Atendimento.DDISolic             := qryDDISOLIC.AsString;
        Atendimento.DDDSolic             := qryDDDSOLIC.AsString;
        Atendimento.NumeroTelSolic       := qryNUMEROTELSOLIC.AsString;

        if qryIDATEND.AsFloat <> 0 Then
           Atendimento.Edit
        Else Begin
           Atendimento.Data       := StrToDateTime(dbdateFim.Text + ' ' + eddlghora.Text);
           Atendimento.DataInicio :=StrToDateTime(dbdateInicio.Text + ' ' + eddlghorainicio.Text);
           Atendimento.Status     := ModuloCap.GetStatusAtend(bNovoAtendimento);
           Atendimento.Insert;

        end;

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
           rad.TipoProcesso  := QryAssuntoxAtendIDTIPOPROCESSO.AsInteger;
           rad.IdPessoa      := Sistema.IdEmpresa;
           rad.IdPessResp    := qryIDTITULAR.AsInteger;
           rad.OBS           := Trim(Copy(' Atendimento Nº: ' + qryIDATEND.AsString + ' Complemento: ' + qryCOMPLCODATEND.AsString + (#13+#10) +
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

         If  qryultrubFLGSTATUS.ASSTRING = '0' Then Begin
            Fiario.IdPessoa     := strtoint(idbeneficiario);
            Fiario.IdTitular    := strtoint(idtitular);
            Fiario.Idusuario    := sistema.idusuario;
            Fiario.Idmodulo     := 19;
            Fiario.Idrubs       := qryultrubultrub.ASinteger;
            Fiario.Descricao    := 'Geração de Rub referente ao  '+qryassuntoxAtendnome.AsString;
            Fiario.DataInclusao := Date;
            Fiario.Inserir;
            With QRYALTRUBS Do Begin
               ParamByName('IDRUBS').AsINTEGER   := qryultrubultrub.ASinteger;
               ParamByName('FLGSTATUS').AsString := '1';
               ExecSql;
            end;
         end;
          QryAssuntoxAtend.Edit;
          QryAssuntoxAtendEXISTERUB.AsFloat := -1;
          QryAssuntoxAtend.Post;
        End;

        QryAssuntoxAtend.Next;
      End;

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

   BtnAtendAnt.Tag           := 0;
   sbtnInsDet.Visible        := False;
   sbtnExcluiDet.Visible     := True;
   BtnGetResposta.Visible    := True;
   tb97BotoesDetalhe.Visible := True;
   GrdAssunto.DataSource     := DsAssuntoxAtend;
   LblAssunto.Caption        := 'Assuntos Do Atendimento Corrente';
   LblAssunto.Left           := 112;
   tbbConsultaParticip.Enabled := False;
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

   if dblkCidade.LookupValue = ''  then
    begin
       MsgDlg('Favor informar a Cidade do endereço do solicitante!','Atenção',mtError,[mbOk],0);
       dblkCidade.SetFocus;
       exit;
    end;

   if dblkEstado.LookupValue = ''  then
    begin
       MsgDlg('Favor informar o Estado do endereço do solicitante!','Atenção',mtError,[mbOk],0);
       dblkEstado.SetFocus;
       exit;
    end;

   if (dblkTipoAtendimento.LookupValue = '' ) then
      begin
        MsgDlg('Favor informar a Forma de Atendimento!','Atenção',mtError,[mbOk],0);
        dblkTipoAtendimento.SetFocus;
        exit;
      end;

   if QryAssuntoxAtend.IsEmpty then
      begin
        MsgDlg('Favor informar o Assunto!','Atenção',mtError,[mbOk],0);
        If ProcuraAssunto.CanFocus Then ProcuraAssunto.SetFocus;
        exit;
      end;
   qry.FieldByName('IDTIPOATEND').AsInteger   := qryTipoAtend.FieldbyName('IDTIPOATEND').AsInteger;
   qry.FieldByName('CIDADESOLIC').AsString    := dblkCidade.LookupValue;
   qry.FieldByName('CODESTADOSOLIC').AsString := dblkEstado.LookupValue;
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
        FrmAcompProc.sObs      := Trim(Copy(' Atendimento Nº: ' + FloattoStr(qryCODATEND.AsFloat) + ' Complemento: ' + qryCOMPLCODATEND.AsString + (#13+#10) +
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
  0: Begin
       BtnAtendAnt.Tag          := 1;
       sbtnInsDet.Visible       := False;
       sbtnExcluiDet.Visible    := False;
       BtnGetResposta.Visible   := False;
       GrdAssunto.DataSource    := DsAssuntoxAtendAnt;
       ReRespostaAux.DataSource := DsAssuntoxAtendAnt;
       LblAssunto.Caption       := 'Assuntos Do Atendimento Anterior';
       LblAssunto.Left          := 37;
     End;
  1: Begin
      BtnAtendAnt.Tag           := 0;
      sbtnInsDet.Visible        := True;
      sbtnExcluiDet.Visible     := True;
      BtnGetResposta.Visible    := True;
      tb97BotoesDetalhe.Visible := True;
      GrdAssunto.DataSource     := DsAssuntoxAtend;
      ReRespostaAux.DataSource  := DsAssuntoxAtend;
      LblAssunto.Caption        := 'Assuntos Do Atendimento Corrente';
      LblAssunto.Left           := 112;
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
  If qry.isEmpty and FazQuery(DtmbaseDados.Qry,'SELECT IDATEND FROM ATEND WHERE (STATUS = ''Pendente'') AND (IDTITULAR = ' + IntToStr(IdTitular) + ')' ) Then
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
  With dtmAtend Do
  Begin
    Case PgAtend.ActivePage.PageIndex of
      1:
      Begin
        ConsPart1.sIdPessoa    := IDTITULAR;
        ConsPart1.sIdPessjur   := IDPESSJUR;
        ConsPart1.sIdPlanoprev := IDPLANOPREV;
        ConsPart1.sSeqProposta := sequencia;
        ConsPart1.DataBaseName := 'BaseDados';
        ConsPart1.MostraConsulta;
      End;

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

procedure TfrmAtend.tbshtConsPartEnter(Sender: TObject);
begin
  inherited;
  ConsPart1.sIdPessoa    := IDBENEFICIARIO;
  ConsPart1.sIdPessjur   := IDPESSJUR;
  ConsPart1.sIdPlanoprev := IDPLANOPREV;
  ConsPart1.sSeqProposta := sequencia;
  ConsPart1.DataBaseName := 'BaseDados';
  ConsPart1.MostraConsulta;
end;

procedure TfrmAtend.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  PgAtend.Enabled             := True;
  PageDadosAssunto.Enabled    := True;
  tbbConsultaParticip.Enabled := True;
  qryTipoAtend.Locate('IDTIPOATEND',qryParam.FieldByName('IDTIPOATENDPADRAO').AsInteger,[loCaseInsensitive, loPartialKey]);
  dblkTipoAtendimento.LookupValue := InttoStr(qryTipoAtend.FieldByName('IDTIPOATEND').AsInteger);
  dblkTipoAtendimento.Text        := qryTipoAtend.FieldByName('NOME').AsString;

end;

procedure TfrmAtend.FormShow(Sender: TObject);
begin
  inherited;
  qryCidades.Close;
  qryCidades.Open;
  qryUF.Close;
  qryUF.Open;
  qryTipoAtend.Close;
  qryTipoAtend.Open;
  qryParam.Close;
  qryParam.Open;
  idBeneficiario := '';
end;

procedure TfrmAtend.tbbConsultaParticipClick(Sender: TObject);
begin
  inherited;
  if idBeneficiario <> '' Then
    if StrtoInt(idBeneficiario) <> 0 Then Begin
      ConsPart1.sIdPessoa    := IDBENEFICIARIO;
      ConsPart1.sIdPessjur   := IDPESSJUR;
      ConsPart1.sIdPlanoprev := IDPLANOPREV;
      ConsPart1.sSeqProposta := sequencia;
      ConsPart1.DataBaseName := 'BaseDados';
      ConsPart1.MostraConsulta;
    end;
end;

procedure TfrmAtend.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  tbbConsultaParticip.Enabled := false;
end;

end.


