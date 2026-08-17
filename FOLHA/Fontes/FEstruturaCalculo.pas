{
Alterações:
--------------------------------------------------------------------------------
Pendência   : SIG TIBERO
Responsável : Everson Luiz Pereira da Cunha
Data        : 21/02/2018
Descrição   : Ajustes nos SQL, incluindo os alias nas tabelas/campos.
              Retirada de INDEX, +rule etc.
              Melhoria realizada para adaptação ao TIBERO.
--------------------------------------------------------------------------------
}

unit FEstruturaCalculo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, CmEventosCadastro, ImgList, MontaSelect, DBTables,
  IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn, TB97Tlbr,
  StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls, wwdblook, uobjfolha, USistema, DBCtrls;

type
  TfrmEstruturaCalculo = class(TfrmCadMestreDetalheCS)
    qryRegra: TwwQuery;
    qryRubrica: TwwQuery;
    qryRubricaNaoAssoc: TwwQuery;
    qryAssoc: TwwQuery;
    qryAux: TwwQuery;
    pnlEstruturaCalc: TPanel;
    GroupBox1: TGroupBox;
    dblkRegra: TwwDBLookupCombo;
    GroupBox2: TGroupBox;
    edtDescricao: TEdit;
    GroupBox4: TGroupBox;
    dblkRubrica: TwwDBLookupCombo;
    PnlEdita: TPanel;
    GroupBox5: TGroupBox;
    cmbGrupo: TComboBox;
    GroupBox3: TGroupBox;
    dblkRubricaAssoc: TwwDBLookupCombo;
    dsAssoc: TwwDataSource;
    dbgAssoc: TwwDBGrid;
    qrydet: TwwQuery;
    updet: TUpdateSQL;
    dbrgAtivo: TDBRadioGroup;
    dbcboxValor: TDBCheckBox;
    procedure sbtnProcurarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dbgAssocDblClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgAssocCellChanged(Sender: TObject);
  private
    { Private declarations }
    iIdEstrutura : Longint;
    sDescricao,
    sIdRegra,
    sIdRubricaAssoc,
    sIdRubricaExibicao : String;
    iGrupo : Byte;
    bErro  : Boolean;
    Function Atualiza(sSql,Ms:String):Boolean;
    Procedure VerificaBtn;
    Procedure AbreQryRegra;
    Procedure AbreQryRubrica;
    Procedure AbreQryRubricaNaoAssoc;
    Procedure AbreQryAssoc;
    Function LocalizaQry:Boolean;
    Function LocalizaRegra:Boolean;
    Function LocalizaRubrica:Boolean;
    Procedure MostraEstruturaCalculo;
    Procedure AtualizaDetalhe;
  public
    { Public declarations }
  end;

var
  FrmEstruturaCalculo: TFrmEstruturaCalculo;

implementation

Uses uMensErro, dBaseDados, uDataBase, uFolhaBenef;

{$R *.DFM}

Const MaxGrupo = 9;

Function TFrmEstruturaCalculo.Atualiza(sSql,Ms:String):Boolean;
begin
  With qryAux do
  begin
    Close;
    Sql.Clear;
    Sql.Add(sSql);
    try
      ExecSql;
      Result:=True;
    Except
      MsgDlg('Erro ao '+Ms+' Registro.', 'Aviso', mtWarning,
           [mbOk, mbHelp],0);
      Result:=False;
    end;
  end; {With}
end;

Procedure TFrmEstruturaCalculo.VerificaBtn;
begin
  sbtnInserir.Enabled:=True;
  sbtnAlterar.Enabled:=False;
  sbtnApagar.Enabled:=False;
  sbtnProcurar.Enabled:=True;
  sbtnAlterar.Down:=False;
  sbtnApagar.Down:=False;
  sbtnProcurar.Down:=False;
  If Not qry.IsEmpty then
  begin
    sbtnAlterar.Enabled:=True;
    sbtnApagar.Enabled:=True;
  end;
  sbtnInsDet.Enabled:=False;
  sbtnAltDet.Enabled:=False;
  sbtnExcluiDet.Enabled:=False;
  sbtnInsDet.Down:=False;
  sbtnAltDet.Down:=False;
  sbtnExcluiDet.Down:=False;
