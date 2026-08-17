unit fAlteraDados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, Wwdatsrc, DBTables, Wwquery,
  ComCtrls, UMensErro;

type
  TfrmAlteraDados = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    edtPosAtual: TEdit;
    lblNovaPos: TLabel;
    lblPosAtual: TLabel;
    edtNovaPos: TEdit;
    dblNovaPos: TwwDBLookupCombo;
    qry: TwwQuery;
    dts: TwwDataSource;
    DtpNovo: TDateTimePicker;
    qryPlanosPart: TwwQuery;
    FloatField1: TFloatField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    FloatField2: TFloatField;
    qryContass: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblNovaPosKeyPress(Sender: TObject; var Key: Char);
    procedure dblNovaPosChange(Sender: TObject);
    procedure DtpNovoChange(Sender: TObject);
  private
    { Private declarations }
    sIdContass: String;
    Function VerifCmp(St:String): String;
    Function AtualizaContass(pCampo,pNovoConteudo,pCodPortForma,
      pIdTitular,pIdDependente,pIdPlanoPrev,pIdPlanass,pIdContass:String):Boolean;
    Procedure InsertFiario(Ms:String);
  public
    { Public declarations }
    iMenu     :    Integer;
  end;

var
  frmAlteraDados: TfrmAlteraDados;

implementation

uses FCadGeralPart, DBaseDados, UAdmAss, USistema;

{$R *.DFM}

Function TfrmAlteraDados.VerifCmp(St:String): String;
Var Ch    : Char;
    A, Tam: Integer;
    StAux : String;
begin
  StAux:='';
  Tam:=Length(St);
  For A:=1 to Tam do
  begin
    Ch:=St[A];
    If UpCase(Ch) In ['A'..'Z','0'..'9','.',','] then StAux:=StAux+Ch;
  end;
  If StAux='' then StAux:='NULL';
  Result:=StAux;
end;

Function TfrmAlteraDados.AtualizaContass(pCampo,pNovoConteudo,PCodPortForma,
           pIdTitular,pIdDependente,pIdPlanoPrev,pIdPlanass,pIdContass:String):Boolean;
Var qryCmp,
    qryUpd: TQuery;
    sSql  : String;
    bErro : Boolean;

{Sub}
Procedure RegistraErro;
begin
  MsgDlg('Erro ao Atualizar!','Aviso',mtError,[mbOk,mbHelp],0);
  bErro:=True;
end; {RegistraErro}

{Sub}
Procedure Update;
begin
  qryUpd:=TQuery.Create(Application);
  qryUpd.DatabaseName:='BaseDados';
  qryUpd.Close;
  qryUpd.SQL.Clear;
  qryUpd.SQL.Add(sSQL);
  Try
    qryUpd.ExecSQL;
  Except
    RegistraErro;
  end;
  qryUpd.Close;
  qryUpd.Free;
end; {Update}

{Sub}
Procedure DesligaContass;
begin
  sSql:='UPDATE CONTASS SET FLGATIVO = 0 '+
            ' WHERE '+
            ' IDTITULAR = '+pIdTitular+' AND '+
            ' IDDEPENDENTE = '+pIdDependente+' AND '+
            ' IDPLANOPREV = '+pIdPlanoPrev+' AND '+
            ' IDPLANASS = '+pIdPlanass+' AND '+
            ' IDCONTASS = '+pIdContass+' AND '+
            ' FLGATIVO = 1 ';
   Update;
end; {DesligaContass}

{Sub}
Function ExisteRegistro(Flg:Char):Boolean;
begin
  sSql:='SELECT IDTITULAR, IDDEPENDENTE, IDPLANOPREV,'+
        ' IDPLANASS, IDCONTASS '+
        ' FROM CONTASS '+
        ' WHERE '+
        ' IDTITULAR = '+pIdTitular+' AND '+
        ' IDDEPENDENTE = '+pIdDependente+' AND '+
        ' IDPLANOPREV = '+pIdPlanoPrev+' AND ';
  If pCampo='IDPLANASS' then
     sSql:=sSql+' IDPLANASS = '+pNovoConteudo+' AND '
  else sSql:=sSql+' IDPLANASS = '+pIdPlanass+' AND ';

  If pCampo='IDCONTASS' then
     sSql:=sSql+' IDCONTASS = '+pNovoConteudo+' AND '
  else sSql:=sSql+' IDCONTASS = '+pIdContass+' AND ';

  sSql:=sSql+' FLGATIVO = '+Flg;
  qryCmp:=TQuery.Create(Application);
  qryCmp.DatabaseName:='BaseDados';
  qryCmp.Close;
  qryCmp.SQL.Clear;
  qryCmp.SQL.Add(sSql);
  Try
    qryCmp.Open;
    Result:=Not qryCmp.IsEmpty; 
  Except
    RegistraErro;
    Result:=False;
  end;
end;

