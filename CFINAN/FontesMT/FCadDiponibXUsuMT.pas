// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//------------------------------------------------------------------------------
// WO          : 24198
// Responsável : Paulo Nobre
// Data        : 11/08/2025
// Descrição   : Ajustado o CDS CMSqlUsuBloqueado para voltar a mostrar o nome
//               da Pessoa para ser apresentado nas grids. Este ajuste é apenas
//               pra deixar o CDS compatível com a carga do CDS.    
//------------------------------------------------------------------------------
// Autor(a)    : Douglas de Siqueira
// Data        : 27/01/2012
// Pendência   : SOL 172778 KINTANA 1556978
// Descricao   : Verificar o erro que ocorre quando abrimos a
//               tela do bloqueio de usuários por cima de outra tela ja aberta.
// *****************************************************************************
// Autor(a)    :  Marcos Luiz de Jesus
// Data        :  21/07/2010
// Pendência   : SOL 133468 KINTANA 779113
// Descricao   : Realizar Busca por Nome de Usuario na GRID.
//--------------------------------------------------------------------------------------------------
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
{ --------------------------------------------------------------------------------------------------
Data      : 17/11/2006
Autor     : Fabio Fagundes
Código    : AL_1
Pendência : 23769
SOL       : 48885
Descrição : Acerto na crítica de comparação entre datas para tratar a alteração
           do campo DATABLOQDISPFINAN da tabela PARAMFINANC, que foi alteradao de
           do formato Data para o formato Date e Hora;
----------------------------------------------------------------------------------------------------
Data      : 29/08/2006
Autor     : Marcus Oliveira
Pendencia : Truncar a data e a hora de disponibilidade e trazer ao usuário.
---------------------------------------------------------------------------------------------------}
unit FCadDiponibXUsuMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, TB97Ctls, StdCtrls, wwdblook, Grids, Wwdbigrd, Wwdbgrid,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
  CmEventosCadastro, Db, DBClient, uCMClientDataSet, Wwdatsrc,
  uCmSqlParams, DBTables, Wwquery, Provider, wwdbdatetimepicker,
  CMDateTimePicker, uCtrlDisponibxusu, uCtrlParamFinanc, uCtrlDispFinanc,
  ComCtrls,uCMTypes;