end;

Procedure TFrmEstruturaCalculo.AbreQryRegra;
Var sSql: String;
begin
  If SistemaFolha.FLGUSAREGRAXRUB = 1 then
    sSql:=' SELECT R.IDREGRA, R.NOMEREGRA FROM REGRA R, TIPOREGRA TR, '+
          ' GRUPOREGRA GR WHERE R.IDTIPOREGRA = TR.IDTIPOREGRA AND '+
          ' TR.IDGRUPOREGRA = GR.IDGRUPOREGRA AND GR.IDGRUPOREGRA = '+
          inttostr(SistemaFolha.IDGRUPOREGRAFOLHA)+
          ' ORDER BY UPPER(R.NOMEREGRA) '
  else sSql:='SELECT IDREGRA, NOMEREGRA '+
        ' FROM REGRA ORDER BY UPPER(NOMEREGRA) ';
  With qryRegra do
  begin
    Close;
    Sql.Clear;
    Sql.Add(sSql);
    Open;
  end;
end;

Procedure TFrmEstruturaCalculo.AbreQryRubrica;
Var sSql: String;
begin
  sSql:='SELECT IDPROVENTO, ';
  If SistemaFolha.FlgUsaCodRubExt = 0 then
    sSql:=sSql+' IDPROVENTO || '' - '' || DESCRICAO AS JUNCAORUBRICA '

  else sSql:=sSql+' CODPROVDESC || '' - '' || DESCRPROVDESC AS JUNCAORUBRICA ';

  sSql:=sSql+' FROM PROVDESC '+
             ' WHERE '+
             ' FLGTPRUBRICA LIKE ''%B%'' ';
  If SistemaFolha.FlgUsaCodRubExt = 0 then
    sSql:=sSql+'ORDER BY DESCRICAO '
  else sSql:=sSql+'ORDER BY DESCRPROVDESC ';

  With qryRubrica do
  begin
    Close;
    Sql.Clear;
    Sql.Add(sSql);
    Open;
  end;
end;

Procedure TFrmEstruturaCalculo.AbreQryRubricaNaoAssoc;
Var sSql: String;
begin
  sSql:='SELECT IDPROVENTO, ';
  If SistemaFolha.FlgUsaCodRubExt = 0 then
    sSql:=sSql+' IDPROVENTO ||'' - ''|| DESCRICAO AS JUNCAO '
  else sSql:=sSql+' CODPROVDESC ||'' - ''|| DESCRPROVDESC AS JUNCAO ';

//  sSql:=sSql+' FROM PROVDESC '+   //Everson TIBERO
  sSql:=sSql+' FROM PROVDESC p '+   //Everson TIBERO
             ' WHERE '+
             ' (FLGESPECIAL = 0) AND '+
             ' (NOT EXISTS (SELECT IDRUBRICA '+
//                          ' FROM ESTRUTURAXRUBRICA '+ //Everson TIBERO
                          ' FROM ESTRUTURAXRUBRICA e '+ //Everson TIBERO
                          ' WHERE '+
                          ' IDESTRUTURA = '+IntToStr(iIdEstrutura)+' AND '+
//                          ' IDRUBRICA = IDPROVENTO)) ';   //Everson TIBERO
                          ' e.IDRUBRICA = p.IDPROVENTO)) '; //Everson TIBERO
  If SistemaFolha.FlgUsaCodRubExt = 0 then
    sSql:=sSql+'ORDER BY DESCRICAO '
  else sSql:=sSql+'ORDER BY DESCRPROVDESC ';

  With qryRubricaNaoAssoc do
  begin
    Close;
    Sql.Clear;
    Sql.Add(sSql);
    Open;
  end;
end;