begin
  bErro:=False;
 {Faz Cancelamento da Anterior}
  DesligaContass;

  (* Verifica se existe registro ativo *)
  If Not ExisteRegistro('1') then
  begin
    If ExisteRegistro('0') then
    begin
      sSql:='UPDATE CONTASS SET FLGATIVO = 1, '+
            'CODPORTFORMA = '+VerifCmp(pCodPortForma)+
            ' WHERE '+
            ' IDTITULAR = '+pIdTitular+' AND '+
            ' IDDEPENDENTE = '+pIdDependente+' AND '+
            ' IDPLANOPREV = '+pIdPlanoPrev+' AND ';
      If pCampo='IDPLANASS' then
         sSql:=sSql+' IDPLANASS = '+pNovoConteudo+' AND '
      else sSql:=sSql+' IDPLANASS = '+pIdPlanass+' AND ';

      If pCampo='IDCONTASS' then
         sSql:=sSql+' IDCONTASS = '+pNovoConteudo+' AND '
      else sSql:=sSql+' IDCONTASS = '+pIdContass+' AND ';
      sSql:=sSql+' FLGATIVO = 0 ';

      {Reverte Cancelamento}
      Update;

    end
    else
    If Not bErro then
    begin
      sSql:='SELECT IDPLANASS,IDPLANOPREV,IDPESSJUR,IDTITULAR,IDCONTASS,'+
            'IDDEPENDENTE,CODTIPDOC,IDEMPRESAPROP,SEQPROPOSTA,'+
            'CODALTERADORJUROS,RECPAGDEVOL,CODCENTRORESPON,RECPAG,'+
            'IDPESSOA,CODTIPDESEMBDEVOL,IDEMPRESA,CODTIPDESEMBCAR,'+
            'CODSUBCONTA,TIPCODIGO,CODCENTROCUSTOD,CODTIPRECDES,'+
            'CODPORTFORMA,PLACONTAD,PLANO,PLACONTAC,UNIDNEGOC,FLGATIVO,'+
            'CODCENTROCUSTOC,FLGFOLHA,CODALTERADORCORR,FLGCOBCARNE,'+
            'IDPAGADOR,CODCCUSTOCDEVBAN,CODCCUSTOCDEVPAT,PLACONTACDEVPAT,'+
            'PLACONTACDEVBANCO '+
            ' FROM CONTASS '+
            ' WHERE '+
            ' IDTITULAR = '+pIdTitular+' AND '+
            ' IDDEPENDENTE = '+pIdDependente+' AND '+
            ' IDPLANOPREV = '+pIdPlanoPrev+' AND '+
            ' IDPLANASS = '+pIdPlanass+' AND '+
            ' IDCONTASS = '+pIdContass+' AND '+
            ' FLGATIVO = 0 ';
      qryCmp.Close;
      qryCmp.SQL.Clear;
      qryCmp.SQL.Add(sSql);
      Try
        qryCmp.Open;
      Except
        RegistraErro;
      end;

      With qryCmp do
      begin
        If (FieldByName('IDTITULAR').AsString=pIdtitular)And
             (FieldByName('IDDEPENDENTE').AsString=pIdDependente)And
              (FieldByName('IDPLANOPREV').AsString=pIdPlanoPrev)And
               (FieldByName('IDPLANASS').AsString=pIdPlanass)And
                (FieldByName('IDCONTASS').AsString=pIdContass)And
                 (Not bErro) then
        begin
          sSql:='INSERT INTO CONTASS '+
                '(IDPLANASS,IDPLANOPREV,IDPESSJUR,IDTITULAR,IDCONTASS,'+
                'IDDEPENDENTE,CODTIPDOC,IDEMPRESAPROP,SEQPROPOSTA,'+
                'CODALTERADORJUROS,RECPAGDEVOL,CODCENTRORESPON,RECPAG,'+
                'IDPESSOA,CODTIPDESEMBDEVOL,IDEMPRESA,CODTIPDESEMBCAR,'+
                'CODSUBCONTA,TIPCODIGO,CODCENTROCUSTOD,CODTIPRECDES,'+
                'CODPORTFORMA,PLACONTAD,PLANO,PLACONTAC,UNIDNEGOC,FLGATIVO,'+
                'CODCENTROCUSTOC,FLGFOLHA,CODALTERADORCORR,FLGCOBCARNE,'+
                'IDPAGADOR,CODCCUSTOCDEVBAN,CODCCUSTOCDEVPAT,PLACONTACDEVPAT,'+
                'PLACONTACDEVBANCO) '+
                ' VALUES (';
          If pCampo='IDPLANASS' then
            sSql:=sSql+pNovoConteudo+','
          else sSql:=sSql+FieldByName('IDPLANASS').AsString+',';
          sSql:=sSql+FieldByName('IDPLANOPREV').AsString+','+
                FieldByName('IDPESSJUR').AsString+','+
                FieldByName('IDTITULAR').AsString+',';
          If pCampo='IDCONTASS' then
            sSql:=sSql+pNovoConteudo+','
          else sSql:=sSql+FieldByName('IDCONTASS').AsString+',';
          sSql:=sSql+FieldByName('IDDEPENDENTE').AsString+','+
                VerifCmp(FieldByName('CODTIPDOC').AsString)+','+
                VerifCmp(FieldByName('IDEMPRESAPROP').AsString)+','+
                FieldByName('SEQPROPOSTA').AsString+','+
                VerifCmp(FieldByName('CODALTERADORJUROS').AsString)+','+
                QuotedStr(FieldByName('RECPAGDEVOL').AsString)+','+
                QuotedStr(FieldByName('CODCENTRORESPON').AsString)+','+
                QuotedStr(FieldByName('RECPAG').AsString)+','+
                VerifCmp(FieldByName('IDPESSOA').AsString)+','+
                QuotedStr(FieldByName('CODTIPDESEMBDEVOL').AsString)+','+
                VerifCmp(FieldByName('IDEMPRESA').AsString)+','+
                QuotedStr(FieldByName('CODTIPDESEMBCAR').AsString)+','+
                VerifCmp(FieldByName('CODSUBCONTA').AsString)+','+
                QuotedStr(FieldByName('TIPCODIGO').AsString)+','+
                QuotedStr(FieldByName('CODCENTROCUSTOD').AsString)+','+
                QuotedStr(FieldByName('CODTIPRECDES').AsString)+','+
                VerifCmp(pCodPortForma)+','+
                QuotedStr(FieldByName('PLACONTAD').AsString)+','+
                VerifCmp(FieldByName('PLANO').AsString)+','+
                QuotedStr(FieldByName('PLACONTAC').AsString)+','+
                VerifCmp(FieldByName('UNIDNEGOC').AsString)+','+
                '1,'+   {FlgAtivo}
                QuotedStr(FieldByName('CODCENTROCUSTOC').AsString)+','+
                VerifCmp(FieldByName('FLGFOLHA').AsString)+','+
                VerifCmp(FieldByName('CODALTERADORCORR').AsString)+','+
                VerifCmp(FieldByName('FLGCOBCARNE').AsString)+','+
                VerifCmp(FieldByName('IDPAGADOR').AsString)+','+
                QuotedStr(FieldByName('CODCCUSTOCDEVBAN').AsString)+','+
                QuotedStr(FieldByName('CODCCUSTOCDEVPAT').AsString)+','+
                QuotedStr(FieldByName('PLACONTACDEVPAT').AsString)+','+
                QuotedStr(FieldByName('PLACONTACDEVBANCO').AsString)+')';
          (* Faz o Insert *)
          Update;
        end; {bErro}
      end; {With}
    end; {If ExisteRegistro}
  end; {IsEmpty}
  qryCmp.Close;
  qryCmp.Free;
  If Not bErro then Result:=True
  else Result:=False;