type
  TfrmCadDisponibXUsuMT = class(TfrmOkCancelar)
    dsUsuBloqueado: TwwDataSource;
    CdsUsuLiberado: TCMClientDataSet;
    CmeCadastro: TCmEventosCadastro;
    CdsGrupoAcesso: TCMClientDataSet;
    CdsUsuBloqueado: TCMClientDataSet;
    dsUsuLiberado: TwwDataSource;
    dsp: TDataSetProvider;
    qry: TwwQuery;
    CMSqlGrupoAcesso: TCMSqlParams;
    CdsGrupoAcessoIDGRUPO: TFloatField;
    CdsGrupoAcessoNOMEGRUPO: TStringField;
    Panel3: TPanel;
    Label4: TLabel;
    edDataBloqDisp: TCMDateTimePicker;
    bbtnBloqueia: TBitBtn;
    CdsParamFinanc: TCMClientDataSet;
    CMSqlUsuBloqueado: TCMSqlParams;
    CdsUsuBloqueadoIDUSUARIO: TFloatField;
    CdsUsuBloqueadoNOMEUSUARIO: TStringField;
    CdsUsuBloqueadoFLGDISPFINANC: TStringField;
    qryParamFinanc: TwwQuery;
    dspParamFinanc: TDataSetProvider;
    CdsUsuLiberadoIDUSUARIO: TFloatField;
    CdsUsuLiberadoNOMEUSUARIO: TStringField;
    CdsUsuLiberadoFLGDISPFINANC: TStringField;
    pgcPrincipal: TPageControl;
    tbsUsuarios: TTabSheet;
    pnlUsuSistema: TPanel;
    dbgUsuSistema: TwwDBGrid;
    pnlGrupoUsu: TPanel;
    lblUnidNegoc: TLabel;
    Label1: TLabel;
    dblcUnidNegoc: TwwDBLookupCombo;
    Panel1: TPanel;
    pnlButtons: TPanel;
    BtnExcluir: TSpeedButton;
    BtnExcluirTodos: TSpeedButton;
    BtnIncluirTodos: TSpeedButton;
    BtnIncluir: TSpeedButton;
    pnlUsuDisp: TPanel;
    dbgUsuDiponib: TwwDBGrid;
    Panel2: TPanel;
    Label2: TLabel;
    CdsDispFinanc: TCMClientDataSet;
    Cds: TCMClientDataSet;
    CdsRateioDispFinanc: TCMClientDataSet;
    qryDispSintetica: TwwQuery;
    dspDispSintetica: TDataSetProvider;
    CdsDispSintetica: TCMClientDataSet;
    CdsDispAnalitica: TCMClientDataSet;
    dsDispSintetica: TwwDataSource;
    dsDispAnalitica: TwwDataSource;
    qryAux: TwwQuery;
    BitBtn4: TBitBtn;
    CdsDispSinteticaSALDOANT: TFloatField;
    dspDispAnalitica: TDataSetProvider;
    qryDispAnalitica: TwwQuery;
    bt_Imprime: TBitBtn;
    CdsDispAnaliticaIDPLANO: TFloatField;
    CdsDispAnaliticaIDPATRO: TFloatField;
    CdsDispAnaliticaDATADISPFINANC: TDateTimeField;
    CdsDispAnaliticaHISTORICO: TStringField;
    CdsDispAnaliticaNOMEPLANOPATRO: TStringField;
    CdsDispSinteticaNOMEPLANOPATRO: TStringField;
    CdsDispAnaliticaVALOR: TFloatField;
    CdsDispSinteticaDESENBOLSOS: TFloatField;
    CdsDispSinteticaRECEBIMENTOS: TFloatField;
    CdsDispSinteticaSALDODIA: TFloatField;
    qryDispSinteticaNOMEPLANOPATRO: TStringField;
    qryDispSinteticaDATADISPFINANC: TDateTimeField;
    qryDispSinteticaSALDOANT: TFloatField;
    qryDispSinteticaIDPLANO: TFloatField;
    qryDispSinteticaIDPATRO: TFloatField;
    qryDispSinteticaDESENBOLSOS: TFloatField;
    qryDispSinteticaRECEBIMENTOS: TFloatField;
    qryDispSinteticaSALDODIA: TFloatField;
    qryDispAnaliticaIDPLANO: TFloatField;
    qryDispAnaliticaIDPATRO: TFloatField;
    qryDispAnaliticaDATADISPFINANC: TDateTimeField;
    qryDispAnaliticaHISTORICO: TStringField;
    qryDispAnaliticaVALOR: TFloatField;
    qryDispAnaliticaNOMEPLANOPATRO: TStringField;
    qryDispAnaliticaNOMEFORCLI: TStringField;
    CdsDispSinteticaDATADISPFINANC: TDateTimeField;
    CdsDispSinteticaIDPLANO: TFloatField;
    CdsDispSinteticaIDPATRO: TFloatField;
    CdsDispAnaliticaNOMEFORCLI: TStringField;

    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dblcUnidNegocExit(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure IncluirExcluirUsu(Sender: TObject);
    procedure IncluirExcluirTodosUsu(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnBloqueiaClick(Sender: TObject);
    procedure edDataBloqDispExit(Sender: TObject);
    procedure AtualizaBotoes;
    procedure ProcessaDispFinanc;
    procedure GravaDispFinanc(sTipoReg,sTipo : String);
    procedure GravaDispFinancAnt(sTipoReg,sTipo : String);
    procedure BitBtn2Click(Sender: TObject);
    procedure eOnMessage(sMsg : string);
    procedure BitBtn4Click(Sender: TObject);
    procedure dblcUnidNegocChange(Sender: TObject);
    procedure MontaCdsUsuBloqLib;
    procedure dbgSelDispSinteticaCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure dbgSelDispSinteticaTopRowChanged(Sender: TObject);
    procedure dbgSelDispAnaliticaCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure dbgSelDispAnaliticaTopRowChanged(Sender: TObject);
    procedure dbgUsuSistemaKeyPress(Sender: TObject; var Key: Char);
    procedure dbgUsuSistemaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgUsuDiponibKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgUsuDiponibKeyPress(Sender: TObject; var Key: Char);
    procedure FormClick(Sender: TObject);


  private { Private declarations }

     F_rIDPessoa       : Double;
     F_rIDModulo       : Double;
     F_rIDUsuario      : Double;
     F_bUsaPlanoPatro  : Boolean;
     CtrlDisponibxusu  : TCtrlDisponibxusu;
     CtrlParamFinanc   : TCtrlParamFinanc;
     CtrlDisponFinanc  : TCtrlDisponFinanc;

     function Sel(iIdPessoa : Integer; dDataRef:TDateTime): OleVariant;


  public  { Public declarations }

     bmPosicao: TBookmark;


  end;



var
  frmCadDisponibXUsuMT: TfrmCadDisponibXUsuMT;
  fIddispfinanc:Integer;
  ssMsg : string;
  dDataEnter : TDateTime;
  sLetrasBloqueado, sLetrasLiberado : String;



implementation
{$R *.DFM}
uses
  dBaseDados, uSistema, uMensErro;




procedure TfrmCadDisponibXUsuMT.FormCreate(Sender: TObject);
begin
  inherited;
   //Inicializa Ctrl de List de Terceiros
   CtrlDisponibxusu := TCtrlDisponibxusu.Create;
   CtrlDisponibxusu.Initialize(dtmBaseDados.dbBaseDados,True,cntBDE,cnsServer,
                               nil,False,eOnMessage);

   CtrlParamFinanc := TCtrlParamFinanc.Create;
   CtrlParamFinanc.Initialize(dtmBaseDados.dbBaseDados,True,cntBDE,cnsServer,
                               nil,False,eOnMessage);

   CtrlDisponFinanc:=TCtrlDisponFinanc.Create(Sistema.IdEmpresa,Sistema.IdModulo,
                                              Sistema.IdUsuario,Sistema.UsaPlanoPatro);
   CtrlDisponFinanc.Initialize(dtmBaseDados.dbBaseDados,True,cntBDE,cnsServer,
                               nil,False,eOnMessage);

   CdsGrupoAcesso.Data  := CtrlDisponibxusu.SelecionaGrupoUsuario;
   CdsUsuBloqueado.Data := CtrlDisponibxusu.SelecionaUsuBloqueado(-1);
   CdsUsuLiberado.Data  := CtrlDisponibxusu.SelecionaUsuLiberado;

   CdsParamFinanc.Data  := CtrlParamFinanc.ListParamFinanc(Sistema.IdEmpresa);

   edDataBloqDisp.DateTime  := CdsParamFinanc.FieldByName('DATABLOQDISPFINAN').AsDateTime;

   // Associa o Cds do CtrlObject ao Cds local para as alterações locais refletirem no CtrlObject
   CtrlDisponibxusu.CdsUsuBloqueado := CdsUsuBloqueado;
   CtrlParamFinanc.CdsParamFinanc   := CdsParamFinanc;

end;



procedure TfrmCadDisponibXUsuMT.FormDestroy(Sender: TObject);
begin
  inherited;
   CtrlDisponibxusu.Free;
   CtrlParamFinanc.Free;
   CtrlDisponFinanc.Free;
end;



procedure TfrmCadDisponibXUsuMT.dblcUnidNegocExit(Sender: TObject);
begin
  inherited;
   MontaCdsUsuBloqLib;
end;



procedure TfrmCadDisponibXUsuMT.eOnMessage(sMsg : string);
begin
   MsgDlg(sMsg,'Atenção',mtWarning,[mbOk],0);
end;



procedure TfrmCadDisponibXUsuMT.FormResize(Sender: TObject);
begin
  inherited;
   pnlUsuSistema.Width :=StrToInt(FormatFloat('#############',(self.Width - 48)/2));///Douglas.siqueira SOL 172778 Kin 1556978
   dbgUsuDiponib.ColWidths[0] := dbgUsuDiponib.Width - 5;
   dbgUsuSistema.ColWidths[0] := dbgUsuSistema.Width - 5;
end;



procedure TfrmCadDisponibXUsuMT.FormShow(Sender: TObject);
begin
  inherited;
   pgcPrincipal.activepage := tbsUsuarios;
   bbtnConfirmar.Enabled:=False;
   bbtnCancelar.Enabled:=False;
   AtualizaBotoes;
end;



procedure TfrmCadDisponibXUsuMT.IncluirExcluirUsu(Sender: TObject);
begin
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;

   if TSpeedButton(sender).Name = BtnIncluir.Name then
   begin
      if CdsUsuBloqueado.IsEmpty then Exit;

      CdsUsuBloqueado.Edit;
      CdsUsuBloqueado.FieldByName('FLGDISPFINANC').AsString := 'Y';
      CdsUsuBloqueado.Post;

      if not(CtrlDisponibxusu.GravaDisponibxusu(CdsUsuBloqueado)) then
         MsgDlg(CtrlDisponibxusu.MessageInfo,'Erro',mtError,[mbOk],0);
   end
   else if TSpeedButton(sender).Name = BtnExcluir.Name then
   begin
      if CdsUsuLiberado.IsEmpty then Exit;

      CdsUsuLiberado.Edit;
      CdsUsuLiberado.FieldByName('FLGDISPFINANC').AsString := 'N';
      CdsUsuLiberado.Post;

      if not(CtrlDisponibxusu.GravaDisponibxusu(CdsUsuLiberado)) then
         MsgDlg(CtrlDisponibxusu.MessageInfo,'Erro',mtError,[mbOk],0);
   end;

   MontaCdsUsuBloqLib;
   sLetrasBloqueado:='';
end;



procedure TfrmCadDisponibXUsuMT.IncluirExcluirTodosUsu(Sender: TObject);
begin
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;

   if TSpeedButton(sender).Name = BtnIncluirTodos.Name then
   begin
      if CdsUsuBloqueado.IsEmpty then Exit;

      CdsUsuBloqueado.First;
      while not(CdsUsuBloqueado.Eof) do
      begin
         CdsUsuBloqueado.Edit;
         CdsUsuBloqueado.FieldByName('FLGDISPFINANC').AsString := 'Y';
         CdsUsuBloqueado.Post;
         CdsUsuBloqueado.Next;
      end;
      CtrlDisponibxusu.GravaDisponibxusu(CdsUsuBloqueado);
   end
   else if TSpeedButton(sender).Name = BtnExcluirTodos.Name then
   begin
      if CdsUsuLiberado.IsEmpty then Exit;

      CdsUsuLiberado.First;
      while not(CdsUsuLiberado.Eof) do
      begin
         CdsUsuLiberado.Edit;
         CdsUsuLiberado.FieldByName('FLGDISPFINANC').AsString := 'N';
         CdsUsuLiberado.Post;
         CdsUsuLiberado.Next;
      end;
      CtrlDisponibxusu.GravaDisponibxusu(CdsUsuLiberado)
   end;
   sLetrasBloqueado:='';
   MontaCdsUsuBloqLib;
end;



procedure TfrmCadDisponibXUsuMT.bbtnBloqueiaClick(Sender: TObject);
begin
  inherited;
   if CdsParamFinanc.FieldByName('FLGDISPBLOQ').AsString <> 'Y' then
   begin
      CtrlDisponibxusu.BloqueiaDispFin('Y',Sistema.IdEmpresa,edDataBloqDisp.DateTime);
      bbtnBloqueia.Caption := 'Desbloqueia';
      MsgDlg('Disponibilidade Bloqueada.','Mensagem do Sistema',mtInformation,[mbOk],0);
   end
   else
   begin
      CtrlDisponibxusu.BloqueiaDispFin('N',Sistema.IdEmpresa,edDataBloqDisp.DateTime);
      bbtnBloqueia.Caption := 'Bloqueia';
      MsgDlg('Disponibilidade Desbloqueada.','Mensagem do Sistema',mtInformation,[mbOk],0);
   end;
   CdsParamFinanc.Data  := CtrlParamFinanc.ListParamFinanc(Sistema.IdEmpresa);
   edDataBloqDisp.DateTime  := CdsParamFinanc.FieldByName('DATABLOQDISPFINAN').AsDateTime;
   AtualizaBotoes;
end;



procedure TfrmCadDisponibXUsuMT.AtualizaBotoes;
begin
   if CdsParamFinanc.FieldByName('FLGDISPBLOQ').AsString <> 'Y' then
      bbtnBloqueia.Caption := 'Bloqueia'
   else
      bbtnBloqueia.Caption := 'Desbloqueia';
end;



procedure TfrmCadDisponibXUsuMT.ProcessaDispFinanc;
begin
   // Busca
   Cds.Data := CtrlDisponibxusu.Sel(Sistema.IdEmpresa,
                                    edDataBloqDisp.Date);
   if not Cds.IsEmpty then
   begin
      {TIPOREG := A = SALDO INICIAL
                  I = INVESTIMENTO
                  O = OUTROS MODULOS
                  S = SALDO FINAL
       TIPO := B = BLOQUEIO
               L = LANCAMENTOS}

      Cds.First;
      while not Cds.Eof do
      begin
         // DISPFINANC
         CdsDispFinanc.Insert;
         fIdDispFinanc := CtrlDisponibxusu.GetSequenceL;
         CdsDispFinanc.FieldByName('IDDISPFINANC').AsInteger    := fIdDispFinanc;
         CdsDispFinanc.FieldByName('VLRDISPFINANC').AsFloat     :=
            Cds.FieldByName('VALORDISP').AsFloat;
         CdsDispFinanc.FieldByName('TIPOREG').AsString          :=
            Cds.FieldByName('RECPAG').AsString;
         CdsDispFinanc.FieldByName('TIPO').AsString             := 'B'; // Bloqueio
         CdsDispFinanc.FieldByName('IDMODULO').AsInteger        := Sistema.IdModulo;
         CdsDispFinanc.FieldByName('IDMODULOORIGEM').AsInteger  :=
            Cds.FieldByName('IDMODULO').AsInteger;
         if Cds.FieldByName('RECPAG').AsString = 'A' then
            CdsDispFinanc.FieldByName('HISTORICO').AsString        := 'Saldo Inicial'
         else
            CdsDispFinanc.FieldByName('HISTORICO').AsString        :=
               Cds.FieldByName('NODOCUMENTO').AsString;
         CdsDispFinanc.FieldByName('FLGEXCLUSAO').AsString      := 'N';
         CdsDispFinanc.FieldByName('DATADISPFINANC').AsDateTime := edDataBloqDisp.Date;
         CdsDispFinanc.Post;
         // RATEIODISPFINANC
         CdsRateioDispFinanc.Insert;
         CdsRateioDispFinanc.FieldByName('IDDISPFINANC').AsInteger   := fIdDispFinanc;
         CdsRateioDispFinanc.FieldByName('IDPLANO').AsInteger        :=
            Cds.FieldByName('IDPLANOPREV').AsInteger;
         CdsRateioDispFinanc.FieldByName('IDPATRO').AsInteger        :=
            Cds.FieldByName('IDPATRO').AsInteger;
         CdsRateioDispFinanc.FieldByName('VLRRATEIO').AsFloat        :=
            Cds.FieldByName('VALORDISP').AsFloat;
         CdsRateioDispFinanc.FieldByName('IDPESSOA').AsInteger        :=
            Cds.FieldByName('IDPESSOA').AsInteger;
         CdsRateioDispFinanc.FieldByName('IDFORCLI').AsInteger        :=
            Cds.FieldByName('IDFORCLI').AsInteger;
         CdsRateioDispFinanc.Post;

         Cds.Next;
      end;
   end;
end;



procedure TfrmCadDisponibXUsuMT.GravaDispFinancAnt(sTipoReg,sTipo : String);
begin
   Cds.First;
   while not Cds.Eof do
   begin
      // DISPFINANC
      CdsDispFinanc.Insert;
      fIdDispFinanc := CtrlDisponibxusu.GetSequenceL;
      CdsDispFinanc.FieldByName('IDDISPFINANC').AsInteger    := fIdDispFinanc;
      CdsDispFinanc.FieldByName('VLRDISPFINANC').AsFloat     :=
         Cds.FieldByName('VALORDISP').AsFloat;
      CdsDispFinanc.FieldByName('TIPOREG').AsString          := sTipoReg;
      CdsDispFinanc.FieldByName('TIPO').AsString             := sTipo;
      CdsDispFinanc.FieldByName('IDMODULO').AsInteger        := Sistema.IdModulo;
      CdsDispFinanc.FieldByName('IDMODULOORIGEM').AsInteger  := Sistema.IdModulo;
      CdsDispFinanc.FieldByName('HISTORICO').AsString        :=
         Cds.FieldByName('HISTORICO').AsString;
      CdsDispFinanc.FieldByName('FLGEXCLUSAO').AsString      := 'N';
      CdsDispFinanc.FieldByName('DATADISPFINANC').AsDateTime := edDataBloqDisp.Date;
      CdsDispFinanc.Post;
      // RATEIODISPFINANC
      CdsRateioDispFinanc.Insert;
      CdsRateioDispFinanc.FieldByName('IDDISPFINANC').AsInteger   := fIdDispFinanc;
      CdsRateioDispFinanc.FieldByName('IDPLANO').AsInteger        :=
         Cds.FieldByName('IDPLANOPREV').AsInteger;
      CdsRateioDispFinanc.FieldByName('IDPATRO').AsInteger        :=
         Cds.FieldByName('IDPATRO').AsInteger;
      CdsRateioDispFinanc.FieldByName('VLRRATEIO').AsFloat        :=
         Cds.FieldByName('VALORDISP').AsFloat;
      CdsRateioDispFinanc.Post;

      Cds.Next;
   end;
end;



procedure TfrmCadDisponibXUsuMT.GravaDispFinanc(sTipoReg,sTipo : String);
var fCodLancFinanc : Integer;
begin
   Cds.First;
   fCodLancFinanc := 0;
   while not Cds.Eof do
   begin
      if fCodLancFinanc <> Cds.FieldByName('CODLANCFINANC').AsInteger then
      begin
         fCodLancFinanc := Cds.FieldByName('CODLANCFINANC').AsInteger;
         // DISPFINANC
         CdsDispFinanc.Insert;
         fIdDispFinanc := CtrlDisponibxusu.GetSequenceL;
         CdsDispFinanc.FieldByName('IDDISPFINANC').AsInteger    := fIdDispFinanc;
         CdsDispFinanc.FieldByName('VLRDISPFINANC').AsFloat     :=
            Cds.FieldByName('VALORDISP').AsFloat;
         CdsDispFinanc.FieldByName('TIPOREG').AsString          := sTipoReg;
         CdsDispFinanc.FieldByName('TIPO').AsString             := sTipo;
         CdsDispFinanc.FieldByName('IDMODULO').AsInteger        := Sistema.IdModulo;
         CdsDispFinanc.FieldByName('IDMODULOORIGEM').AsInteger  :=
            Cds.FieldByName('IDMODULO').AsInteger;
         CdsDispFinanc.FieldByName('HISTORICO').AsString        :=
            Cds.FieldByName('HISTORICO').AsString;
         CdsDispFinanc.FieldByName('FLGEXCLUSAO').AsString      := 'N';
         CdsDispFinanc.FieldByName('DATADISPFINANC').AsDateTime := edDataBloqDisp.Date;
         CdsDispFinanc.Post;
      end;
      while fCodLancFinanc = Cds.FieldByName('CODLANCFINANC').AsInteger do
      begin
         // RATEIODISPFINANC
         CdsRateioDispFinanc.Insert;
         CdsRateioDispFinanc.FieldByName('IDDISPFINANC').AsInteger   := fIdDispFinanc;
         CdsRateioDispFinanc.FieldByName('IDPLANO').AsInteger        :=
            Cds.FieldByName('IDPLANOPREV').AsInteger;
         CdsRateioDispFinanc.FieldByName('IDPATRO').AsInteger        :=
            Cds.FieldByName('IDPATRO').AsInteger;
         CdsRateioDispFinanc.FieldByName('VLRRATEIO').AsFloat        :=
            Cds.FieldByName('VALOR').AsFloat;
         CdsRateioDispFinanc.FieldByName('RECPAG').AsString          :=
            Cds.FieldByName('RECPAG').AsString;
         CdsRateioDispFinanc.FieldByName('CODTIPRECDES').AsString    :=
            Cds.FieldByName('CODTIPRECDES').AsString;
         CdsRateioDispFinanc.FieldByName('CODCENTRORESPON').AsString :=
            Cds.FieldByName('CODCENTRORESPON').AsString;
         CdsRateioDispFinanc.FieldByName('CODCENTROCUSTO').AsString  :=
            Cds.FieldByName('CODCENTROCUSTO').AsString;
         CdsRateioDispFinanc.FieldByName('CODTIPDOC').AsInteger      :=
            Cds.FieldByName('CODTIPDOC').AsInteger;
         CdsRateioDispFinanc.FieldByName('UNIDNEGOC').AsInteger      :=
            Cds.FieldByName('UNIDNEGOC').AsInteger;
         CdsRateioDispFinanc.Post;

         Cds.Next;

         if fCodLancFinanc <> Cds.FieldByName('CODLANCFINANC').AsInteger then
           fCodLancFinanc := 0;
      end;
   end;
end;



function TfrmCadDisponibXUsuMT.Sel(iIdPessoa : Integer;
                                dDataRef:TDateTime): OleVariant;
var sSql : string;
begin
   // Busca as Operações do Dia no Movimento Financeiro
   sSql :=
  'SELECT                                           '+
  '   UU.IDPLANO,UU.IDPATRO,UU.IDPESSOA,            '+
  '   UU.DATADISPFINANC,                            '+
  '   UU.SALDOANT,                                  '+
  '   UU.MOVFIN,                                    '+
  '   UU.VALORPAG,                                  '+
  '   UU.VALORREC,                                  '+
  '   UU.SALDOATUAL,                                '+
  '   PP.NOME AS PLANO,                             '+
  '   P.RAZAOSOCIAL AS PATRO                        '+
  'FROM                                             '+
  '   PESSOA P, PLANPREVCONTABIL PP,                '+
  '(                                                '+
  'SELECT                                           '+
  '    U.IDPLANO,U.IDPATRO,U.IDPESSOA,              '+
  '    U.DATADISPFINANC,                            '+
  '    SUM(U.SALDOANT) AS SALDOANT,                 '+
  '    SUM(U.MOVFIN) AS MOVFIN,                     '+
  '    SUM(U.VALORPAG) AS VALORPAG,                 '+
  '    SUM(U.VALORREC) AS VALORREC,                 '+
  '    SUM(U.SALDOANT + U.MOVFIN + U.VALORREC - U.VALORPAG) AS SALDOATUAL '+
  'FROM                                             '+
  '   (                                             '+
  '   (SELECT                                       '+
  '       RI.IDPLANO,RI.IDPATRO,RI.IDPESSOA,DI.DATADISPFINANC, '+
  '       SUM(DI.VLRDISPFINANC) AS SALDOANT,                   '+
  '       0 AS MOVFIN,                                         '+
  '       0 AS VALORPAG,                                       '+
  '       0 AS VALORREC,                                       '+
  '       0 AS SALDOATUAL                                      '+
  '    FROM                                                    '+
  '       DISPFINANC DI, RATEIODISPFINANC RI                   '+
  '    WHERE                                                   '+
  '       DI.IDDISPFINANC = RI.IDDISPFINANC                    '+
  '       AND (DI.DATADISPFINANC = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) '+
  '       AND (RI.IDPESSOA = '+IntToStr(iIdPessoa)+')            '+
  '       AND (DI.TIPOREG=''A'')                                 '+
  '    GROUP BY                                                  '+
  '       RI.IDPLANO,RI.IDPATRO,RI.IDPESSOA,DI.DATADISPFINANC )  '+
  '    UNION ALL                                                 '+
  '    (SELECT                                                   '+
  '       RI.IDPLANO,RI.IDPATRO,RI.IDPESSOA,DI.DATADISPFINANC,   '+
  '       0 AS SALDOANT,                                         '+
  '       SUM(DI.VLRDISPFINANC) AS MOVFIN,                       '+
  '       0 AS VALORPAG,                                         '+
  '       0 AS VALORREC,                                         '+
  '       0 AS SALDOATUAL                                        '+
  '    FROM                                                      '+
  '       DISPFINANC DI, RATEIODISPFINANC RI                     '+
  '    WHERE                                                     '+
  '       DI.IDDISPFINANC = RI.IDDISPFINANC                      '+
  '       AND (DI.DATADISPFINANC = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) '+
  '       AND (RI.IDPESSOA = '+IntToStr(iIdPessoa)+')            '+
  '       AND (DI.TIPOREG=''F'')                                 '+
  '    GROUP BY                                                  '+
  '       RI.IDPLANO,RI.IDPATRO,RI.IDPESSOA,DI.DATADISPFINANC )  '+
  '   UNION ALL                                                  '+
  '   (SELECT                                                    '+
  '       RI.IDPLANO,RI.IDPATRO,RI.IDPESSOA,DI.DATADISPFINANC,   '+
  '       0 AS SALDOANT,                                         '+
  '       0 AS MOVFIN,                                           '+
  '       SUM(DI.VLRDISPFINANC)*-1 AS VALORPAG,                  '+
  '       0 AS VALORREC,                                         '+
  '       0 AS SALDOATUAL                                        '+
  '    FROM                                                      '+
  '       DISPFINANC DI, RATEIODISPFINANC RI                     '+
  '    WHERE                                                     '+
  '       DI.IDDISPFINANC = RI.IDDISPFINANC                      '+
  '       AND (DI.DATADISPFINANC = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) '+
  '       AND (RI.IDPESSOA = '+IntToStr(iIdPessoa)+')            '+
  '       AND (DI.TIPOREG=''P'')                                 '+
  '    GROUP BY                                                  '+
  '       RI.IDPLANO,RI.IDPATRO,RI.IDPESSOA,DI.DATADISPFINANC )  '+
  '    UNION ALL                                                 '+
  '   (SELECT                                                    '+
  '       RI.IDPLANO,RI.IDPATRO,RI.IDPESSOA,DI.DATADISPFINANC,   '+
  '       0 AS SALDOANT,                                         '+
  '       0 AS MOVFIN,                                           '+
  '       0 AS VALORPAG,                                         '+
  '       SUM(DI.VLRDISPFINANC) AS VALORREC,                     '+
  '       0 AS SALDOATUAL                                        '+
  '    FROM                                                      '+
  '       DISPFINANC DI, RATEIODISPFINANC RI                     '+
  '    WHERE                                                     '+
  '       DI.IDDISPFINANC = RI.IDDISPFINANC                      '+
  '       AND (DI.DATADISPFINANC = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) '+
  '       AND (RI.IDPESSOA = '+IntToStr(iIdPessoa)+')            '+
  '       AND (DI.TIPOREG=''R'')                                 '+
  '    GROUP BY                                                  '+
  '       RI.IDPLANO,RI.IDPATRO,RI.IDPESSOA,DI.DATADISPFINANC )  '+
  '   ) U                                                        '+
  'GROUP BY                                                      '+
  '    U.IDPLANO,U.IDPATRO,U.IDPESSOA,                           '+
  '    U.DATADISPFINANC                                          '+
  ') UU                                                          '+
  'WHERE                                                         '+
  '   (UU.IDPATRO = P.IDPESSOA(+))                               '+
  '   AND (UU.IDPLANO = PP.IDPLANOPREV(+))                       ';


   qryAux.sql.add(ssql);
   //qryAux.sql.savetofile('c:\dispteste.txt');
   qryAux.sql.savetofile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\dispteste.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
end;



procedure TfrmCadDisponibXUsuMT.BitBtn2Click(Sender: TObject);
var
   bIncluiDisp : boolean;
begin
  inherited;
end;



procedure TfrmCadDisponibXUsuMT.BitBtn4Click(Sender: TObject);
begin
  inherited;
   Sel(Sistema.IdEmpresa,edDataBloqDisp.Date);
end;



procedure TfrmCadDisponibXUsuMT.MontaCdsUsuBloqLib;
begin
   if Trim(dblcUnidNegoc.Text) = '' then
      CdsUsuBloqueado.Data := CtrlDisponibxusu.SelecionaUsuBloqueado(-1)
   else
      CdsUsuBloqueado.Data := CtrlDisponibxusu.SelecionaUsuBloqueado(CdsGrupoAcessoIDGRUPO.AsInteger);

   CdsUsuLiberado.Data  := CtrlDisponibxusu.SelecionaUsuLiberado;
end;



procedure TfrmCadDisponibXUsuMT.dblcUnidNegocChange(Sender: TObject);
begin
  inherited;
   MontaCdsUsuBloqLib
end;



procedure TfrmCadDisponibXUsuMT.dbgSelDispSinteticaCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;
   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWindow;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmCadDisponibXUsuMT.dbgSelDispSinteticaTopRowChanged(Sender: TObject);
begin
  inherited;
   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmCadDisponibXUsuMT.dbgSelDispAnaliticaCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWindow;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmCadDisponibXUsuMT.dbgSelDispAnaliticaTopRowChanged(Sender: TObject);
begin
  inherited;
   // acerta as cores quando muda a linha da grid
   (Sender as TwwDBGrid).Invalidate;
end;

procedure TfrmCadDisponibXUsuMT.edDataBloqDispExit(Sender: TObject);
begin
  inherited;
   //AL_1
   if edDataBloqDisp.Date < Trunc(CdsParamFinanc.FieldByName('DATABLOQDISPFINAN').AsDateTime) then
   begin
      MsgDlg('A data do Bloqueio não pode ser menor que'#13+
             'a do último Fechamento de  Disponibilidade',
             'Atenção',mtWarning,[mbOk],0);
      edDataBloqDisp.Text := DateToStr(CdsParamFinanc.FieldByName('DATABLOQDISPFINAN').AsDateTime);
      if edDataBloqDisp.CanFocus then
         edDataBloqDisp.SetFocus;
   end
   else
   begin
      //AL_1
      if edDataBloqDisp.Date < Trunc(CdsParamFinanc.FieldByName('DATABLOQDISPFINAN').AsDateTime) then
      begin
         AtualizaBotoes;
      end;
   end;
end;



procedure TfrmCadDisponibXUsuMT.dbgUsuSistemaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  sLetrasBloqueado:=sLetrasBloqueado+uppercase(key); // acumula as letras digitadas
  CdsUsuBloqueado.LOCATE(CdsUsuBloqueadoNOMEUSUARIO.FieldName ,sLetrasBloqueado,[loPartialKey]);
{  begin
    sLetrasBloqueado := '';
    CdsUsuBloqueado.first;
    CdsUsuBloqueado.LOCATE(CdsUsuBloqueadoNOMEUSUARIO.FieldName ,sLetrasBloqueado,[loPartialKey]);
  end;
}
end;

procedure TfrmCadDisponibXUsuMT.dbgUsuSistemaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
 If (KEY=38) or (key=40) then // avalio se é seta para cima ou para baixo;
   sLetrasBloqueado:='';
end;

procedure TfrmCadDisponibXUsuMT.dbgUsuDiponibKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
 If (KEY=38) or (key=40) then // avalio se é seta para cima ou para baixo;
   sLetrasLiberado :='';

end;

procedure TfrmCadDisponibXUsuMT.dbgUsuDiponibKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  sLetrasLiberado:=sLetrasLiberado+uppercase(key); // acumula as letras digitadas
  CdsUsuLiberado.LOCATE(CdsUsuLiberadoNOMEUSUARIO.FieldName ,sLetrasLiberado,[loPartialKey]);
{  begin
    sLetrasLiberado := '';
    CdsUsuLiberado.First;
    CdsUsuLiberado.LOCATE(CdsUsuLiberadoNOMEUSUARIO.FieldName ,sLetrasLiberado,[loPartialKey]);
  end;
}
end;

procedure TfrmCadDisponibXUsuMT.FormClick(Sender: TObject);
begin
  inherited;
  sLetrasBloqueado := '';
  sLetrasLiberado  := '';
end;

end.