Procedure TFrmEstruturaCalculo.AbreQryAssoc;
Var sSql: String;
begin
  sSql:='SELECT PV.IDPROVENTO,';
  If SistemaFolha.FlgUsaCodRubExt = 0 then
    sSql:=sSql+' PV.IDPROVENTO AS CODRUBRICA, PV.DESCRICAO, '+
               ' PV.IDPROVENTO ||'' - ''|| PV.DESCRICAO AS JUNCAO, '
  else sSql:=sSql+' PV.CODPROVDESC AS CODRUBRICA, PV.DESCRPROVDESC AS DESCRICAO, '+
                  ' PV.CODPROVDESC ||'' - ''|| PV.DESCRPROVDESC AS JUNCAO, ';

  sSql:=sSql+' SR.GRUPOCALCULO '+
             ' FROM '+
             ' PROVDESC PV, '+
             ' ESTRUTURACALCULO ST, ESTRUTURAXRUBRICA SR'+
             ' WHERE '+
             ' PV.FLGESPECIAL = 0 AND '+
             ' ST.IDESTRUTURA = '+IntToStr(iIdEstrutura)+' AND '+
             ' ST.IDESTRUTURA = SR.IDESTRUTURA AND '+
             ' SR.IDRUBRICA = IDPROVENTO ';
  If SistemaFolha.FlgUsaCodRubExt = 0 then
    sSql:=sSql+' ORDER BY SR.GRUPOCALCULO, PV.IDPROVENTO '
  else sSql:=sSql+' ORDER BY SR.GRUPOCALCULO, PV.CODPROVDESC ';

  With qryAssoc do
  begin
    Close;
    Sql.Clear;
    Sql.Add(sSql);
    Open;
    VerificaBtn;
  end; {With}
end;

Function TFrmEstruturaCalculo.LocalizaQry:Boolean;
begin
  Result:=False;
  If iIdEstrutura>=0 then
    With qry do
    begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT IDESTRUTURA,DESCRICAO,IDREGRA,IDRUBRICAEXIBICAO,IDFUNDACAO,'+
              'FLGATIVO, FLGVALIDO '+ 
              ' FROM ESTRUTURACALCULO '+
              ' WHERE IDESTRUTURA = '+IntToStr(iIdEstrutura));
      Open;
      VerificaBtn;
      Result:=Not IsEmpty;
    end; {With}
end;

Function TFrmEstruturaCalculo.LocalizaRegra:Boolean;
begin
  qryRegra.First;
  Repeat
    If qryRegra.FieldByName('IDREGRA').AsString<>sIdRegra then
      qryRegra.Next;
  Until(qryRegra.FieldByName('IDREGRA').AsString=sIdRegra)Or(qryRegra.Eof);
  Result:=qryRegra.FieldByName('IDREGRA').AsString=sIdRegra;
end;

Function TFrmEstruturaCalculo.LocalizaRubrica:Boolean;
begin
  qryRubrica.First;
  Repeat
    If qryRubrica.FieldByName('IDPROVENTO').AsString<>sIdRubricaExibicao then
      qryRubrica.Next;
  Until(qryRubrica.FieldByName('IDPROVENTO').AsString=sIdRubricaExibicao)Or(qryRubrica.Eof);
  Result:=qryRubrica.FieldByName('IDPROVENTO').AsString=sIdRubricaExibicao;
end;