end; {AtualizaContass}

procedure TfrmAlteraDados.FormCreate(Sender: TObject);
Var sSql  : String;
    qryAux: Tquery;
begin
  inherited;
  If (frmCadGeralPart.qry.IsEmpty)Or
      (frmCadGeralPart.qryPlano.IsEmpty) then Exit;
  sIdContass:='';
  iMenu:=frmCadGeralPart.iMenu;
  Caption:='Alterar dados de '+frmCadGeralPart.qryNOME.AsString;
  dblNovaPos.Visible:=False;
  edtNovaPos.Visible:=False;
  dtpNovo.Visible:=False;
  (* Pega posição atual *)
  lblPosAtual.Caption:=FrmCadGeralPart.sLblAtual;
  edtPosAtual.Text:=FrmCadGeralPart.sValorAtual;
  (* Nova posição *)
  lblNovaPos.Caption:=frmCadGeralPart.sLblNovo;
  Case iMenu Of
   1 : Begin     (* Plano Inscrito *)
        (*  Escreve a query em tempo real *)
        sSql:= 'SELECT '+#13+
               '    IDPLANASS, OPCAOAIDENT,'+#13+
               '    NOME, CODPORTFORMA '+#13+
               ' FROM'+#13+
               '    PLANASS'+#13+
               ' WHERE'+#13+
               '    FLGATIVO = 1 AND'+#13+
               '    IDPLANASS NOT IN (SELECT P.IDPLANASS'+#13+
               '                      FROM'+#13+
               '                      PARTASS P, BENEFASS BA, PLANPREV PP, PLANASS PA,'+#13+
               '                      SITPLANOASS S'+#13+
               '                      WHERE'+#13+
               '                      (P.IDPESSOA = '+
               frmCadGeralPart.qryCHAVE.AsString+') AND'+#13+
               '                      (P.IDPESSOA = BA.IDTITULAR(+)) AND'+#13+
               '                      (P.IDPESSJUR = BA.IDPESSJUR(+)) AND'+#13+
               '                      (P.IDPLANOPREV = BA.IDPLANOPREV(+)) AND'+#13+
               '                      (P.IDPLANASS = BA.IDPLANASS(+)) AND'+#13+
               '                      (P.IDPESSOA = BA.IDDEPENDENTE(+)) AND'+#13+
               '                      (P.SEQPROPOSTA = BA.SEQPROPOSTA(+)) AND'+#13+
               '                      (P.FLGINSCRICAOCANC = 0) AND'+#13+            
               '                      (BA.FLGATIVO = 1) AND'+#13+
               '                      (P.IDPLANASS = PA.IDPLANASS) AND'+#13+
               '                      (P.IDPLANOPREV = PP.IDPLANOPREV) AND'+#13+
               '                      (P.IDSITPART= S.IDSITPLANOASS)  )';
        qry.Close;
        qry.SQL.Clear;
        qry.SQL.Add(sSQL);
        qry.Open;
        (* Habilita a visualização e configura a dbLookup *)
        dblNovaPos.Visible:=True;
        dblNovaPos.LookupTable:=qry;
        dblNovaPos.LookupField:='NOME';
       End;
   2 : Begin     (* Data de Entrada *)
        (* Habilita a visualização e DateTimePicker *)
        dtpNovo.Visible:=True;
        dtpNovo.Date:=Now;
       End;
   3 : Begin     (* Forma de pagamento *)
        (* Verifica na Contass o CodPortForma *)
        qryContass.ParamByName('IDPESSOA').Value := frmCadGeralPart.qryCHAVE.AsString;
        qryContass.ParamByName('IDPLANASS').Value:= frmCadGeralPart.qryPlanoIDPLANASS.AsString;
        qryContass.Open;
        If qryContass.IsEmpty then edtPosAtual.Text:='Folha Pagamento/Benefício/Débito Automático'
        else edtPosAtual.Text:='Boleto Bancário';
        qryContass.Close;
        (* Escreve a query em tempo real *)
        sSql:= 'SELECT ''Folha Pagamento/Benefício/Débito Automático'' AS CAMPO'+#13+
               'FROM DUAL'+#13+
               'UNION'+#13+
               'SELECT ''Boleto Bancário'' AS CAMPO'+#13+
               'FROM DUAL';
        qry.Close;
        qry.SQL.Clear;
        qry.SQL.Add(sSQL);
        qry.Open;
        (* Habilita a visualização e configura a dbLookup *)
        dblNovaPos.Visible:=True;
        dblNovaPos.LookupTable:=qry;
        dblNovaPos.LookupField:='CAMPO';
       End;
   4 : Begin     (* Contribuição *)
        (* Verifica na Contass a Contribuição *)
        If frmCadGeralPart.qryPlano.IsEmpty then Abort;
        qryAux:=Tquery.Create(Application);
        qryAux.DatabaseName:='BaseDados';
        With qryAux do
        begin
          Close;
          Sql.Clear;
          Sql.Add('SELECT CT.IDCONTASS, CB.NOME AS CONTRIBUICAO '+
                  ' FROM CONTASS CT, CONTRIBUICAO CB '+
                  ' WHERE (CT.IDTITULAR = '+frmCadGeralPart.qryCHAVE.AsString+') AND '+
                  ' (CT.IDDEPENDENTE = '+frmCadGeralPart.qryPlanoIDPESSOA.AsString+') AND '+
                  ' (CT.IDPLANASS = '+frmCadGeralPart.qryPlanoIDPLANASS.AsString+') AND '+
                  ' (CT.IDCONTASS = '+frmCadGeralPart.qryPlanoIDCONTASS.AsString+') AND '+
                  ' (CT.IDCONTASS = CB.IDCONTRIBUICAO) AND '+
                  ' (CT.FLGATIVO = 1)');
          Open;
          If Not IsEmpty then
          begin
            edtPosAtual.Text:=FieldByName('CONTRIBUICAO').AsString;
            sIdContass:=FieldByName('IDCONTASS').AsString;
          end
          else edtPosAtual.Text:='';
        end; {With}
        If edtPosAtual.Text<>'' then
        begin
          qry.Close;
          qry.Sql.Clear;
          qry.Sql.Add(
            'SELECT CT.IDCONTRIBUICAO, CT.NOME AS CONTRIBUICAO, PL.CODPORTFORMA '+
            ' FROM CONTRIBASS CB, CONTRIBUICAO CT, PLANASS PL '+
            ' WHERE (CB.IDPLANASS = '+frmCadGeralPart.qryPlanoIDPLANASS.AsString+') AND '+
            ' (CB.IDCONTASS = CT.IDCONTRIBUICAO) AND '+
            ' (CB.IDCONTASS <> '+qryAux.FieldByName('IDCONTASS').AsString+') AND '+
            ' (CB.IDPLANASS = PL.IDPLANASS) ');
          qry.Open;
          (* Habilita a visualização e configura a dbLookup *)
          dblNovaPos.Visible:=True;
          dblNovaPos.LookupTable:=qry;
          dblNovaPos.LookupField:='IDCONTRIBUICAO';
          dblNovaPos.Selected.Text:='CONTRIBUICAO	60	Tipo de Cobrança     F';
        end;
        qryAux.Close;
        qryAux.Free;
       End;

   5 : Begin      (* Data de Cancelamento *)
        (* Habilita a visualização e DateTimePicker *)
        dtpNovo.Visible:=True;
        dtpNovo.Date:=Now;
       End;
   6 : Begin      (* Data de Entrada do Beneficiário *)
          (* Habilita a visualização e DateTimePicker *)
          dtpNovo.Visible:=True;
          dtpNovo.Date:=Now;
       End;
   7 : Begin      (* Data de Cancelamento do Beneficiário *)
        (* Habilita a visualização e DateTimePicker *)
        dtpNovo.Visible:=True;
        dtpNovo.Date:=Now;
       End;
   8 : Begin  (* Cobrança Diferenciada *)
        (* Escreve a query em tempo real *)
         sSql:= 'SELECT ''COM COBRANÇA DIFERENCIADA'' AS CAMPO'+#13+
                'FROM DUAL'+#13+
                'UNION'+#13+
                'SELECT ''SEM COBRANÇA DIFERENCIADA'' AS CAMPO'+#13+
                'FROM DUAL';
         qry.Close;
         qry.SQL.Clear;
         qry.SQL.Add(sSQL);
         qry.Open;
         (* Habilita a visualização e configura a dbLookup *)
         dblNovaPos.Visible:=True;
         dblNovaPos.LookupTable:=qry;
         dblNovaPos.LookupField:='CAMPO';
         (* Habilita a visualização e DateTimePicker *)
         dtpNovo.Visible:=True;
         dtpNovo.Date:=Now;
       end;
  End;
