unit FCadNumeroProtoco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, StdCtrls, Mask, wwdbedit, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery,FMapaPrevi;

type
  TfrmCadNumeroProtoco = class(TfrmSairAjuda)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtDemonstrativo: TwwDBEdit;
    edtAno: TwwDBEdit;
    edtNumeroProtocolo: TwwDBEdit;
    edtDataEnvio: TwwDBEdit;
    bbtnCancelar: TBitBtn;
    BitBtn1: TBitBtn;
    qryRegistros: TwwQuery;
    qryUp: TwwQuery;
    edtHoraEnvio: TwwDBEdit;
    Label5: TLabel;
    edtSemestre: TwwDBEdit;
    Label6: TLabel;
    qryDet: TwwQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure edtAnoChange(Sender: TObject);
    procedure edtSemestreChange(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure edtAnoKeyPress(Sender: TObject; var Key: Char);
    procedure edtSemestreKeyPress(Sender: TObject; var Key: Char);
    procedure edtNumeroProtocoloKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ValidaRegistros;
    procedure GravaNumeroProtocolo;
    procedure AtualizaDemonstrativoSexoIdade;
    procedure AtualizaDemonstrativoEstatistico;
    procedure RegistraProtocolo;
    procedure SetCampos(vflgEstatistico :boolean;vflgSexoIdade :boolean;vAnorRef,vSemestreRef, vCNPJ,vCodEntidade,vNumProtocolo :String);
  end;

var
  frmCadNumeroProtoco: TfrmCadNumeroProtoco;
  flgEstatistico       :boolean;
  flgSexoIdade         :boolean;
  AnorRef              :String;
  SemestreRef          :String;
  CNPJ                 :String;
  CodEntidade          :String;

  flgAuxEstatistico       :boolean;
  flgAuxSexoIdade         :boolean;
  AnorAuxRef              :String;
  SemesAuxtreRef          :String;
  CNPJAux                 :String;
  CodAuxEntidade          :String;
  NumProtocolo            :String;

implementation
uses DBaseDados,FPreview,UMensErro,UDataBase,USistema;
{$R *.DFM}

procedure TfrmCadNumeroProtoco.ValidaRegistros;
begin

end;

procedure TfrmCadNumeroProtoco.BitBtn1Click(Sender: TObject);
var
  qryValida : TwwQuery;
  sSql      : String;
begin


  inherited;
  if (edtNumeroProtocolo.text ='') then begin
     MsgDlg('Número de Protocolo é Obrigatório! Favor Verificar!', 'Informação', mtInformation, [mbOk], 0);
         exit;
  end;
  if(edtDemonstrativo.text ='') then begin
     MsgDlg('Demonstrativo é Obrigatório! Favor Verificar!', 'Informação', mtInformation, [mbOk], 0);
         exit;
  end;
  if (edtDataEnvio.text ='')or(edtHoraEnvio.Text = '')then begin
       MsgDlg('Data e hora são Obrigatórios! Favor Verificar!', 'Informação', mtInformation, [mbOk], 0);
         exit;
  end;
   if (edtAno.text = '')or((edtSemestre.Text = '')and (flgEstatistico))then begin
       MsgDlg('Ano/Semestre são Obrigatórios! Favor Verificar!', 'Informação', mtInformation, [mbOk], 0);
         exit;
  end;

  qryValida   := TwwQuery.Create(Application);
  qryValida.DatabaseName := 'BaseDados';
  try
    {sSql := ' SELECT NUMEROPROTOCOLO FROM MPREVICARQSPC '+
              '  WHERE NUMEROPROTOCOLO = '+edtNumeroProtocolo.Text;
    qryValida.close;
    qryValida.SQL.Clear;
    qryValida.SQL.Add(sSql);
    qryValida.Prepare;
    qryValida.open;

    if not qryValida.IsEmpty then begin
         MsgDlg('Número de Protocolo já cadastrado! Favor Verificar!', 'Informação', mtInformation, [mbOk], 0);
         exit;
    end; }

    if (flgSexoIdade) then begin
      sSql := ' SELECT NUMPROTOCOLO FROM MPREVICDEMONESTIDSEX '+
              '  WHERE NUMPROTOCOLO = '+edtNumeroProtocolo.Text;
      qryValida.close;
      qryValida.SQL.Clear;
      qryValida.SQL.Add(sSql);
      qryValida.Prepare;
      qryValida.open;

      if not qryValida.IsEmpty then begin
         MsgDlg('Número de Protocolo cadastrado para outro demonstrativo de Sexo e Idade! Favor Verificar!', 'Informação', mtInformation, [mbOk], 0);
         // sem necessidade eu acho, só acho!
         //if (MsgDlg('Deseja Cadastrar o número de protoco para outros demonstrativos?', 'Confirmar', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
            exit;
      end;
      sSql := ' SELECT NUMPROTOCOLO FROM MPREVICDEMONESTIDSEX '+
              ' WHERE CODIGOENTIDADE     = '+ CodEntidade +
	      ' AND   ANOREFERENCIA      = '+ AnorRef;

      qryValida.close;
      qryValida.SQL.Clear;
      qryValida.SQL.Add(sSql);
      qryValida.Prepare;
      qryValida.open;

      if (not qryValida.IsEmpty) and (qryValida.FieldByName('NUMPROTOCOLO').AsString <> '') then begin
         MsgDlg('Demonstrativo já contém Número de Protocolo cadastrado! Favor Verificar!', 'Informação', mtInformation, [mbOk], 0);
         exit;
      end
      else
         AtualizaDemonstrativoSexoIdade;
    end;

    if (flgEstatistico) then begin
      sSql := ' SELECT NUMPROTOCOLO FROM MPREVICDEMONEST '+
              '  WHERE NUMPROTOCOLO = '+edtNumeroProtocolo.Text;

      qryValida.close;
      qryValida.SQL.Clear;
      qryValida.SQL.Add(sSql);
      qryValida.Prepare;
      qryValida.open;

      if not qryValida.IsEmpty then begin
         MsgDlg('Número de Protocolo cadastrado para outro demonstrativo Estatístico! Favor Verificar!', 'Informação', mtInformation, [mbOk], 0);
         exit;
      end;
      sSql := ' SELECT NUMPROTOCOLO FROM MPREVICDEMONEST '+
              ' WHERE CODIGOENTIDADE     = '+ CodEntidade +
			  ' AND   ANOREFERENCIA      = '+ AnorRef +
			  ' AND   SEMESTREREFERENCIA = '+ SemestreRef;

      qryValida.close;
      qryValida.SQL.Clear;
      qryValida.SQL.Add(sSql);
      qryValida.Prepare;
      qryValida.open;

      if (not qryValida.IsEmpty) and (qryValida.FieldByName('NUMPROTOCOLO').AsString <> '') then begin
         MsgDlg('Demonstrativo já contém Número de Protocolo cadastrado! Favor Verificar!', 'Informação', mtInformation, [mbOk], 0);
         exit;
      end
      else
         AtualizaDemonstrativoEstatistico;
    end;
     RegistraProtocolo;
      CommitTransacao;
      MsgDlg('Número de Protocolo cadastrado com sucesso!', 'Informação', mtInformation, [mbOk], 0);
      bbtnSairClick(self);
  Except
      RollBackTransacao;
      MsgDlg('Ocorreu erro na geração ou gravação de dados, entre em contato com o Analista responsável', 'Informação', mtInformation, [mbOk], 0);
  End;
end;

procedure TfrmCadNumeroProtoco.GravaNumeroProtocolo;
begin

end;

procedure TfrmCadNumeroProtoco.AtualizaDemonstrativoSexoIdade;
var
   sSQl : String;
begin
  sSQl := ' UPDATE MPREVICDEMONESTIDSEX '+
          ' SET   NUMPROTOCOLO   = '+ edtNumeroProtocolo.Text+
          ' WHERE ANOREFERENCIA  = '+ AnorRef+
          ' AND   CODIGOENTIDADE = '+ CodEntidade;

  qryUp.close;
  qryUp.Sql.Clear;
  qryUp.Sql.Add(sSQL);
  qryUp.Prepare;
  qryUp.ExecSQL;
end;

procedure TfrmCadNumeroProtoco.AtualizaDemonstrativoEstatistico;
var
   sSQl :String;
begin
  sSQl := ' UPDATE MPREVICDEMONEST '+
          ' SET   NUMPROTOCOLO       = '+ edtNumeroProtocolo.Text+
          ' WHERE CODIGOENTIDADE     = '+ CodEntidade +
          ' AND   ANOREFERENCIA      = '+ AnorRef +
          ' AND   SEMESTREREFERENCIA = '+ SemestreRef;

  qryUp.close;
  qryUp.Sql.Clear;
  qryUp.Sql.Add(sSQL);
  qryUp.Prepare;
  qryUp.ExecSQL;
end;

procedure TfrmCadNumeroProtoco.RegistraProtocolo;
var
   sSQl :String;
begin
  try
    StartTransacao;
    sSQl := ' INSERT INTO MPREVICARQSPC(   '+
            '      TIPODEMONSTRATIVO,      '+
            '      DATAENVIO,              '+
            '      HORAENVIO,              '+
            '      NUMEROPROTOCOLO,        '+
            '      SEMESTREREFERENCIA,     '+
            '      ANOREFERENCIA,          '+
            '      CODIGOENTIDADE,          '+
            '      TRGUSERINCLUSAO,        '+
            '      TRGDTINCLUSAO           '+
            ') VALUES (                    '+
             ' '''+edtDemonstrativo.Text +''','+
             ' '''+edtDataEnvio.Text     +''','+
             ' '''+edtHoraEnvio.Text +''','+
             edtNumeroProtocolo.Text +','+
             ' '''+edtSemestre.Text    +''','+
             ' '''+edtAno.Text +''','+
             CodEntidade+','+
             IntToStr(Sistema.IdUsuario) +','+
             ' SYSDATE)';

    qryUp.close;
    qryUp.Sql.Clear;
    qryUp.Sql.Add(sSQL);
    qryUp.Prepare;
    qryUp.ExecSQL;
    CommitTransacao;
  except
      on E:EDBEngineError do
      begin
          RollBackTransacao;
          MsgDlg('Ocorreu erro na geração ou gravação de dados, entre em contato com o Analista responsável!', 'Informação', mtInformation, [mbOk], 0);
         //MostrarErro(E);
         Exit;
      end;
  end;
end;

procedure TfrmCadNumeroProtoco.SetCampos(vflgEstatistico,
  vflgSexoIdade: boolean;vAnorRef,vSemestreRef, vCNPJ, vCodEntidade,vNumProtocolo: String);
var sSQl:String;
begin
  flgEstatistico  := vflgEstatistico;
  flgSexoIdade    := vflgSexoIdade;
  CNPJ            := vCNPJ;
  CodEntidade     := vCodEntidade;
  AnorRef         := vAnorRef;
  NumProtocolo    := vNumProtocolo;
  if flgEstatistico then
     SemestreRef     := '0'+vSemestreRef
  else
     edtSemestre.enabled := false;

  edtAno.Text     := AnorRef;
  if flgEstatistico then
    edtSemestre.Text:= formatfloat('00',strToInt(SemestreRef));

   sSQl := ' SELECT DATAENVIO, HORAENVIO,NUMEROPROTOCOLO, TIPODEMONSTRATIVO '+
          ' FROM MPREVICARQSPC          '+
          ' WHERE CODIGOENTIDADE     =  '+ CodEntidade;

   if (flgEstatistico) then
       sSQl := sSQl + ' AND   SEMESTREREFERENCIA = '+ SemestreRef;

   if (NumProtocolo <> '') then
       sSQl := sSQl + ' AND   NUMEROPROTOCOLO = '+ NumProtocolo;

   sSQl := sSQl + ' AND   ANOREFERENCIA      = '+ AnorRef;

   qryDet.close;
   qryDet.Sql.Clear;
   qryDet.Sql.Add(sSQL);
   qryDet.Prepare;
   qryDet.open;

//   if (not qryDet.IsEmpty) and (qryDet.FieldByName('DATAENVIO').AsString <> '')then   begin
   if (NumProtocolo<>'')then   begin
      edtDataEnvio.Text := FormatDateTime('dd/mm/yyyy', qryDet.FieldByName('DATAENVIO').AsDateTime);
        edtHoraEnvio.Text := FormatDateTime('hh:mm', qryDet.FieldByName('HORAENVIO').AsDateTime);
        edtDemonstrativo.Text :=  qryDet.FieldByName('TIPODEMONSTRATIVO').AsString;
        edtNumeroProtocolo.Text :=  qryDet.FieldByName('NUMEROPROTOCOLO').AsString;

   end else begin
       edtDataEnvio.Text := FormatDateTime('dd/mm/yyyy', Now);
       edtHoraEnvio.Text := FormatDateTime('hh:mm', Now);
   end;

   flgAuxEstatistico :=flgEstatistico;
   flgAuxSexoIdade   :=flgSexoIdade;
   AnorAuxRef        :=AnorRef;
   SemesAuxtreRef    :=SemestreRef;
   CNPJAux           :=CNPJ;
   CodAuxEntidade    :=CodEntidade;
end;

procedure TfrmCadNumeroProtoco.edtAnoChange(Sender: TObject);
begin
  inherited;
  AnorRef := edtAno.Text;
end;

procedure TfrmCadNumeroProtoco.edtSemestreChange(Sender: TObject);
begin
  inherited;
  if (edtSemestre.Text <> '') then begin
    if (StrToInt(edtSemestre.Text) >12) or (StrToInt(edtSemestre.Text) < 0) then
       edtSemestre.Text:='';
  end;

  SemestreRef:=edtSemestre.Text;
end;

procedure TfrmCadNumeroProtoco.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  SetCampos(flgAuxEstatistico,flgAuxSexoIdade,AnorAuxRef,SemesAuxtreRef,CNPJAux,CodAuxEntidade,NumProtocolo);
  if NumProtocolo = '' then begin
    edtDemonstrativo.Text:='';
    edtNumeroProtocolo.Text:='';
  end;
end;

procedure TfrmCadNumeroProtoco.edtAnoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  If not( key in['0'..'9',#08] ) then
     key:=#0;
end;

procedure TfrmCadNumeroProtoco.edtSemestreKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  If not( key in['0'..'9',#08] ) then
     key:=#0;
end;

procedure TfrmCadNumeroProtoco.edtNumeroProtocoloKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  If not( key in['0'..'9',#08] ) then
     key:=#0;
end;

end.