Procedure TFrmEstruturaCalculo.MostraEstruturaCalculo;
begin
  pnlEdita.Enabled:=False;
  edtDescricao.Text:='';
  dblkRegra.Text:='';
  dblkRubrica.Text:='';
  With qry do
  begin
    LocalizaQry;
    If Not IsEmpty then
    begin
      iIdEstrutura:=StrToIntDef(FieldByName('IDESTRUTURA').AsString,0);
      sDescricao  :=FieldByName('DESCRICAO').AsString;
      sIdRegra    :=FieldByName('IDREGRA').AsString;
      sIdRubricaExibicao:=FieldByName('IDRUBRICAEXIBICAO').AsString;
      edtDescricao.Text:=sDescricao;
      AbreQryRubricaNaoAssoc;
      AbreQryAssoc;
      If LocalizaRegra then
      begin
        dblkRegra.LookupValue:=qryRegra.FieldByName('IDREGRA').AsString;
        dblkRegra.Text:=qryRegra.FieldByName('NOMEREGRA').AsString;
      end;
      If LocalizaRubrica then
      begin
        dblkRubrica.LookupValue:=qryRubrica.FieldByName('IDPROVENTO').AsString;
        dblkRubrica.Text:=qryRubrica.FieldByName('JUNCAORUBRICA').AsString;
      end;
    end; {IsEmpty}
  end; {With}
  If Not qryAssoc.IsEmpty then
  begin
    iGrupo:=StrToIntDef(qryAssoc.FieldByName('GRUPOCALCULO').AsString,0);
    If iGrupo In [1..MaxGrupo] then
    begin
      dblkRubricaAssoc.Text:=qryAssoc.FieldByName('JUNCAO').AsString;
      CmbGrupo.ItemIndex:=iGrupo-1;
    end;
  end;

  AbreQryAssoc;
  dblkRubricaAssoc.Clear;
  cmbGrupo.ItemIndex := -1;
end;

Procedure TFrmEstruturaCalculo.AtualizaDetalhe;
begin
  bErro:=False;
  If (sbtnInsDet.Down)Or(sbtnAltDet.Down) then
  begin
    sDescricao:=EdtDescricao.Text;
    sIdRegra:=dblkRegra.LookupValue;
    sIdRubricaExibicao:=dblkRubrica.LookupValue;

    if (sbtnAltDet.Down) then
      sIdRubricaAssoc:=qryAssoc.fieldbyname('idprovento').asstring
    else
      sIdRubricaAssoc:=dblkRubricaAssoc.LookupValue;

    iGrupo:=cmbGrupo.ItemIndex+1;
    If (iIdEstrutura>0)And(sDescricao<>'')And
       (StrToIntDef(sIdRegra,0)>0)And(StrToIntDef(sIdRubricaExibicao,0)>0)And
       (StrToIntDef(sIdRubricaAssoc,0)>0)And(iGrupo In [1..MaxGrupo])  then
    begin
      If not dtmbasedados.dbBaseDados.InTransaction then
        dtmbasedados.dbBaseDados.StartTransaction;
      If sbtnInsDet.Down  then
        bErro:=Not Atualiza('INSERT INTO ESTRUTURAXRUBRICA '+
                ' (IDESTRUTURA,IDRUBRICA,GRUPOCALCULO) '+
                ' VALUES ('+IntToStr(iIdEstrutura)+','+sIdRubricaAssoc+','+
                            QuotedStr(IntToStr(iGrupo))+')','Inserir')
      else
      If sbtnAltDet.Down  then
        bErro:=Not Atualiza('UPDATE ESTRUTURAXRUBRICA '+
                ' SET IDRUBRICA = '+sIdRubricaAssoc+','+
                ' GRUPOCALCULO = '+QuotedStr(IntToStr(iGrupo))+' '+
                ' WHERE '+
                ' IDESTRUTURA = '+IntToStr(iIdEstrutura)+' AND '+
                ' IDRUBRICA = '+qryAssoc.FieldbyName('IDPROVENTO').AsString+' AND '+
                ' GRUPOCALCULO = '+qryAssoc.FieldbyName('GRUPOCALCULO').AsString,'Alterar');
      If Not bErro then
        dtmBaseDados.dbBaseDados.Commit
      else
      begin
        dtmBaseDados.dbBaseDados.RollBack;
        MsgDlg('Houve erro ao processar','Atenção!',mtError,[mbOk,mbHelp],0);
      end;
    end;
  end;
end;