end;

procedure TfrmAlteraDados.FormPaint(Sender: TObject);
begin
  inherited;
  Case iMenu Of
    1 : Begin      (* Plano Inscrito *)
          (* Verifica a quantidade de registros que a query retornou;         *)
          (* caso seja = 0 então avisa ao usuário e retorna a tela chamadora. *)
         If qry.RecordCount = 0 Then
          Begin
           ShowMessage('Não há mais planos para serem alterados !!');
           bbtnSairClick(self);
          End;
         End;
    5 : Begin      (* Data de cancelamento *)
          (* Verifica a quantidade de registros que a query retornou;         *)
          (* caso seja = 0 então avisa ao usuário e retorna a tela chamadora. *)
         If frmCadGeralPart.qryPlanoDATACANCELAMENTO.IsNull Then
          Begin
           edtPosAtual.Text:='';
           ShowMessage('Não é possível alterar data de cancelamento que não exista !!');
           bbtnSairClick(self);
          End;
         End;
    6 : If frmCadGeralPart.qryBenefIDPESSOA.IsNull then
        begin
          (* Data de Entrada do beneficiário, se beneficiário é nulo, retorna. *)
          MsgDlg('Beneficiário não cadastrado!','Aviso',mtWarning,[mbOk,mbHelp],0);
          bbtnSairClick(self);
        end;

        (* Data de cancelamento do beneficiário *)
        (* Verifica a quantidade de registros que a query retornou;         *)
        (* caso seja = 0 então avisa ao usuário e retorna a tela chamadora. *)
    7 : If Not frmCadGeralPart.qryBenefIDPESSOA.IsNull then
        begin
          If frmCadGeralPart.qryBenefDTCANCELAMENTO.IsNull Then
          begin
             edtPosAtual.Text:='';
             ShowMessage('Não é possível alterar data de cancelamento que não exista !!');
             bbtnSairClick(self);
          end;
        end
        else
        begin
          MsgDlg('Beneficiário não cadastrado!','Aviso',mtWarning,[mbOk,mbHelp],0);
          bbtnSairClick(self);
        end;
  end; {Case}
