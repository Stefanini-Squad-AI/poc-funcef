unit FPRelPendenciaFolha;

interface

uses
  Windows    , Messages, SysUtils, Classes , Graphics   , Controls, Forms   ,
  MAHlpBtn  , StdCtrls, Buttons , cmRepBtn, ExtCtrls   , Db      , Dialogs ,
  DBTables   , Wwquery , checklst, Spin    , wwdblook   , TB97    , ComCtrls,
  MontaSelect, IvDictio, IvMulti , IvEMulti, FOkCancelar, Wwdatsrc, TB97Tlbr,
  UobjFolha, usistema, dbasedados;

type
  TfrmPRelPendencia = class(TfrmOkCancelar)
    Panel1          : TPanel;
    gbVersao: TGroupBox;
    gbRubricas: TGroupBox;
    chklstversao: TCheckListBox;
    chklstRubricas: TCheckListBox;
    rdgOrdem: TRadioGroup;
    procedure bbtnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure chklstVersaoClick(Sender: TObject);
    procedure chklstRubricasClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    sInVersao, sInRubricas: String;
    Procedure MontaFiltroVersao(sSt:String);
    Procedure MontaFiltroRubricas(sSt:String);
    Procedure AbreQryVersao;
    Procedure AbreQryRubricas;

  public
    { Public declarations }

  end;

var
  frmPRelPendencia: TfrmPRelPendencia;
  qryVersao: TwwQuery;
  qryRubricas: TwwQuery;

implementation

uses UMensErro, uAdmPrevFB, fAguarde, uFolhaBenef, dRelPendenciaFolha;

{$R *.DFM}

procedure TfrmPRelPendencia.bbtnFecharClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmPRelPendencia.FormCreate(Sender: TObject);
begin
  inherited;
  bbtnConfirmar.Enabled:=False;
  qryVersao:=Twwquery.Create(Application);
  qryVersao.DatabaseName:='BaseDados';
  qryRubricas:=Twwquery.Create(Application);
  qryRubricas.DatabaseName:='BaseDados';
  AbreQryVersao;
end;

Procedure TfrmPRelPendencia.MontaFiltroVersao(sSt:String);
begin
  qryVersao.First;
  While Not qryVersao.Eof do
  begin
    If Trim(qryVersao.FieldByName('DESCRICAO').AsString)=Trim(sSt) then
      sInVersao:=sInVersao+qryVersao.FieldByName('IDHSTFOLHABENEF').AsString+',';
    qryVersao.Next;
  end;
end;

Procedure TfrmPRelPendencia.MontaFiltroRubricas(sSt:String);
begin
  qryRubricas.First;
  While Not qryRubricas.Eof do
  begin
    If Trim(qryRubricas.FieldByName('DESCRICAO').AsString)=Trim(sSt) then
      sInRubricas:=sInRubricas+qryRubricas.FieldByName('IDRUBRICA').AsString+',';
    qryRubricas.Next;  
  end;
end;                                      

Procedure TfrmPRelPendencia.AbreQryVersao;
begin
  With qryVersao do
  begin
    Close;
    Sql.Clear;
    Sql.Add(' SELECT IDHSTFOLHABENEF, HISTORICO AS DESCR, '+
            ' IDHSTFOLHABENEF ||''-''|| HISTORICO AS DESCRICAO '+
            ' FROM HSTFOLHABENEF '+
            ' WHERE FLGESTADO <> 2 '+
            ' ORDER BY IDHSTFOLHABENEF DESC ');
    Open;
    chklstVersao.Items.Clear;
    While Not Eof do
    begin
      chklstVersao.Items.Add(FieldByName('DESCRICAO').AsString);
      Next;
    end;
  end;
end; {AbreQryVersao}

Procedure TfrmPRelPendencia.AbreQryRubricas;
Var sSql : String;
    bErro: Boolean;
begin
  With qryRubricas do
  begin
    Close;
    Sql.Clear;
    sSql:='SELECT DISTINCT ';
    If SistemaFolha.FLGUSACODRUBEXT = 0 then
      sSql:=sSql+' PD.IDPROVENTO AS IDRUBRICA, '+
                 ' PD.DESCRICAO AS DESCPROVENTO, '+
                 ' PD.IDPROVENTO||'' - ''||PD.DESCRICAO AS DESCRICAO '
    else sSql:=sSql+' PD.CODPROVDESC AS IDRUBRICA, '+
                    ' PD.DESCRPROVDESC AS DESCPROVENTO, '+
                    ' PD.CODPROVDESC||'' - ''||PD.DESCRPROVDESC AS DESCRICAO ';
     sSql:=sSql+' FROM '+
                ' HISTRUBSAL HRS, '+
                ' PROVDESC PD '+
                ' WHERE '+
                ' HRS.IDHSTFOLHABENEF IN ('+sInVersao+') AND '+
                ' HRS.IDRUBRICA = PD.IDPROVENTO ';

     If SistemaFolha.FLGUSACODRUBEXT = 0 then
       sSql:=sSql+' ORDER BY PD.DESCRICAO '
     else sSql:=sSql+' ORDER BY PD.DESCRPROVDESC ';

    Sql.Add(sSql);
    Open;
    bErro:=False;
    While (Not Eof)And(Not bErro) do
    begin
      If (SistemaFolha.FLGUSACODRUBEXT = 1)And(Trim(FieldByName('IDRUBRICA').AsString)='') then
      begin
        MsgDlg('Código externo de rubrica em branco.',
                'Atenção', mtWarning, [mbOk], 0);
        bErro:=True;
      end;
      Next;
    end;
    chklstRubricas.Items.Clear;
    qryRubricas.First;
    While (Not Eof)And(Not bErro) do
    begin
      chklstRubricas.Items.Add(FieldByName('DESCRICAO').AsString);
      Next;
    end;
    bbtnConfirmar.Enabled:=(Not bErro)And(Not IsEmpty);
  end; {With}