procedure TfrmEstruturaCalculo.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  iIdEstrutura:=0;
  sDescricao:='';
  sIdRegra:='';
  sIdRubricaExibicao:='';
  sIdRubricaAssoc:='';
  iGrupo:=0;
  edtDescricao.Text:='';
  dblkRegra.LookupValue:='';
  dblkRegra.Text:='';
  dblkRubrica.LookupValue:='';
  dblkRubrica.Text:='';
  sbtnAlterar.Enabled:=False;
  sbtnApagar.Enabled:=False;
  pnlEdita.Enabled:=False;
  pnlEstruturaCalc.Enabled:=False;
  If (MontaSelect.RetornouValor)And
      (StrToIntDef(MontaSelect.ValoresChave[0],0)>0) then
  begin
    iIdEstrutura:=StrToIntDef(MontaSelect.ValoresChave[0],0);
    MostraEstruturaCalculo;
    VerificaBtn; 
  end;
end;

procedure TfrmEstruturaCalculo.bbtnConfirmarClick(Sender: TObject);
begin
  If (qry.State in [dsinsert])Or(qry.State in [dsEdit]) then
  begin
    sDescricao:=EdtDescricao.Text;
    sIdRegra:=dblkRegra.LookupValue;
    sIdRubricaExibicao:=dblkRubrica.LookupValue;
    If StrToIntDef(sIdRegra, 0) = 0 Then
    Begin
      MsgDlg('Para cadastrar esse registro é obrigatório a escolha da regra de cálculo.', 'Informação', mtInformation, [mbOk], 0);
      Exit;
    End;

    If StrToIntDef(sIdRubricaExibicao, 0) = 0 Then
    Begin
      MsgDlg('Para cadastrar esse registro é obrigatório a escolha da rubrica de exibição.', 'Informação', mtInformation, [mbOk], 0);
      Exit;
    End;

    If (sDescricao<>'')And(StrToIntDef(sIdRegra,0)>0)And
       (StrToIntDef(sIdRubricaExibicao,0)>0) then
    begin
      qry.FieldByName('IDESTRUTURA').AsInteger:=iIdEstrutura;
      qry.FieldByName('DESCRICAO').AsString:=sDescricao;
      qry.FieldByName('IDREGRA').AsInteger:=StrToInt(sIdRegra);
      qry.FieldByName('IDRUBRICAEXIBICAO').AsInteger:=StrToInt(sIdRubricaExibicao);
      qry.FieldByName('IDFUNDACAO').AsInteger := SISTEMA.IdEmpresa;
      inherited;
    end;
  end;
  (* Faz Atualização na ESTRUTURAXRUBRICA *)
  AtualizaDetalhe;
  MostraEstruturaCalculo;
  sbtnInserir.Down:=False;
end;

procedure TfrmEstruturaCalculo.dbgAssocDblClick(Sender: TObject);
begin
  inherited;

  If qryAssoc.IsEmpty then Exit;
  iGrupo:=StrToIntDef(qryAssoc.FieldByName('GRUPOCALCULO').AsString,0);
  If iGrupo In [1..MaxGrupo] then
  begin
    dblkRubricaAssoc.Text:=qryAssoc.FieldByName('JUNCAO').AsString;
    dblkRubricaAssoc.LookupValue:=qryAssoc.FieldByName('IDPROVENTO').AsString;
    CmbGrupo.ItemIndex:=iGrupo-1;
  end;
end;

