unit fCpLayout;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, StdCtrls, DBCtrls, Mask, IvDictio, IvMulti, IvEMulti,
  MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  CmEventosCadastro, ImgList, wwdbedit, Wwdotdot, Wwdbcomb, wwdblook;

type
  TFrmCpLayout = class(TFrmCadastroGridCS)
    Label2: TLabel;
    Label3: TLabel;
    qryTpLayout: TwwQuery;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    cbFlgValor: TComboBox;
    qryIns: TwwQuery;
    DsTpLayout: TwwDataSource;
    CmbIdLayout: TwwDBLookupCombo;
    EdPosInicial: TEdit;
    EdPosFinal: TEdit;
    edNomeCpo: TEdit;
    Label1: TLabel;
    EdTipoReg: TEdit;
    rdgTipoReg: TRadioGroup;
    pnlInf: TPanel;
    ListBoxInf: TListBox;
    pnlTitInf: TPanel;
    gbInf: TGroupBox;
    btnInf: TBitBtn;
    gbStatusInf: TGroupBox;
    spbtnFechar: TSpeedButton;
    gbDestino: TGroupBox;
    cbArquivo: TComboBox;
    procedure qryBeforePost(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure dbGrdDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure rdgTipoRegClick(Sender: TObject);
    procedure CmbIdLayoutChange(Sender: TObject);
    procedure edNomeCpoChange(Sender: TObject);
    procedure btnInfClick(Sender: TObject);
    procedure spbtnFecharClick(Sender: TObject);
    procedure cbArquivoChange(Sender: TObject);
  private
    { Private declarations }
    Function VerifCp(St:String;Tp:Char): Boolean;
    Function PosicaoOk(St,St2:String): Boolean;
    Function ExisteErro: Boolean;
    Procedure VerificaRdg;
    Procedure EditaCampos;

  public
    { Public declarations }
  end;

Var
  FrmCpLayout: TFrmCpLayout;
  sIdCpLayout,
  sIdLayout,
  sFlgValor,
  sNomeCpo,
  sTipoReg   : String;

implementation

uses UMensErro, UDataBase, DBaseDados, USistema, ULayoutAss;

{$R *.DFM}

Function TFrmCpLayout.VerifCp(St:String;Tp:Char): Boolean;
Var NInt, Erro: Integer;
begin
  Val(St,NInt,Erro);
  (* Se FlgValor Tp='1' *)
  If (Tp='1')And(NInt In [0..4])And(Erro=0) then Result:=True
  else If (Tp='0')And(NInt>0)And(Erro=0) then Result:=True
  else Result:= False;
end;

Function TFrmCpLayout.PosicaoOk(St,St2:String): Boolean;
Var NIni,NFi,Erro: Integer;
begin
  NFi:=0;
  Val(St,NIni,Erro);
  If Erro=0 then Val(St2,NFi,Erro);
  Result:=(NIni<=NFi)And(Erro=0);
end;

Procedure TFrmCpLayout.VerificaRdg;
begin
  edTipoReg.Text:='';
  Case RdgTipoReg.ItemIndex Of
    0: begin
         edNomeCpo.Font.Color:=clRed;
         edTipoReg.Enabled:=True;
         edNomeCpo.Text:='HEADER';
         edNomeCpo.ReadOnly:=True;
       end;
    1: begin
         edNomeCpo.Font.Color:=clBlack;
         edTipoReg.Enabled:=True;
         edNomeCpo.Text:='';
         edNomeCpo.ReadOnly:=False;
       end;
    2: begin
         edNomeCpo.Font.Color:=clBlue;
         edTipoReg.Enabled:=True;
         edNomeCpo.Text:='TRAILER';
         edNomeCpo.ReadOnly:=True;
       end;
  end; {Case}
end;

Procedure TFrmCpLayout.EditaCampos;
begin
  sNomeCpo:='';
  EdNomeCpo.Text:='';
  EdTipoReg.Text:='';
  EdPosInicial.Text:='';
  EdPosFinal.Text:='';
  cbFlgValor.ItemIndex:=-1;
  sIdCpLayout:='';
  sIdLayout:=qry.FieldByName('IdLayout').AsString;
  sbtnAlterar.Enabled:=Not qry.IsEmpty;
  sbtnApagar.Enabled:=Not qry.IsEmpty;
  If qry.IsEmpty then Exit;
  sIdCpLayout:=qry.FieldByName('IdCpLayout').AsString;
  sIdLayout:=qry.FieldByName('IdLayout').AsString;
  sNomeCpo:=qry.FieldByName('NomeCpo').AsString;
  edTipoReg.Text:=qry.FieldByName('TipoReg').AsString;
  If EdTipoReg.Text='#@'then EdTipoReg.Text:='';
  EdPosInicial.Text:=qry.FieldByName('PosInicial').AsString;
  EdPosFinal.Text:=qry.FieldByName('PosFinal').AsString;
  sFlgValor:=qry.FieldByName('FlgValor').AsString;
  cbFlgValor.ItemIndex:=StrToIntDef(sFlgValor,0);
  qryTpLayout.Locate('IDLAYOUT',sIdLayOut,[loPartialKey]) ;
  CmbIdLayout.Text:=qryTpLayout.FieldByName('Descricao').AsString;
  dbGrd.BringToFront;
  If sNomeCpo='HEADER' then rdgTipoReg.ItemIndex:=0
  else If sNomeCpo='TRAILER' then rdgTipoReg.ItemIndex:=2
  else rdgTipoReg.ItemIndex:=1;
  edNomeCpo.Text:=sNomeCpo;
end;

procedure TFrmCpLayout.qryBeforePost(DataSet: TDataSet);
begin
  if qry.State in [dsinsert] then
    qry.FieldByName('IDCPLAYOUT').AsInteger := LeUltRegistro(nil,'CPLAYOUT');
  inherited;
end;

Function TFrmCpLayout.ExisteErro: Boolean;
Var cCh: Char;
begin
  cCh:=#0;
  If Not VerifCp(cmbIdLayout.LookupValue,'0') then cCh:='1'
  else If sNomeCpo='' then cCh:='2'
  else If Not VerifCp(EdPosInicial.Text,'0') then cCh:='3'
  else If Not VerifCp(EdPosFinal.Text,'0') then cCh:='4'
  else If Not VerifCp(sFlgValor,'1') then cCh:='5'
  {else If sTiporeg='' then cCh:='6'}
  else If Not PosicaoOk(EdPosInicial.Text,EdPosFinal.Text) then cCh:='7';
  Case cCh of
    '1' : MsgDlg('Erro no código do Layout.','Erro',mtError,[mbOk,mbHelp],0);
    '2' : MsgDlg('Nome do campo em branco.','Erro',mtError,[mbOk,mbHelp],0);
    '3' : MsgDlg('Erro na posição Inicial.','Erro',mtError,[mbOk,mbHelp],0);
    '4' : MsgDlg('Erro na posição Final.','Erro',mtError,[mbOk,mbHelp],0);
    '5' : MsgDlg('Erro no Indicador de Valor.','Erro',mtError,[mbOk,mbHelp],0);
  {  '6' : MsgDlg('Erro no Identificador do registro.','Erro',mtError,[mbOk,mbHelp],0);}
    '7' : MsgDlg('Erro na posição.','Erro',mtError,[mbOk,mbHelp],0);
  end;
  Case cCh Of
    '2' : edNomeCpo.SetFocus;
    '3' : EdPosInicial.SetFocus;
    '4' : EdPosFinal.SetFocus;
    '5' : cbFlgValor.SetFocus;
   { '6' : edTipoReg.SetFocus;}
    '7' : EdPosInicial.SetFocus;
  end;
  ExisteErro:=cCh<>#0;
end;

procedure TFrmCpLayout.bbtnConfirmarClick(Sender: TObject);
Var iIdCpLayout: Integer;
    sSql: String;
begin
  sIdLayout:=qryTpLayout.FieldByName('IdLayout').AsString;
  sNomeCpo:=UpperCase(edNomeCpo.Text);
  sTipoReg:='';
  sSql:='';
  sFlgValor:='0';
  Case CbFlgValor.ItemIndex Of
    1: sFlgValor:='1';
    2: sFlgValor:='2';
    3: sFlgValor:='3';
    4: sFlgValor:='4';
    5: sFlgValor:='5';
    6: sFlgValor:='6';
  end; {Case}

  sTipoReg:=EdTipoReg.Text;
  IF Not sbtnApagar.Down then
  begin
   (* #@ - Caso o arquivo movimento não tenha Header ou Trailer *)
    (*
    If (sTipoReg='')And(sNomeCpo<>'HEADER')And
        (sNomeCpo<>'TRAILER') then sTipoReg:='#@';
    *)
    (*
    If (sTipoReg='')And(sNomeCpo='HEADER')Or
        (sNomeCpo='TRAILER') then
    begin
      MsgDlg('ERRO! '+
       #13+'IDENTIFICADOR NÃO PODE ESTAR EM BRANCO.',
       'Erro',mtError,[mbOk,mbHelp],0);
      Exit;
    end;
    *)
    (*
    If sTipoReg = '#@'then
    begin
      sSql:='SELECT TIPOREG'+
            ' FROM CPLAYOUT'+
            ' WHERE (IDLAYOUT = '+sIdLayout+') AND'+
            ' (TIPOREG<>''#@'')';
      With qryIns do
      begin
        Close;
        SqL.Clear;
        SqL.Add(sSqL);
        Open;
        If Not IsEmpty then
        begin
          Close;
          MsgDlg('ERRO! '+
           #13+'IDENTIFICADOR INVÁLIDO!',
            'Erro',mtError,[mbOk,mbHelp],0);
          Exit;
        end;
        Close;
      end;
    end
    else
    If sTipoReg <> '#@'then
    begin
      sSql:='SELECT TIPOREG'+
            ' FROM CPLAYOUT'+
            ' WHERE (IDLAYOUT = '+sIdLayout+') AND'+
            ' (TIPOREG=''#@'')';
      With qryIns do
      begin
        Close;
        SqL.Clear;
        SqL.Add(sSqL);
        Open;
        If Not IsEmpty then
        begin
          Close;
          MsgDlg('ERRO! '+
           #13+'DEVERÃO SER ALTERADOS OS INDENTIFICADORES DOS DETALHES JÁ GRAVADOS.',
            'Erro',mtError,[mbOk,mbHelp],0);
          bbtnCancelar.Click;
          Exit;
        end;
        Close;
      end;
    end;
     *)
    If ExisteErro then Exit;
  end; {sbtnApagar}

  If sbtnInserir.Down then
  begin
    sSql:='SELECT POSINICIAL'+
          ' FROM CPLAYOUT'+
          ' WHERE'+
          ' (((IDLAYOUT = '+sIdLayout+') AND';

    Case rdgTipoReg.ItemIndex Of
      1: sSql:=sSql+' (NOMECPO<>''HEADER'') AND (NOMECPO<>''TRAILER''))) AND'+
                    ' (((NOMECPO = '+Chr(39)+sNomeCpo+Chr(39)+') OR';


      0: sSql:=sSql+' (NOMECPO=''HEADER'') AND (TIPOREG = '+
                     Chr(39)+sTipoReg+Chr(39)+'))) AND ((';

      2: sSql:=sSql+' (NOMECPO=''TRAILER'') AND (TIPOREG = '+
                     Chr(39)+sTipoReg+Chr(39)+'))) AND ((';
    end; {Case}

    sSql:=sSql+
          ' (POSINICIAL = '+EdPosInicial.Text+') OR'+
          ' (POSFINAL = '+EdPosFinal.Text+')))';
    With qryIns do
    begin
      Close;
      SqL.Clear;
      SqL.Add(sSqL);
      Open;
      If Not IsEmpty then
      begin
        Close;
        MsgDlg('ERRO! '+
                #13+'VERIFIQUE NOME DO CAMPO,'+
                #13+'IDENTIFICADOR,'+
                #13+'POSIÇÃO INICIAL,'+
                #13+'POSIÇÃO FINAL,','Erro',mtError,[mbOk,mbHelp],0);
        Exit;
      end;
      Close;
    end;
  end;

  bbtnConfirmar.Enabled:=False;
  bbtnCancelar.Enabled:=False;

  If not dtmBaseDados.dbBaseDados.InTransaction then
             dtmBaseDados.dbBaseDados.StartTransaction;

  If sbtnInserir.Down then
  begin
    iIdCpLayout:= LeUltRegistro(nil,'CPLAYOUT');
    sSql:='INSERT INTO CPLAYOUT (IDCPLAYOUT,IDLAYOUT,'+
          ' DATA,NOMECPO,POSINICIAL,POSFINAL,FLGVALOR,'+
          ' IDMODULO,TIPOREG)'+
          ' VALUES ('+IntToStr(iIdCpLayout)+','+cmbIdLayout.LookupValue+','+
          ' TO_DATE('''+DateToStr(Date)+''',''DD/MM/YYYY''),'+Chr(39)+
            sNomeCpo+Chr(39)+','+EdPosInicial.Text+','+EdPosFinal.Text+','+
            Chr(39)+sFlgValor+Chr(39)+','+IntToStr(Sistema.IdModulo)+','+
            Chr(39)+sTipoReg+Chr(39)+')';
  end
  else
  If sbtnAlterar.Down then
  begin
    sSql:='UPDATE CPLAYOUT'+
          ' SET DATA = TO_DATE('''+DateToStr(Date)+''',''DD/MM/YYYY''),'+
          ' NOMECPO = '+Chr(39)+sNomeCpo+Chr(39)+','+
          ' POSINICIAL = '+EdPosInicial.Text+', POSFINAL = '+EdPosFinal.Text+','+
          ' FLGVALOR = '+Chr(39)+sFlgValor+Chr(39)+','+
          ' TIPOREG = '+Chr(39)+sTipoReg+Chr(39)+
          ' WHERE (IDCPLAYOUT = '+sIdCpLayout+') AND (IDLAYOUT = '+sIdLayout+')';
  end
  else
  If sbtnApagar.Down then
  begin
    sSql:='DELETE FROM CPLAYOUT'+
          ' WHERE (IDCPLAYOUT = '+sIdCpLayout+') AND (IDLAYOUT = '+sIdLayout+')';
  end;

  If sSql<>'' then
  With qryIns do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sSqL);
    try
      ExecSQL;
    except
      dtmBaseDados.dbBaseDados.Rollback;
      MsgDlg('Ocorreu um erro durante a transação. Operação será cancelada.',
              'Erro',mtError,[mbOk,mbHelp],0);
      Abort;
    end;
    dtmBaseDados.dbBaseDados.Commit;
    rdgTipoReg.ItemIndex:=1;
    VerificaRdg;
  end; {With}
  qry.Close;
  qry.ParamByName('PIDLAYOUT').Value:=qryTpLayout.FieldByName('IDLAYOUT').AsString;
  qry.Open;
  qry.Last;
  EditaCampos;
end;

procedure TFrmCpLayout.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
    qry.Locate('IDCPLAYOUT',MontaSelect.ValoresChave[0],[loPartialKey]) ;
end;

procedure TFrmCpLayout.sbtnInserirClick(Sender: TObject);
begin
  If CmbIdLayout.Text='' then Exit;
  inherited;
  EdPosInicial.Text:='';
  EdPosFinal.Text:='';
  cbFlgValor.ItemIndex:=-1;
  sIdCpLayout:='';
  sIdLayout:=qryTpLayout.FieldByName('IdLayout').AsString;
  dbGrd.BringToFront;
  dbGrd.Visible:=True;
  VerificaRdg;
  edNomeCpo.SetFocus;
end;

procedure TFrmCpLayout.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  EditaCampos;
  dbGrd.Visible:=True;
end;

procedure TFrmCpLayout.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  (*
  If MontaSelect.RetornouValor then
  begin
    sIdLayout:=cmbIdLayout.LookupValue;
    qry.Close;
    qry.Sql.Clear;
    qry.Sql.Add('SELECT * FROM CPLAYOUT'+
                ' WHERE IDLAYOUT = '+MontaSelect.ValoresChave[0]+
                ' ORDER BY IDCPLAYOUT,IDLAYOUT');
    qry.Open;
    EditaCampos;
  end;
  *)
end;

procedure TFrmCpLayout.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  bbtnConfirmar.Enabled:=False;
  bbtnCancelar.Enabled:=False;
end;

procedure TFrmCpLayout.sbtnApagarClick(Sender: TObject);
begin
  EditaCampos;
  dbGrd.Visible:=True;
  With qryIns do
  begin
    Close;
    SqL.Clear;
    SqL.Add('SELECT IDLAYOUT'+
            ' FROM LGLAYOUT'+
            ' WHERE IDCPLAYOUT = '+sIdCpLayout);
    Open;
    If Not IsEmpty then
    begin
      Close;
      MsgDlg('ERRO! '+
       #13+'ASSOCIAÇÃO EXISTENTE, REGISTRO NÃO PODE SER APAGADO!',
        'Erro',mtError,[mbOk,mbHelp],0);
      Exit;
    end;
  end; {With}

  If  MsgDlg('Deseja Realmente Excluir?','Confirmação',
              mtError,[mbOk,mbCancel,mbHelp],0) = mrOk then
  begin
    sbtnApagar.Down:=True;
    bbtnConfirmar.Enabled:=True;
    bbtnConfirmar.Click;
  end;
end;

procedure TFrmCpLayout.dbGrdDblClick(Sender: TObject);
begin
  inherited;
  If (sbtnInserir.Down)Or(sbtnAlterar.Down)Or
      (sbtnApagar.Down) then Exit;
  EditaCampos;
end;

procedure TFrmCpLayout.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qry.Close;
  qryTpLayout.Close;
  qryIns.Close;
end;

procedure TFrmCpLayout.FormCreate(Sender: TObject);
begin
  inherited;
  qry.Open;
  qryTpLayout.Open;
  sbtnProcurar.Visible:=False;
end;

procedure TFrmCpLayout.rdgTipoRegClick(Sender: TObject);
begin
  inherited;
  VerificaRdg;
end;

procedure TFrmCpLayout.CmbIdLayoutChange(Sender: TObject);
begin
  inherited;
  qry.Close;
  qry.ParamByName('PIDLAYOUT').Value:=qryTpLayout.FieldByName('IDLAYOUT').AsString;
  qry.Open;
  EditaCampos;
end;

procedure TFrmCpLayout.edNomeCpoChange(Sender: TObject);
begin
  inherited;
  If Length(edNomeCpo.Text)>20 then
  begin
    MsgDlg('O tamanho máximo da descrição do campo e de 20 caracteres.',
            'Atenção',mtWarning,[mbOk,mbHelp],0);
    edNomeCpo.Text:=Copy(edNomeCpo.Text,1,20);
  end;          
end;

procedure TFrmCpLayout.btnInfClick(Sender: TObject);
Var A: Integer;
begin
  inherited;
  pnlInf.Visible:=True;
  dbGrd.Visible:=False;
  (* Insere Descricao da origem ou destino *)
  cbArquivo.Items.Clear;
  (* 0 = TABELA CAPSEGASS *)
  (* 1 = INFORMAÇÕES DIVERSAS *)
  (* 2 = INFORMAÇÕES PARA ENVIO DE COBRANÇA - FOLHA PATROCINADORA *)
  For A:= 0 to NTabelas do cbArquivo.Items.Add(TabDescOrigem[A]);
end;

procedure TFrmCpLayout.spbtnFecharClick(Sender: TObject);
begin
  inherited;
  listBoxInf.Items.Clear;
  dbGrd.Visible:=True;
  pnlInf.Visible:=False;
end;

procedure TFrmCpLayout.cbArquivoChange(Sender: TObject);
Var A: Integer;
begin
  inherited;
  (* Insere o nomes fantasia no ListBox *)
  listBoxInf.Items.Clear;
  (* 0 = TABELA CAPSEGASS *)
  Case cbArquivo.ItemIndex Of
    0: For A:=0 to NCp0 do listBoxInf.Items.Add(TabCamposFan0[A]);
    1: begin
         If rdgTipoReg.ItemIndex In [0,2] then
            For A:=0 to NCp2 do listBoxInf.Items.Add(TabCamposFan2[A])
         else For A:=0 to NCp1 do listBoxInf.Items.Add(TabCamposFan1[A]);
       end;
    //2: For A:=0 to NCp3 do listBoxInf.Items.Add(TabCamposFan3[A]);
  end; {Case}
end;

end.
