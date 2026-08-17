unit fCadBenSeguro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr,
  StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, DBCtrls, Mask, uDataBase, TREdit, UMensErro,
  Menus, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmCadBenSeguro = class(TfrmCadMestreDetalheCS)
    Label1: TLabel;
    DBText1: TDBText;
    Label2: TLabel;
    DBText2: TDBText;
    DBText3: TDBText;
    Label3: TLabel;
    DBText4: TDBText;
    Label4: TLabel;
    DBText5: TDBText;
    Label5: TLabel;
    DBText6: TDBText;
    Label6: TLabel;
    DBText7: TDBText;
    Label7: TLabel;
    DBText8: TDBText;
    Label8: TLabel;
    DBText9: TDBText;
    Label9: TLabel;
    msInserir: TMontaSelect;
    DBText10: TDBText;
    Label10: TLabel;
    DBText11: TDBText;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    edtNomePessoa: TEdit;
    qryMestre: TwwQuery;
    dsMestre: TwwDataSource;
    qryMestreIDPESSOA: TFloatField;
    qryMestreINSCRICAONUMERO: TStringField;
    qryMestreNOME: TStringField;
    qryMestrePATROCINADORA: TStringField;
    qryMestreDATAENTRADA: TDateTimeField;
    qryMestreDATANASC: TDateTimeField;
    qryMestreIDADE: TFloatField;
    qryMestreSEXO: TStringField;
    qryMestreESTCIVIL: TStringField;
    qryMestreFORMAPAGTO: TStringField;
    qryMestreIDPLANASS: TFloatField;
    qryMestrePLANO: TStringField;
    qryMestreSITUACAO: TStringField;
    qryBENEFICIARIO: TStringField;
    qryIDBENEFSEGURO: TFloatField;
    qryTITULAR: TStringField;
    qryIDTITULAR: TFloatField;
    qryPLANO: TStringField;
    qryVALORPERCENT: TFloatField;
    edtPercentual: TRealEdit;
    PopupMenu1: TPopupMenu;
    pmgrid1: TMenuItem;
    pmgrid2: TMenuItem;
    pmgrid3: TMenuItem;
    qryMestreIDPESSJUR: TFloatField;
    qryMestreIDPLANOPREV: TFloatField;
    tbsCancelar: TTabSheet;
    Label14: TLabel;
    Label15: TLabel;
    dtDataCancel: TCMDateTimePicker;
    EdtMotivoCancel: TEdit;
    qrySITUACAO: TStringField;
    qryDATACANCEL: TDateTimeField;
    qryMOTIVOCANCEL: TStringField;
    Label16: TLabel;
    dtDataNasc: TCMDateTimePicker;
    procedure sbtnInsDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure CmeDetalheAtualizaBotoes(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure pmgrid1Click(Sender: TObject);
    procedure pmgrid2Click(Sender: TObject);
    procedure pmgrid3Click(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure edtNomePessoaKeyPress(Sender: TObject; var Key: Char);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure dbgrdDetCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
  private
    { Private declarations }
    sUltId: String;
    sSQL  : String;
    CancelarBenef: Boolean;
    Procedure EnabButtons(St:Boolean;Bt:Byte);
  public
    { Public declarations }
  end;

var
  frmCadBenSeguro: TfrmCadBenSeguro;

implementation

uses DBaseDados, UAdmAss;

{$R *.DFM}

Procedure TfrmCadBenSeguro.EnabButtons(St:Boolean;Bt:Byte);
begin
  Case Bt Of
    0: bBtnConfirmar.Enabled:=St;
    1: bBtnSair.Enabled:=St;
    2: begin
         bBtnConfirmar.Enabled:=St;
         bBtnSair.Enabled:=St;
       end;
  end;
end;

procedure TfrmCadBenSeguro.sbtnInsDetClick(Sender: TObject);
begin
  (* Rotinas diversas *)
  EnabButtons(False,2);
  sbtnInsDet.Down := true;
  edtNomePessoa.Text:='';
  edtPercentual.Text:='0.00';

  (* Rotinas padrão *)
  grdAtual.SendToBack;
  tb97Detalhe.Visible := true;
  CmeDetalhe.Atualizabotoes(Self);
  edtNomePessoa.SetFocus;
end;

procedure TfrmCadBenSeguro.bbtnOkDetClick(Sender: TObject);
Var qryAux: TQuery;

{sub} (* Verifica se campos estão preenchidos *)
Function ExisteErro: Boolean;
Var cCh  : Char;
    sSt  : String;
    fPerc: Double;
    Erro : Integer;
begin
  cCh:=#0;
  sSt:=edtPercentual.Text;
  Val(sSt,fPerc,Erro);
  If (Erro<>0)Or(fPerc=0) then cCh:='1'
  else If edtNomePessoa.Text = '' then cCh:='2';
  Case cCh of
    '1' : MsgDlg('Percentual não preenchido.','Erro',mtError,[mbOk,mbHelp],0);
    '2' : MsgDlg('Nome não preenchido.','Erro',mtError,[mbOk,mbHelp],0);
  end;
  Case cCh Of
    '1' : edtPercentual.SetFocus;
    '2' : edtNomePessoa.SetFocus;
  end;
  ExisteErro:=cCh<>#0;
end;

{sub} (* Verifica se campos do cancelamento estão preenchidos *)
Function ExisteErroCancel: Boolean;
Var cCh  : Char;
begin
  cCh:=#0;
  If Not DataValida(DateToStr(dtDataCancel.Date),False) then cCh:='1'
  else If edtMotivoCancel.Text = '' then cCh:='2';
  Case cCh of
    '1' : MsgDlg('Data de cancelamento não preenchido.','Erro',mtError,[mbOk,mbHelp],0);
    '2' : MsgDlg('Motivo do cancelamento não preenchido.','Erro',mtError,[mbOk,mbHelp],0);
  end;
  Case cCh Of
    '1' : dtDataCancel.SetFocus;
    '2' : edtMotivoCancel.SetFocus;
  end;
  ExisteErroCancel:=cCh<>#0;
end;

begin
  (* Cria query em tempo de execução e prepara para execução *)
  qryAux := TQuery.Create(Application);
  qryAux.DataBaseName:='BaseDados';

  (* HABILITA O BOTAO OK - CONFIRMAR *)
  EnabButtons(True,0);

  If CancelarBenef then
  begin
     If Not ExisteErroCancel then
     begin
       CancelarBenef:=False;
       sUltId:=qryIDBENEFSEGURO.AsString;

       (* Delete na tabela BensegAss - QryAux *)

       (* FLGATIVO = 1 - BENEFICIÁRIO ATIVO     *)
       (*            0 - BENEFICIÁRIO CANCELADO *)

       (* Os registros não serão deletados nas tabelas. Será feito apenas um *)
       (* update na tabela BENSEGASS para colocá-lo como CANCELADO.          *)

       sSQL:='UPDATE BENSEGASS'+
             ' SET'+
             ' FLGATIVO     = 0,'+                  // FLGATIVO
             ' DATACANCEL   = TO_DATE('''+DateToStr(dtDataCancel.Date)+''',''DD/MM/YYYY''),'+
             ' MOTIVOCANCEL = '+Chr(39)+edtMotivoCancel.Text+Chr(39)+
             ' WHERE'+
             ' IDBENEFSEGURO = '+sUltId;        // IDBENEFSEGURO
       (* Executa update na tabela BENSEGASS *)
       qryAux.SQL.Clear;
       qryAux.SQL.Add(sSQL);

       try
         qryAux.ExecSQL;
       except
         dtmBaseDados.dbBaseDados.Rollback;
         MsgDlg('Ocorreu um erro durante a transação. Operação será cancelada.',
                 'Erro',mtError,[mbOk,mbHelp],0);
         Abort;
       end;
       PgCtrlDetalhe.ActivePage:=tbsDet;
       tbsCancelar.Enabled:=False;
       qry.Close;
       qry.Open;
       Exit;
     end else Exit; {ExisteErroCancel}
  end;

  (* Verifica se campos estão preenchidos *)
  If ExisteErro then Abort;

  (* Insert na tabela Pessoa - QryAux *)
  If sbtnInsDet.Down Then
  Begin
   (* Vê o ultimo ID da tabela pessoa p/gravar no IDBENEFSEGURO *)
    sUltId:=IntToStr(LeUltRegistro(nil,'PESSOA'));

    sSQL:='INSERT INTO PESSOA'+
           ' (IDPESSOA,NOME,TIPO)'+
           ' VALUES'+
           ' ('+sUltId+','+Chr(39)+           // IDPESSOA
           edtNomePessoa.Text+Chr(39)+', '+  // NOME
           Chr(39)+'F'+Chr(39)+')';          // TIPO
  End
 (* Edit na tabela Pessoa - QryExec *)
  Else if sbtnAltDet.Down Then
  Begin
     sSQL:='UPDATE PESSOA' +
           ' SET NOME = '''+edtNomePessoa.Text+''''+     //   NOME
           ' WHERE IDPESSOA = '+sUltId;
  End;
 (* Executa a query *)
  qryAux.SQL.Clear;
  qryAux.SQL.Add(sSQL);
  try
    qryAux.ExecSQL;
  except
    dtmBaseDados.dbBaseDados.Rollback;
    MsgDlg('Ocorreu um erro durante a transação. Operação será cancelada.',
            'Erro',mtError,[mbOk,mbHelp],0);
    Abort;
  end;


  if sbtnInsDet.Down
  then begin
     sSQL:='INSERT INTO PESSOAFISICA'+
            ' (IDPESSOA,DATANASC)'+
            ' VALUES'+
            ' ('+sUltId+', TO_DATE('''+dtDataNasc.Text+''',''DD/MM/YYYY'') ) ';
     try
       qryAux.SQL.Clear;
       qryAux.SQL.Add(sSQL);
       qryAux.ExecSQL;
     except
       dtmBaseDados.dbBaseDados.Rollback;
       MsgDlg('Ocorreu um erro durante a transação. Operação será cancelada.',
               'Erro',mtError,[mbOk,mbHelp],0);
       Abort;
     end;
  end
  else begin
     sSQL:='UPDATE PESSOAFISICA SET DATANASC = TO_DATE('''+dtDataNasc.Text+''',''DD/MM/YYYY'')  '+
           'WHERE  IDPESSOA = '+sUltId;
     try
       qryAux.SQL.Clear;
       qryAux.SQL.Add(sSQL);
       qryAux.ExecSQL;
     except
       dtmBaseDados.dbBaseDados.Rollback;
       MsgDlg('Ocorreu um erro durante a transação. Operação será cancelada.',
               'Erro',mtError,[mbOk,mbHelp],0);
       Abort;
     end;
  end;

 (* FLGATIVO = 1 - BENEFICIÁRIO ATIVO     *)
 (*            0 - BENEFICIÁRIO CANCELADO *)

 (* insert na tabela BenSegAss - QryExec *)
  If sbtnInsDet.Down Then
  Begin
    DecimalSeparator:='.';
    sSQL:='INSERT INTO BENSEGASS'+
          ' (IDBENEFSEGURO,'+
          ' IDTITULAR,'+
          ' IDPLANASS,'+
          ' IDPESSJUR,'+
          ' IDPLANOPREV,'+
          ' FLGATIVO,'+
          ' VALORPERCENT)'+
          ' VALUES'+
          '('+sUltId+','+                                        // IDBENEFSEGURO
          qryMestreIDPESSOA.AsString+','+                        // IDTITULAR
          qryMestreIDPLANASS.AsString+','+                       // IDPLANASS
          qryMestreIDPESSJUR.AsString+','+                       // IDPESSJUR
          qryMestreIDPLANOPREV.AsString+','+                     // IDPLANOPREV
          '1,'+                                                  // FLGATIVO
          FloatToStrF(edtPercentual.Value,ffGeneral,10,2)+')';   // VALORPERCENT
    DecimalSeparator:='.';
  End
 (* edit na tabela BenSegAss - QryExec *)
  Else If sbtnAltDet.Down Then Begin
    DecimalSeparator:='.';
    sSQL:='UPDATE BENSEGASS'+
          ' SET '+
          ' VALORPERCENT = '+                // VALOR DO PERCENTUAL
          FloatToStrF(edtPercentual.Value,ffGeneral,10,2)+
          ' WHERE '+
          ' IDBENEFSEGURO = '+sUltId;        // IDBENEFSEGURO
    DecimalSeparator:='.';
  End;
 (* Executa a query *)
  qryAux.SQL.Clear;
  qryAux.SQL.Add(sSQL);
  try
    qryAux.ExecSQL;
  except
    dtmBaseDados.dbBaseDados.Rollback;
    MsgDlg('Ocorreu um erro durante a transação. Operação será cancelada.',
            'Erro',mtError,[mbOk,mbHelp],0);
    Abort;
  end;
  edtNomePessoa.Text:='';
  edtPercentual.Text:='0';
  edtNomePessoa.SetFocus;
  qry.Close;
  qry.Open;
  inherited;
end;

procedure TfrmCadBenSeguro.sbtnInserirClick(Sender: TObject);
Var lTemReg: Boolean;
begin
  msInserir.Executar;
  If msInserir.RetornouValor Then
   Begin
    sbtnInserir.Down:=True;
    pmgrid1.Visible:=True;
    pmgrid2.Enabled:=False;
    pmgrid3.Visible:=False;

   (* Query de Dados do Participante (qryMestre) *)
    qryMestre.Close;
    //qryMestre.ParamByName('IDPESSOA').AsInteger:=strtoint(MsInserir.ValoresChave[0]);
    qryMestre.ParamByName('IDPESSOA').Value:=MsInserir.ValoresChave[0];

    qryMestre.Open;

   (* Query de Dados dos Beneficiários *)
    qry.Close;
    qry.SQL.Clear;
    sSQL := 'SELECT PB.NOME AS BENEFICIARIO,'+
            '       BE.IDBENEFSEGURO,'+
            '       PT.NOME AS TITULAR,'+
            '       BE.IDTITULAR,'+
            '       UPPER(PL.NOME) AS PLANO,'+
            ' DECODE(BE.FLGATIVO,0,''CANCELADO'',1,''NORMAL'') AS SITUACAO,'+
            ' BE.DATACANCEL,'+
            ' BE.MOTIVOCANCEL,'+
            ' BE.VALORPERCENT'+
            ' FROM PESSOA    PT,'+
            '     PESSOA    PB,'+
            '     BENSEGASS BE,'+
            '     PLANASS   PL'+
            ' WHERE (BE.IDBENEFSEGURO = PB.IDPESSOA)   AND'+
            '      (BE.IDTITULAR     = PT.IDPESSOA)   AND'+
            '      (BE.IDPLANASS     = PL.IDPLANASS)  AND'+
         //   '      (BE.FLGATIVO      = 1)             AND'+
            '      (BE.IDTITULAR     = '+MsInserir.ValoresChave[0]+')';
    qry.SQL.Add(sSQL);
    qry.Open;
    {CmeCadastro.Operacao := opInserir;}
    CmeCadastro.RepetirInsert := True;
    CmeCadastro.AtualizaBotoes(Self);
    if (qryAtual <> nil) and (not qryAtual.IsEmpty) then lTemReg := true
    else lTemReg := false;

    sbtnInsDet.Enabled   := (Not sbtnAltDet.Down);
    sbtnAltDet.Enabled   := lTemReg And (Not sbtnInsDet.Down);
    sbtnExcluiDet.Enabled:= lTemReg And (Not sbtnInsDet.Down) And (Not sbtnAltDet.Down);
   (* Inicia a transação *)
    if not dtmBaseDados.dbBaseDados.InTransaction then
       dtmBaseDados.dbBaseDados.StartTransaction;
   End;
end;

procedure TfrmCadBenSeguro.CmeDetalheAtualizaBotoes(Sender: TObject);
Var lTemReg : Boolean;
begin
  If (sbtnInserir.Down) then
  begin
    If (qryAtual <> nil) and (not qryAtual.IsEmpty) then lTemReg := true
    else lTemReg := false;

    sbtnInsDet.Enabled   := (Not sbtnAltDet.Down);
    sbtnAltDet.Enabled   := lTemReg And (Not sbtnInsDet.Down);
    sbtnExcluiDet.Enabled:= lTemReg And (Not sbtnInsDet.Down) And (Not sbtnAltDet.Down);
  end
  else
  If (sbtnExcluiDet.Down) then
  begin
    If (qryAtual <> nil) and (not qryAtual.IsEmpty) then lTemReg := true
    else lTemReg := false;

    sbtnInsDet.Enabled   := (Not sbtnExcluiDet.Down);
    sbtnAltDet.Enabled   := lTemReg And (Not sbtnExcluiDet.Down);
    sbtnExcluiDet.Enabled:= lTemReg And (Not sbtnInsDet.Down) And (Not sbtnAltDet.Down);
  end
  else
  begin
    sbtnInsDet.Enabled   := false;
    sbtnAltDet.Enabled   := false;
    sbtnExcluiDet.Enabled:= false;
  end;
end;

procedure TfrmCadBenSeguro.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  sbtnInsDet.Down:=False;
  sbtnAltDet.Down:=False;
  sbtnExcluiDet.Down:=False;
  EnabButtons(True,2);
  sbtnInsDet.Enabled:=True;
  sbtnAltDet.Enabled:=True;
  sbtnExcluiDet.Enabled:=True;
  qry.Close;
  qry.Open;
end;

procedure TfrmCadBenSeguro.sbtnAltDetClick(Sender: TObject);
begin
 (* Rotinas diversas *)
  If qry.FieldByName('SITUACAO').AsString='CANCELADO' then Exit;
  EnabButtons(False,2);
  sbtnAltDet.Down := true;
  edtNomePessoa.Text:=qryBENEFICIARIO.AsString;
  edtPercentual.Text:=qryVALORPERCENT.AsString;

  sUltId:=qryIDBENEFSEGURO.AsString;
 (* Rotinas padrão *)
  grdAtual.SendToBack;
  tb97Detalhe.Visible := true;
  CmeDetalhe.Atualizabotoes(Self);
  If Not qry.IsEmpty then edtNomePessoa.SetFocus;
end;

procedure TfrmCadBenSeguro.bbtnCancelarClick(Sender: TObject);
begin
  if dtmBaseDados.dbBaseDados.InTransaction then
     dtmBaseDados.dbBaseDados.Rollback;
  sbtnInsDet.Down:=False;
  sbtnAltDet.Down:=False;
  sbtnExcluiDet.Down:=False;
  qry.Close;
  qry.Open;
  EnabButtons(True,2);
  inherited;
end;

procedure TfrmCadBenSeguro.bbtnConfirmarClick(Sender: TObject);
begin
  if dtmBaseDados.dbBaseDados.InTransaction then
     dtmBaseDados.dbBaseDados.Commit;
  CmeCadastro.AtualizaBotoes(Self);
  bbtnCancelarClick(Self);
  EnabButtons(True,2);
  sbtnInsDet.Down:=False;
  sbtnAltDet.Down:=False;
  sbtnExcluiDet.Down:=False;
  sbtnInsDet.Enabled:=True;
  sbtnAltDet.Enabled:=True;
  sbtnExcluiDet.Enabled:=True;
  qry.Close;
  qry.Open;
end;

procedure TfrmCadBenSeguro.sbtnExcluiDetClick(Sender: TObject);
begin
  CancelarBenef:=False;
  If qry.FieldByName('SITUACAO').AsString='CANCELADO' then Exit;
  If MsgDlg('Deseja realmente CANCELAR este registro?',
            'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes Then
    CancelarBenef:=True;
  If CancelarBenef then
  begin
    sbtnExcluiDet.Down:=True;
    PgCtrlDetalhe.ActivePage:=tbsCancelar;
    tbsCancelar.Enabled:=True;
    tb97Detalhe.Visible:=True;

    (* Rotinas padrão *)
    grdAtual.SendToBack;
    tb97Detalhe.Visible := true;
    CmeDetalhe.Atualizabotoes(Self);
  end;
end;

procedure TfrmCadBenSeguro.pmgrid1Click(Sender: TObject);
begin
  inherited;
  sbtnInsDet.Enabled := False;
  sbtnAltDet.Enabled := False;
  sbtnExcluiDet.Enabled := False;

  pmgrid1.Visible := False;
  pmgrid2.Enabled := True;
  pmgrid3.Visible := True;

 (* Query de Dados dos Beneficiários *)
  qry.Close;
  qry.SQL.Clear;
  sSQL := 'SELECT PB.NOME AS BENEFICIARIO,'+
          '       BE.IDBENEFSEGURO,'+
          '       PT.NOME AS TITULAR,'+
          '       BE.IDTITULAR,'+
          '       UPPER(PL.NOME) AS PLANO,'+
          ' DECODE(BE.FLGATIVO,0,''CANCELADO'',1,''NORMAL'') AS SITUACAO,'+
          ' BE.DATACANCEL,'+
          ' BE.MOTIVOCANCEL,'+
          ' BE.VALORPERCENT'+
          ' FROM PESSOA    PT,'+
          '     PESSOA    PB,'+
          '     BENSEGASS BE,'+
          '     PLANASS   PL'+
          ' WHERE (BE.IDBENEFSEGURO = PB.IDPESSOA)   AND'+
          '      (BE.IDTITULAR     = PT.IDPESSOA)   AND'+
          '      (BE.IDPLANASS     = PL.IDPLANASS)  AND'+
//          '      (BE.FLGATIVO      = 1)             AND'+
          '      (BE.IDTITULAR     = '+MsInserir.ValoresChave[0]+')';
  qry.SQL.Add(sSQL);
  qry.Open;
end;

procedure TfrmCadBenSeguro.pmgrid2Click(Sender: TObject);
Var qryAux : TQuery;
    lTemReg: Boolean;
begin
  inherited;
  if MsgDlg('Deseja realmente RESTAURAR este registro?',
            'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes Then
   Begin
     sUltId:=qryIDBENEFSEGURO.AsString;
    (* Cria query auxiliar *)
     qryAux := TQuery.Create(Application);
     qryAux.DataBaseName:='BaseDados';

     (* Restaura na tabela BensegAss - QryAux *)

     (* FLGATIVO = 1 - BENEFICIÁRIO ATIVO     *)
     (*            0 - BENEFICIÁRIO CANCELADO *)

     (* Os registros não serão deletados nas tabelas. Será feito apenas um *)
     (* update na tabela BENSEGASS para colocá-lo como CANCELADO.          *)

     sSQL:='UPDATE BENSEGASS'+
           ' SET '+
           ' FLGATIVO = 0'+                // FLGATIVO
           ' WHERE '+
           ' IDBENEFSEGURO = '+sUltId;        // IDBENEFSEGURO

    (* Executa update na tabela BENSEGASS *)
     qryAux.SQL.Clear;
     qryAux.SQL.Add(sSQL);
     try
       qryAux.ExecSQL;
     except
       dtmBaseDados.dbBaseDados.Rollback;
       MsgDlg('Ocorreu um erro durante a transação. Operação será cancelada.',
               'Erro',mtError,[mbOk,mbHelp],0);
       Abort;        
     end;

    (* Query de Dados dos Beneficiários *)
     qry.Close;
     qry.SQL.Clear;
     sSQL := 'SELECT PB.NOME AS BENEFICIARIO,'+
             '       BE.IDBENEFSEGURO,'+
             '       PT.NOME AS TITULAR,'+
             '       BE.IDTITULAR,'+
             '       UPPER(PL.NOME) AS PLANO,'+
             ' DECODE(BE.FLGATIVO,0,''CANCELADO'',1,''NORMAL'') AS SITUACAO,'+
             ' BE.DATACANCEL,'+
             ' BE.MOTIVOCANCEL,'+
             ' BE.VALORPERCENT'+
             ' FROM PESSOA    PT,'+
             '     PESSOA    PB,'+
             '     BENSEGASS BE,'+
             '     PLANASS   PL'+
             ' WHERE (BE.IDBENEFSEGURO = PB.IDPESSOA)   AND'+
             '      (BE.IDTITULAR     = PT.IDPESSOA)   AND'+
             '      (BE.IDPLANASS     = PL.IDPLANASS)  AND'+
//             '      (BE.FLGATIVO      = 1)             AND'+
             '      (BE.IDTITULAR     = '+MsInserir.ValoresChave[0]+')';
     qry.SQL.Add(sSQL);
     qry.Open;

     if (qryAtual <> nil) and (not qryAtual.IsEmpty) then lTemReg := true
     else lTemReg := false;

     sbtnInsDet.Enabled := (Not sbtnAltDet.Down);
     sbtnAltDet.Enabled := lTemReg And (Not sbtnInsDet.Down);
     sbtnExcluiDet.Enabled := lTemReg And (Not sbtnInsDet.Down) And (Not sbtnAltDet.Down);

     pmgrid1.Visible := True;
     pmgrid2.Enabled := False;
     pmgrid3.Visible := False;
   End;
end;

procedure TfrmCadBenSeguro.pmgrid3Click(Sender: TObject);
Var lTemReg: Boolean;
begin
  inherited;
 (* Query de Dados dos Beneficiários *)
  qry.Close;
  qry.SQL.Clear;
  sSQL := 'SELECT PB.NOME AS BENEFICIARIO,'+
          '       BE.IDBENEFSEGURO,'+
          '       PT.NOME AS TITULAR,'+
          '       BE.IDTITULAR,'+
          '       UPPER(PL.NOME) AS PLANO,'+
          ' DECODE(BE.FLGATIVO,0,''CANCELADO'',1,''NORMAL'') AS SITUACAO,'+
          ' BE.DATACANCEL,'+
          ' BE.MOTIVOCANCEL,'+
          ' BE.VALORPERCENT'+
          ' FROM PESSOA    PT,'+
          '     PESSOA    PB,'+
          '     BENSEGASS BE,'+
          '     PLANASS   PL'+
          ' WHERE (BE.IDBENEFSEGURO = PB.IDPESSOA)   AND'+
          '      (BE.IDTITULAR     = PT.IDPESSOA)   AND'+
          '      (BE.IDPLANASS     = PL.IDPLANASS)  AND'+
//          '      (BE.FLGATIVO      = 1)             AND'+
          '      (BE.IDTITULAR     = '+MsInserir.ValoresChave[0]+')';
  qry.SQL.Add(sSQL);
  qry.Open;

  If (qryAtual <> nil) and (not qryAtual.IsEmpty) then lTemReg:= true
  else lTemReg:= false;

  sbtnInsDet.Enabled   := (Not sbtnAltDet.Down);
  sbtnAltDet.Enabled   := lTemReg And (Not sbtnInsDet.Down);
  sbtnExcluiDet.Enabled:= lTemReg And (Not sbtnInsDet.Down) And (Not sbtnAltDet.Down);

  pmgrid1.Visible:= True;
  pmgrid2.Enabled:= False;
  pmgrid3.Visible:= False;
end;

procedure TfrmCadBenSeguro.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  EnabButtons(True,2);
end;

procedure TfrmCadBenSeguro.edtNomePessoaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
 (* Desabilita o botão Ok - Confirmar *)
  EnabButtons(False,0);
end;

procedure TfrmCadBenSeguro.sbtnProcurarClick(Sender: TObject);
Var lTemReg : Boolean;
begin
  msInserir.Executar;
  If msInserir.RetornouValor Then
   Begin
    sbtnInserir.Visible:=False;
    pmgrid1.Visible:=True;
    pmgrid2.Enabled:=False;
    pmgrid3.Visible:=False;

   (* Query de Dados do Participante (qryMestre) *)
    qryMestre.Close;
    //qryMestre.ParamByName('IDPESSOA').AsInteger:=strtoint(MsInserir.ValoresChave[0]);
    qryMestre.ParamByName('IDPESSOA').Value:=MsInserir.ValoresChave[0];

    qryMestre.Open;

   (* Query de Dados dos Beneficiários *)
    qry.Close;
    qry.SQL.Clear;
    sSQL := 'SELECT PB.NOME AS BENEFICIARIO,'+
            '       BE.IDBENEFSEGURO,'+
            '       PT.NOME AS TITULAR,'+
            '       BE.IDTITULAR,'+
            '       UPPER(PL.NOME) AS PLANO,'+
            ' DECODE(BE.FLGATIVO,0,''CANCELADO'',1,''NORMAL'') AS SITUACAO,'+
            ' BE.DATACANCEL,'+
            ' BE.MOTIVOCANCEL,'+
            ' BE.VALORPERCENT'+
            ' FROM PESSOA    PT,'+
            '     PESSOA    PB,'+
            '     BENSEGASS BE,'+
            '     PLANASS   PL'+
            ' WHERE (BE.IDBENEFSEGURO = PB.IDPESSOA)   AND'+
            '      (BE.IDTITULAR     = PT.IDPESSOA)   AND'+
            '      (BE.IDPLANASS     = PL.IDPLANASS)  AND'+
//            '      (BE.FLGATIVO      = 1)             AND'+
            '      (BE.IDTITULAR     = '+MsInserir.ValoresChave[0]+')';
    qry.SQL.Add(sSQL);
    qry.Open;
    //CmeCadastro.Operacao := opInserir;
    //CmeCadastro.RepetirInsert := True;
    //CmeCadastro.AtualizaBotoes(Self);
    if (qryAtual <> nil) and (not qryAtual.IsEmpty) then lTemReg := true
    else lTemReg := false;

    If ltemReg then
    begin
      sbtnInsDet.Down:=False;
      sbtnAltDet.Down:=False;
      sbtnExcluiDet.Down:=False;
      sbtnInsDet.Enabled:=True;
      sbtnAltDet.Enabled:=True;
      sbtnExcluiDet.Enabled:=True;
    end;

    sbtnInsDet.Enabled   := (Not sbtnAltDet.Down);
    sbtnAltDet.Enabled   := lTemReg And (Not sbtnInsDet.Down);
    sbtnExcluiDet.Enabled:= lTemReg And (Not sbtnInsDet.Down) And (Not sbtnAltDet.Down);
   (* Inicia a transação *)
    if not dtmBaseDados.dbBaseDados.InTransaction then
       dtmBaseDados.dbBaseDados.StartTransaction;
   End;
end;

procedure TfrmCadBenSeguro.dbgrdDetCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  If qry.FieldByName('SITUACAO').AsString='CANCELADO' then Afont.Color:= $008686FF
  else AFont.Color:= clBlack;
end;

end.