procedure TfrmEstruturaCalculo.sbtnExcluiDetClick(Sender: TObject);
begin
  If (dblkRubricaAssoc.Text='')Or(CmbGrupo.Text='')Or
      (qryAssoc.Eof)Or(qryAssoc.IsEmpty)Or(sbtnInserir.Down) then Exit;
  bErro:=False;

  If (dblkRubricaAssoc.Text='')Or(CmbGrupo.Text='') then Exit;

  sbtnInsDet.Enabled:=False;
  sbtnAltDet.Enabled:=False;

  If MsgDlg('Deseja realmente apagar o registro?', 'Informação',
                  mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
    sDescricao:=EdtDescricao.Text;
    sIdRegra:=dblkRegra.LookupValue;
    sIdRubricaExibicao:=dblkRubrica.LookupValue;
    sIdRubricaAssoc := qryAssoc.FieldByName('IDPROVENTO').AsString;
    iGrupo:=cmbGrupo.ItemIndex+1;
    If (iIdEstrutura>0)And(sDescricao<>'')And
       (StrToIntDef(sIdRegra,0)>0)And(StrToIntDef(sIdRubricaExibicao,0)>0)And
       (StrToIntDef(sIdRubricaAssoc,0)>0)And(iGrupo In [1..MaxGrupo])  then
    begin
      If not dtmbasedados.dbBaseDados.InTransaction then
        dtmbasedados.dbBaseDados.StartTransaction;
      bErro:=Not Atualiza('DELETE ESTRUTURAXRUBRICA '+
                   ' WHERE '+
                   ' IDESTRUTURA = '+IntToStr(iIdEstrutura)+' AND '+
                   ' IDRUBRICA = '+sIdRubricaAssoc+' AND '+
                   ' GRUPOCALCULO = '+QuotedStr(IntToStr(iGrupo)),'Apagar');
      If Not bErro then
        dtmBaseDados.dbBaseDados.Commit
      else
      begin
        dtmBaseDados.dbBaseDados.RollBack;
        MsgDlg('Houve erro ao processar','Atenção!',mtError,[mbOk,mbHelp],0);
      end;
    end;
  end;
  MostraEstruturaCalculo;
end;

procedure TfrmEstruturaCalculo.sbtnApagarClick(Sender: TObject);
begin
  sbtnInserir.Enabled:=False;
  sbtnAlterar.Enabled:=False;
  sbtnProcurar.Enabled:=False;
  sDescricao:=EdtDescricao.Text;
  sIdRegra:=dblkRegra.LookupValue;
  sIdRubricaExibicao:=dblkRubrica.LookupValue;
  bErro:=False;

  If MsgDlg('Deseja realmente apagar o registro?', 'Informação',
                  mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
    If (iIdEstrutura>0)And(sDescricao<>'')And
       (StrToIntDef(sIdRegra,0)>0)And
       (StrToIntDef(sIdRubricaExibicao,0)>0) then
    begin
      If not dtmbasedados.dbBaseDados.InTransaction then
        dtmbasedados.dbBaseDados.StartTransaction;
      bErro:=Not Atualiza('DELETE ESTRUTURAXRUBRICA '+
                   ' WHERE '+
                   ' IDESTRUTURA = '+IntToStr(iIdEstrutura),'Apagar');
      If Not bErro then
        dtmBaseDados.dbBaseDados.Commit
      else
      begin
        dtmBaseDados.dbBaseDados.RollBack;
        MsgDlg('Houve erro ao processar','Atenção!',mtError,[mbOk,mbHelp],0);
      end;

      If not dtmbasedados.dbBaseDados.InTransaction then
        dtmbasedados.dbBaseDados.StartTransaction;
      bErro:=Not Atualiza('DELETE ESTRUTURACALCULO '+
                   ' WHERE '+
                   ' IDESTRUTURA = '+IntToStr(iIdEstrutura),'Apagar');
      If Not bErro then
        dtmBaseDados.dbBaseDados.Commit
      else
      begin
        dtmBaseDados.dbBaseDados.RollBack;
        MsgDlg('Houve erro ao processar','Atenção!',mtError,[mbOk,mbHelp],0);
      end;
    end;
  end;
  MostraEstruturaCalculo;
end;

procedure TfrmEstruturaCalculo.sbtnAltDetClick(Sender: TObject);
begin
  If (dblkRubricaAssoc.Text='')Or(CmbGrupo.Text='')Or
      (qryAssoc.Eof)Or(qryAssoc.IsEmpty)Or(sbtnInserir.Down) then Exit;
  pnlEdita.Enabled:=True;
  sbtnInsDet.Enabled:=False;
  sbtnExcluiDet.Enabled:=False;
end;

procedure TfrmEstruturaCalculo.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  pnlEstruturaCalc.Enabled:=False;
  MostraEstruturaCalculo;
end;

procedure TfrmEstruturaCalculo.sbtnAlterarClick(Sender: TObject);
begin
  pnlEstruturaCalc.Enabled:=True;
  inherited;
  VerificaBtn;
  sbtnInsDet.Down:=False;
  sbtnAltDet.Down:=False;
  sbtnInsDet.Enabled:=True;
  If Not qryAssoc.IsEmpty then
  begin
    sbtnAltDet.Enabled:=True;
    SbtnExcluiDet.Enabled:=True;
  end;
  sbtnInserir.Enabled:=False;
  sbtnApagar.Enabled:=False;
  sbtnProcurar.Enabled:=False;
  pnlEdita.Enabled:=False;
  qry.Edit;
end;

procedure TfrmEstruturaCalculo.sbtnInserirClick(Sender: TObject);
begin
  If sbtnInserir.Down then
  begin
    inherited;
    pnlEdita.Enabled:=False;
    sbtnInsDet.Enabled:=False;
    iIdEstrutura:=LeUltRegistro(Nil,'ESTRUTURACALCULO');
    LocalizaQry;
    AbreQryAssoc;
    pnlEstruturaCalc.Enabled:=True;
    dblkRubricaAssoc.Text:='';
    sbtnInsDet.Enabled:=False;
    sbtnAltDet.Enabled:=False;
    sbtnExcluiDet.Enabled:=False;
    sbtnProcurar.Enabled:=False;
    cmbGrupo.ItemIndex:=-1;
    edtDescricao.Text:='';
    qry.Insert;
  end;
  If edtDescricao.Visible then edtDescricao.SetFocus;
end;

procedure TfrmEstruturaCalculo.sbtnInsDetClick(Sender: TObject);
begin
  pnlEdita.Enabled:=True;
  AbreqryRubricaNaoAssoc;
  sbtnAltDet.Enabled:=False;
  sbtnExcluiDet.Enabled:=False;
end;

procedure TfrmEstruturaCalculo.FormCreate(Sender: TObject);
begin
  inherited;
  cmbGrupo.ItemIndex:=-1;
  sbtnAlterar.Enabled:=False;
  sbtnApagar.Enabled:=False;
  pnlEdita.Enabled:=False;
  pnlEstruturaCalc.Enabled:=False;
  iIdEstrutura:=0;
  sDescricao:='';
  sIdRegra:='';
  sIdRubricaExibicao:='';
  iGrupo:=0;
  bErro:=False;
  LocalizaQry;
  AbreqryRegra;
  AbreQryRubrica;
  AbreQryAssoc;
  MontaSelect.Filtro.Add('IDFUNDACAO = '+inttostr(Sistema.IdEmpresa)); 
end;


procedure TfrmEstruturaCalculo.dbgAssocCellChanged(Sender: TObject);
begin
  inherited;
  If qryAssoc.IsEmpty then Exit;
  iGrupo:=StrToIntDef(qryAssoc.FieldByName('GRUPOCALCULO').AsString,0);
  If iGrupo In [1..MaxGrupo] then
  begin
    dblkRubricaAssoc.Text:=qryAssoc.FieldByName('JUNCAO').AsString;
    CmbGrupo.ItemIndex:=iGrupo-1;
  end;
end;

end.

{------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE 19/08/2002 A 19/08/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.13o                                              |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Alterei o filtro da query qryRubricaprocedure na procedure AbreQryRubrica, |
|   de forma a so pegar rubricas da Folha de Benefícios                        |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: Ricardo Vigorito                                              |
| PERÍODO DE IMPLEMENTAÇÃO: 13/01/2004                                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| PEDÊNCIA:  15935                                                             |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   - Passou a incluir a Fundação da tabela ESTRUTURACALCULO                   |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 20/09/2005 A 20/09/2005                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| PENDÊNCIA: 14685, 17197, 19912                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ADAPTAR PARA MULTIFUNDACAO                                                 |
| - COLOCAR MANUTENÇÃO DOS CAMPOS FLGATIVO E FLGVALIDO                         |
|                                                                              |
|------------------------------------------------------------------------------}