end;

Procedure TfrmAlteraDados.InsertFiario(Ms:String);
begin
 (* INCLUI OCORRÊNCIA NA TABELA FIARIO *)
  FazerInsertFiario(frmCadGeralPart.qryCHAVE.AsInteger,frmCadGeralPart.qryCHAVE.AsInteger,
                     Sistema.IdUsuario, Sistema.IdModulo, Ms+' (Anterior: '+
                      edtPosAtual.Text+'  Atual: '+edtNovaPos.Text+')');
end;

procedure TfrmAlteraDados.bbtnConfirmarClick(Sender: TObject);
Var qryAux      : Tquery;
    sSQL, vAux,
    sFlgCobCarne: String;
begin
   If ((dblNovaPos.Visible) and (dblNovaPos.Text = '')) or
      ((edtPosAtual.Visible) and (edtPosAtual.Text = '')) Then
    Begin
      ShowMessage('Não foi informada a nova posição do campo alterado.');
      Exit;
    End;
   qryAux:=Tquery.Create(Application);
   qryAux.DatabaseName:='BaseDados';
(*                   ROTINA DE GRAVAÇÃO DE DADOS                    *)
   Case iMenu Of
    1 : Begin      (* Alteração de Plano Inscrito *)
          dtmBaseDados.dbBaseDados.StartTransaction;
          Try
          (*          Alteração na PARTASS              *)
          sSQL:='UPDATE PARTASS'+#13+
                ' SET IDPLANASS='+qry.FieldByName('IDPLANASS').AsString+','+#13+
                ' OPCAOB='+QuotedStr(qry.FieldByName('OPCAOAIDENT').AsString)+#13+
                ' WHERE (IDPESSOA = '+frmCadGeralPart.qryCHAVE.AsString+')'+#13+
                '  AND (IDPLANASS = '+frmCadGeralPart.qryPlanoIDPLANASS.AsString+')'+
                '  AND (FLGINSCRICAOCANC = 0)';
          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.SQL.Add(sSQL);
          qryAux.ExecSQL;
          (*          Alteração na BENEFASS             *)
          sSQL:='UPDATE BENEFASS'+#13+
                ' SET IDPLANASS='+qry.FieldByName('IDPLANASS').AsString+#13+
                ' WHERE (IDTITULAR = '+frmCadGeralPart.qryCHAVE.AsString+')'+#13+
                '  AND (IDPLANASS = '+frmCadGeralPart.qryPlanoIDPLANASS.AsString+')'+
                '  AND (FLGATIVO = 1 )';
          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.SQL.Add(sSQL);
          qryAux.ExecSQL;
          (*           Alteração na CONTASS             *)

          If AtualizaContass('IDPLANASS',          
            qry.FieldByName('IDPLANASS').AsString,
             qry.FieldByName('CODPORTFORMA').AsString,
              frmCadGeralPart.qryCHAVE.AsString,
              frmCadGeralPart.qryPlanoIDPESSOA.AsString,
               frmCadGeralPart.qryPlanoIDPLANOPREV.AsString,
                frmCadGeralPart.qryPlanoIDPLANASS.AsString,
                 frmCadGeralPart.qryPlanoIDCONTASS.AsString)then
          begin
            (* Se todos os updates derem certo, então valida a transação (commit) *)
            dtmBaseDados.dbBaseDados.Commit;
            (* INCLUI OCORRÊNCIA NA TABELA FIARIO *)
            InsertFiario('ALTERAÇÃO DE PLANO INSCRITO NO ASSISTENCIAL');
            ShowMessage('Alteraçao efetuada com sucesso.');
          end else dtmBaseDados.dbBaseDados.Rollback;
          Except
             (* Algum update retornou erro - retorna a transação (rollback) *)
             ShowMessage('Ocorreu um erro durante a transação.'+#13+
                         '      Alteraçao não efetuada.       ');
             dtmBaseDados.dbBaseDados.Rollback;
          End;
        End;
    2 : begin  (* Alteração da Data de Entrada *)
          If DataValida(DateToStr(dtpNovo.Date), True) then
          begin
            dtmBaseDados.dbBaseDados.StartTransaction;
            Try
              (*  Alteração na PARTASS  *)
              sSQL:='UPDATE PARTASS'+#13+
                    ' SET DATAENTRADA=TO_DATE('''+DateToStr(dtpNovo.Date)+''',''DD/MM/YYYY'')'+#13+
                    ' WHERE (IDPESSOA = '+frmCadGeralPart.qryCHAVE.AsString+')'+#13+
                    '  AND (IDPLANASS = '+frmCadGeralPart.qryPlanoIDPLANASS.AsString+')';
              qryAux.Close;
              qryAux.SQL.Clear;
              qryAux.SQL.Add(sSQL);
              qryAux.ExecSQL;
              (*  Alteração na BENEFASS *)
              sSQL:='UPDATE BENEFASS'+#13+
                    ' SET DATAENTRADA=TO_DATE('''+DateToStr(dtpNovo.Date)+''',''DD/MM/YYYY'')'+#13+
                    ' WHERE (IDTITULAR = '+frmCadGeralPart.qryCHAVE.AsString+')'+#13+
                    '  AND (IDPLANASS = '+frmCadGeralPart.qryPlanoIDPLANASS.AsString+')';
              qryAux.Close;
              qryAux.SQL.Clear;
              qryAux.SQL.Add(sSQL);
              qryAux.ExecSQL;

              (* Se todos os updates derem certo, então valida a transação (commit) *)
              dtmBaseDados.dbBaseDados.Commit;
              (* INCLUI OCORRÊNCIA NA TABELA FIARIO *)
              InsertFiario('ALTERAÇÃO DE DATA DE ENTRADA NO ASSISTENCIAL');

              ShowMessage('Alteraçao efetuada com sucesso.');
            Except
              (* Algum update retornou erro - retorna a transação (rollback) *)

              ShowMessage('Ocorreu um erro durante a transação.'+#13+
                        '      Alteraçao não efetuada.       ');
              dtmBaseDados.dbBaseDados.Rollback;
            End;
          end;
        End;
    3 : Begin
         (* Alteração da Forma de pagamento *)
         dtmBaseDados.dbBaseDados.StartTransaction;
         sFlgCobCarne:='NULL';
         If dblNovaPos.Text = 'Boleto Bancário' then
         begin
           qryPlanosPart.Close;
           qryPlanosPart.ParamByName('IDPESSOA').Value := frmCadGeralPart.qryCHAVE.AsString;
           qryPlanosPart.ParamByName('IDPLANASS').Value:= frmCadGeralPart.qryPlanoIDPLANASS.AsString;
           qryPlanosPart.Open;
           If Not qryPlanosPart.IsEmpty then
            vAux:=qryPlanosPart.FieldByName('CodportForma').AsString
           else vAux:='NULL';
           qryPlanosPart.Close;
           sFlgCobCarne:='1';
         end else vAux:='NULL';
         Try
          (*    Alteração na CONTASS    *)
          sSQL:='UPDATE CONTASS '+
                ' SET CODPORTFORMA = '+vAux+', FLGCOBCARNE = '+sFlgCobCarne+' '+
                ' WHERE (IDTITULAR = '+frmCadGeralPart.qryCHAVE.AsString+') '+
                ' AND (IDDEPENDENTE = '+frmCadGeralPart.qryPlanoIDPESSOA.AsString+') '+
                ' AND (IDPLANASS = '+frmCadGeralPart.qryPlanoIDPLANASS.AsString+')';
          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.SQL.Add(sSQL);
          qryAux.ExecSQL;

          (* Se todos os updates derem certo, então valida a transação (commit) *)
          dtmBaseDados.dbBaseDados.Commit;
          (* INCLUI OCORRÊNCIA NA TABELA FIARIO *)
          InsertFiario('ALTERAÇÃO DA FORMA DE PAGAMENTO NO ASSISTENCIAL');
          ShowMessage('Alteraçao efetuada com sucesso.');
         Except
          dtmBaseDados.dbBaseDados.Rollback;
          (* Algum update retornou erro - retorna a transação (rollback) *)
          ShowMessage('Ocorreu um erro durante a transação.'+#13+
                      '      Alteraçao não efetuada.       ');
         End;
        End;

    4 : Begin
          (* Alteração da Contribuição Correspondente a Situação do Participante *)
          dtmBaseDados.dbBaseDados.StartTransaction;
          If (dblNovaPos.Text<>'')And(sIdContass<>'')And
              (StrToIntDef(dblNovaPos.LookupValue,0)>0) then
          begin
            vAux:=dblNovaPos.LookupValue;
            (* Alteração na CONTASS  *)
            Try
              If AtualizaContass('IDCONTASS',vAux,
                qry.FieldByName('CODPORTFORMA').AsString,
                 frmCadGeralPart.qryCHAVE.AsString,
                 frmCadGeralPart.qryPlanoIDPESSOA.AsString,
                  frmCadGeralPart.qryPlanoIDPLANOPREV.AsString,
                   frmCadGeralPart.qryPlanoIDPLANASS.AsString,
                    sIdContass) then
              begin
                (* Se todos os updates derem certo, então valida a transação (commit) *)
                 dtmBaseDados.dbBaseDados.Commit;
                 (* INCLUI OCORRÊNCIA NA TABELA FIARIO *)
                 InsertFiario('ALTERAÇÃO DO TIPO DE COBRANÇA ');
                 ShowMessage('Alteraçao efetuada com sucesso.');
              end else dtmBaseDados.dbBaseDados.Rollback;
            Except
              dtmBaseDados.dbBaseDados.Rollback;
              (* Algum update retornou erro - retorna a transação (rollback) *)
              ShowMessage('Ocorreu um erro durante a transação.'+#13+
                          '      Alteraçao não efetuada.       ');
            End;
          End;
        End;

    5 : Begin
         (* Alteração da Data de cancelamento *)
         dtmBaseDados.dbBaseDados.StartTransaction;
         Try
         (*      Alteração na PARTASS      *)
          sSQL:='UPDATE PARTASS'+#13+
                ' SET DATACANCELAMENTO=TO_DATE('''+DateToStr(dtpNovo.Date)+''',''DD/MM/YYYY'')'+#13+
                ' WHERE (IDPESSOA = '+frmCadGeralPart.qryCHAVE.AsString+')'+#13+
                '  AND (IDPLANASS = '+frmCadGeralPart.qryPlanoIDPLANASS.AsString+')';
          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.SQL.Add(sSQL);
          qryAux.ExecSQL;
          (*     Alteração na BENEFASS     *)
          sSQL:='UPDATE BENEFASS'+#13+
                ' SET DTCANCELAMENTO=TO_DATE('''+DateToStr(dtpNovo.Date)+''',''DD/MM/YYYY'')'+#13+
                ' WHERE (IDTITULAR = '+frmCadGeralPart.qryCHAVE.AsString+')'+#13+
                '  AND (IDPLANASS = '+frmCadGeralPart.qryPlanoIDPLANASS.AsString+')';
          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.SQL.Add(sSQL);
          qryAux.ExecSQL;

           (* Se todos os updates derem certo, então valida a transação (commit) *)
          dtmBaseDados.dbBaseDados.Commit;
          (* INCLUI OCORRÊNCIA NA TABELA FIARIO *)
          InsertFiario('ALTERAÇÃO DE DATA DE CANCELAMENTO NO ASSISTENCIAL');

          ShowMessage('Alteraçao efetuada com sucesso.');
         Except
          (* Algum update retornou erro - retorna a transação (rollback) *)
          dtmBaseDados.dbBaseDados.Rollback;
          ShowMessage('Ocorreu um erro durante a transação.'+#13+
                      '      Alteraçao não efetuada.       ');
         End;
        End;

    6: Begin   (* Alteração de Data de Entrada do Beneficiário *)
         dtmBaseDados.dbBaseDados.StartTransaction;
         Try
          (*        Alteração na BENEFASS        *)
          sSQL:='UPDATE BENEFASS'+#13+
                ' SET DATAENTRADA=TO_DATE('''+DateToStr(dtpNovo.Date)+''',''DD/MM/YYYY'')'+#13+
                ' WHERE (IDTITULAR = '+frmCadGeralPart.qryCHAVE.AsString+')'+#13+
                '  AND (IDDEPENDENTE = '+frmCadGeralPart.qryBenefIDPESSOA.AsString+')'+#13+
                '  AND (IDPLANASS = '+frmCadGeralPart.qryPlanoIDPLANASS.AsString+')';
          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.SQL.Add(sSQL);
          qryAux.ExecSQL;

          (* Se todos os updates derem certo, então valida a transação (commit) *)
          dtmBaseDados.dbBaseDados.Commit;
          (* INCLUI OCORRÊNCIA NA TABELA FIARIO *)
          InsertFiario('ALTERAÇÃO DE DATA DE ENTRADA DO BENEFICIÁRIO NO ASSISTENCIAL');

          ShowMessage('Alteraçao efetuada com sucesso.');
         Except
          (* Algum update retornou erro - retorna a transação (rollback) *)
          dtmBaseDados.dbBaseDados.Rollback;
          ShowMessage('Ocorreu um erro durante a transação.'+#13+
                      '      Alteraçao não efetuada.       ');

         End;
       End;

    7: Begin   (*Alteração da Data de Cancelamento do Beneficiário *)
         dtmBaseDados.dbBaseDados.StartTransaction;
         Try
          (*      Alteração na BENEFASS      *)
          sSQL:='UPDATE BENEFASS'+#13+
                ' SET DTCANCELAMENTO=TO_DATE('''+DateToStr(dtpNovo.Date)+''',''DD/MM/YYYY'')'+#13+
                ' WHERE (IDTITULAR = '+frmCadGeralPart.qryCHAVE.AsString+')'+#13+
                '  AND (IDDEPENDENTE = '+frmCadGeralPart.qryBenefIDPESSOA.AsString+')'+#13+
                '  AND (IDPLANASS = '+frmCadGeralPart.qryPlanoIDPLANASS.AsString+')';
          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.SQL.Add(sSQL);
          qryAux.ExecSQL;

          (* Se todos os updates derem certo, então valida a transação (commit) *)
          dtmBaseDados.dbBaseDados.Commit;
          (* INCLUI OCORRÊNCIA NA TABELA FIARIO *)
          InsertFiario('ALTERAÇÃO DE DATA DE CANCELAMENTO DO BENEFICIÁRIO NO ASSISTENCIAL');

          ShowMessage('Alteraçao efetuada com sucesso.');
         Except
          (* Algum update retornou erro - retorna a transação (rollback) *)
          dtmBaseDados.dbBaseDados.Rollback;
          ShowMessage('Ocorreu um erro durante a transação.'+#13+
                      '      Alteraçao não efetuada.       ');
         End;
       End;
    8 : Begin      (* Alteração da Cobrança Diferenciada - OpcaoA *)
          If dblNovaPos.Text = 'COM COBRANÇA DIFERENCIADA' then
            vAux:='1'
          else vAux:='0';  // fernando - refer  - 31/05/04
          dtmBaseDados.dbBaseDados.StartTransaction;
          Try
            (*          Alteração na PARTASS              *)
            sSQL:='UPDATE PARTASS'+#13+
                  ' SET OPCAOA='+QuotedStr(vAux)+#13+
                  ' WHERE (IDPESSOA = '+frmCadGeralPart.qryCHAVE.AsString+')'+#13+
                  '  AND (IDPLANASS = '+frmCadGeralPart.qryPlanoIDPLANASS.AsString+')'+
                  '  AND (FLGINSCRICAOCANC = 0)';
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add(sSQL);
            qryAux.ExecSQL;
            (* Se todos os updates derem certo, então valida a transação (commit) *)
            dtmBaseDados.dbBaseDados.Commit;
            (* INCLUI OCORRÊNCIA NA TABELA FIARIO *)
            InsertFiario('ALTERAÇÃO DA COBRANCA DIFERENCIADA NO ASSISTENCIAL');
            ShowMessage('Alteraçao efetuada com sucesso.');
          Except
            (* Algum update retornou erro - retorna a transação (rollback) *)
            ShowMessage('Ocorreu um erro durante a transação.'+#13+
                        '      Alteraçao não efetuada.       ');
            dtmBaseDados.dbBaseDados.Rollback;
          End;
        End;

    End;
end;

procedure TfrmAlteraDados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmCadGeralPart.CmeCadastroFind(self);
  frmCadGeralPart.WindowState:=wsMaximized;
end;

procedure TfrmAlteraDados.dblNovaPosKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
 (* Não deixa usar o teclado *)
  Key:=#0;
end;

procedure TfrmAlteraDados.dblNovaPosChange(Sender: TObject);
begin
  inherited;
  If dblNovaPos.Visible then edtNovaPos.Text:= dblNovaPos.Text;
end;

procedure TfrmAlteraDados.DtpNovoChange(Sender: TObject);
begin
  inherited;
  If dtpNovo.Visible then  edtNovaPos.Text:= DateToStr(dtpNovo.Date);
end;

end.