end; {AbreQryRubricas}

procedure TfrmPRelPendencia.chklstVersaoClick(Sender: TObject);
Var I: Integer;
begin
  inherited;
  sInVersao:='';
  With chklstVersao do
  begin
    For I:= 0 to Items.Count - 1 do
    begin
      If Checked[I] then MontaFiltroVersao(Items[I]);
    end;
    If sInVersao<>'' then
    begin
      sInVersao:=Copy(sInVersao,1,Length(sInVersao)-1);
      AbreQryRubricas;
    end;
  end; {With}
end;

procedure TfrmPRelPendencia.chklstRubricasClick(Sender: TObject);
Var I: Integer;
begin
  inherited;
  sInRubricas:='';
  With chklstRubricas do
  begin
    For I:= 0 to Items.Count - 1 do
    begin
      If Checked[I] then MontaFiltroRubricas(Items[I]);
    end; {For}
    If sInRubricas<>'' then
      sInRubricas:=Copy(sInRubricas,1,Length(sInRubricas)-1);
  end; {With}
end;

procedure TfrmPRelPendencia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  If qryVersao<>Nil then
  begin
    qryVersao.Close;
    qryVersao.Free;
  end;
  If qryRubricas<>Nil then
  begin
    qryRubricas.Close;
    qryRubricas.Free;
  end;
end;

procedure TfrmPRelPendencia.bbtnConfirmarClick(Sender: TObject);
Var sSql: String;
begin
  dtmBaseDados.dbBaseDados.StartTransaction;
  if not Sistema.GravaLogOperacoes('Relat. de Rubricas de Desc. Pendentes de Processamento') then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;

  If sInVersao='' then
  begin
    MsgDlg('Selecione a Versão.','Atenção', mtWarning, [mbOk], 0);
    Exit;
  end;

  If sInRubricas='' then
  begin
    MsgDlg('Selecione a rubrica.','Atenção', mtWarning, [mbOk], 0);
    Exit;
  end;
  inherited;

  dtmRelPendencia.qryRelPendencia.Close;
  dtmRelPendencia.qryRelPendencia.SQL.Clear;

  sSql:=
    'SELECT '+
    ' HT.IDHSTFOLHABENEF, '+
    ' HT.HISTORICO, '+
    ' EL.MATRICULA, '+
    ' PR.NOME AS RECEBEDOR, '+
    ' SUBSTR(HRS.MES,6,2)||''/''||SUBSTR(HRS.MES,1,4) AS MESANOREF, '+
    ' HRS.VALORPROVENTO, '+
    ' HRS.VALORRECEBIDO, '+
    ' HRS.VALORRECEBIDO - HRS.VALORPROVENTO AS DIFERENCA, ';

  If SistemaFolha.FLGUSACODRUBEXT = 0 then
    sSql:=sSql+' PD.IDPROVENTO AS IDRUBRICA, '+
               ' PD.DESCRICAO AS DESCRUBRICA '
  else sSql:=sSql+' PD.CODPROVDESC AS IDRUBRICA, '+
                  ' PD.DESCRPROVDESC AS DESCRUBRICA ';

  sSql:=sSql+
    ' FROM HISTRUBSAL HRS, HSTFOLHABENEF HT, PESSOA PR, '+
    ' ELEGPATRO EL, PROVDESC PD '+
    ' WHERE '+
    ' HRS.IDHSTFOLHABENEF IN ('+sInVersao+') AND ';

  If SistemaFolha.FLGUSACODRUBEXT = 0 then
    sSql:=sSql+' HRS.IDRUBRICA IN ('+sInRubricas+') AND '
  else sSql:=sSql+' HRS.CODPROVDESC IN ('+sInRubricas+') AND ';

  sSql:=sSql+
    ' HRS.VALORPROVENTO < HRS.VALORRECEBIDO AND '+
    ' (HRS.FLGESTORNO = 0 OR HRS.FLGESTORNO IS NULL)  AND '+
    ' HRS.IDPESSOA = PR.IDPESSOA AND '+
    ' HRS.IDTITULAR = EL.IDPESSOA AND '+
    ' HRS.IDHSTFOLHABENEF = HT.IDHSTFOLHABENEF AND'+
    ' HRS.IDRUBRICA = PD.IDPROVENTO ';

  If rdgOrdem.ItemIndex=0 then
    sSql:=sSql+' ORDER BY HT.IDHSTFOLHABENEF, EL.MATRICULA, IDRUBRICA '
  else sSql:=sSql+' ORDER BY HT.IDHSTFOLHABENEF, PR.NOME, IDRUBRICA ';
  
  dtmRelPendencia.qryRelPendencia.SQL.Add(sSql);
  dtmRelPendencia.qryRelPendencia.Open;
  
  If dtmRelPendencia.qryRelPendencia.IsEmpty then
    MsgDlg('Não existe informação para o relatório'+#13+
           'nos parâmetros correntes. ','Informação',mtInformation,[mbOK],0);
end;

end.
{==============================================================================|
| UNIT: fPRelPendenciaFolha                                                    |
| DESCRIÇÃO FUNCIONAL: Relatório de rubricas de desconto pendentes de          |
|  processamento.                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: Sidnei de Brito Marins.                                       |
| PERÍODO DE IMPLEMENTAÇÃO: DE 29/10/2002 A 30/10/2002.                        |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Criação da Unit.                                 |
|------------------------------------------------------------------------------}


