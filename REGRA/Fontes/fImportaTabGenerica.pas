unit fImportaTabGenerica;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, wwdblook, Wwdbdlg, DBCtrls, Mask, wwdbedit, Db, uMensErro,
  DBTables, Wwdatsrc, Wwquery, IvDictio, IvMulti, IvEMulti, MAHlpBtn, excels,
  Buttons, TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, uSistema, uCmFileUtils;

type
  TfrmImportaTabGenerica = class(TfrmOkCancelar)
    QryTabela: TwwQuery;
    dsTabela: TwwDataSource;
    updTabela: TUpdateSQL;
    QryValor: TwwQuery;
    QryValorCODTABELA: TStringField;
    QryValorNUMLINHA: TFloatField;
    QryValorCODCAMPO: TStringField;
    QryValorVALOR: TStringField;
    dsValor: TwwDataSource;
    updValor: TUpdateSQL;
    QryCampos: TwwQuery;
    dsCampos: TwwDataSource;
    updCampos: TUpdateSQL;
    QryTipoDado: TwwQuery;
    QryTipoDadoIDTIPODADO: TFloatField;
    QryTipoDadoNOMETIPODADO: TStringField;
    dlg1: TOpenDialog;
    tbcDetalhe: TTabControlDetalhe;
    pgctrlDetalhe: TPageControl;
    tbsDet: TTabSheet;
    pnlControlesDet: TPanel;
    dbgrdDet: TwwDBGrid;
    Dock973: TDock97;
    tb97BotoesDetalhe: TToolbar97;
    sbtnInsDet: TSpeedButton;
    sbtnAltDet: TSpeedButton;
    sbtnExcluiDet: TSpeedButton;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    dedCodCampoCampos: TDBEdit;
    Label4: TLabel;
    dedDescricaoCampos: TDBEdit;
    Label3: TLabel;
    Panel1: TPanel;
    GrpLinha: TGroupBox;
    Label1: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label5: TLabel;
    dedCodTabela: TwwDBEdit;
    Label6: TLabel;
    dedDescricao: TwwDBEdit;
    BtImportaLinhas: TSpeedButton;
    QryAux: TwwQuery;
    QryCamposCODTABELA: TStringField;
    QryCamposCODCAMPO: TStringField;
    QryCamposDESCRICAO: TStringField;
    QryCamposIDTIPODADO: TFloatField;
    QryCamposDESCRICAO_1: TStringField;
    wwDBLookupCombo1: TwwDBLookupCombo;
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dedDescricaoExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    function  formata(texto:string):string;
    procedure BitBtn1Click(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    Procedure HabGrid;
    Procedure DesabGrid;
    procedure FormShow(Sender: TObject);
    procedure dedCodTabelaExit(Sender: TObject);
    procedure BtImportaLinhasClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImportaTabGenerica: TfrmImportaTabGenerica;
  excel   : texcel;
  area    : trect;
  cont    : integer;
  texto   : String;
  linhas  : tstrings;
  conteudo,conteudo2 : TStringList;

implementation


uses
    dBaseDados, fAguarde, uBiblioteca, fPrincipal;
    
{$R *.DFM}

procedure TfrmImportaTabGenerica.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  QryCampos.Cancel;
  HabGrid;
end;

procedure TfrmImportaTabGenerica.FormCreate(Sender: TObject);
begin
  inherited;
  if not DtmBasedados.dbbasedados.InTransaction then
     DtmBasedados.dbbasedados.StartTransaction;
     
  QryTabela.Open;
  QryTabela.Append;

  QryTipoDado.Open;

  QryCampos.Open;
  QryValor.Open;
  HabGrid;
end;

procedure TfrmImportaTabGenerica.dedDescricaoExit(Sender: TObject);
begin
  inherited;
(*
  if (dedCodTabela.Text <> '') and (dedDescricao.Text <> '') then begin
     QryCampos.Append;

     QryCampos.Close;
     QryCampos.Params[0].AsString := QryTabela.Fieldbyname('CODTABELA').AsString;
     QryCampos.Open;
  end;
*)  
end;

procedure TfrmImportaTabGenerica.bbtnConfirmarClick(Sender: TObject);
var
  a : String[1];
  x, NumLinhas, Ini, Grava : LongInt;
begin
  inherited;

  {--------------------------}
  { Importa Tabela Generica  }
  if UpperCase(bbtnConfirmar.Caption) = '&OK' then begin
     if (QryTabela.FieldbyName('CODTABELA').AsString = '') or
        (QryTabela.FieldbyName('DESCRICAO').AsString = '') or
        (Edit1.Text = '') or (Edit2.Text = '') or (Edit3.Text = '') or (Edit4.Text = '') then begin
        MsgDlg('Existem Campos em Branco.','Atenção',mterror,[mbOk,mbHelp],0);
        Exit;
     end;
     bbtnConfirmar.Caption := '&Novo';
     Dlg1.Execute;

     if Dlg1.FileName <> '' then begin
        QryCampos.DisableControls;
        Refresh;
        frmAguarde.Mostra('Abrindo Planilha ...');
        frmAguarde.Refresh;
        Excel := TExcel.Create(Self);
        Excel.Connect;

        Try
          Area.Top    := StrtoInt(Edit1.Text);
          Area.Bottom := StrtoInt(Edit2.Text);
          Area.Left   := StrtoInt(Edit3.Text);
          Area.Right  := StrtoInt(Edit4.Text);
          Excel.Exec('[OPEN("'+Dlg1.FileName+'")]');
          Screen.Cursor := crHourGlass;
          Conteudo := TStringList.Create;
          Excel.GetRange(Area, Conteudo);
        Except
          MsgDlg('Problemas na abertura da Planilha '+Dlg1.FileName+', '+
                 'verifique os dados informados.       '+#13+
                 'Obs.: Planilha deve ter o nome simples sem espaços.',
                 'Atenção',mterror,[mbOk,mbHelp],0);
          frmAguarde.Apaga;
          Screen.Cursor := crDefault;
          { Libera Conexao com Excel }
          Excel.Exec('[CLOSE]');
          Excel.Exec('[QUIT]');
          Excel.Free;
          Exit;
        End;

        frmAguarde.Mostra('Criando Tabela ...');
        frmAguarde.Refresh;
        Try
           Conteudo2 := TStringList.Create;
           NumLinhas := Conteudo.Count;

           frmAguarde.Pos := 0;
           frmAguarde.Min := 0;
           frmAguarde.Max := NumLinhas * (QryCampos.RecordCount + 1);

           for x := 0 to  NumLinhas - 1 do
               Conteudo2.Add('');
           x := 0;
           Cont := 1;
           Texto := '';
           while x <= NumLinhas - 1 do begin
                 a := Copy(Conteudo.Strings[x],Cont,1);
                 if a = #9 then begin
                    Conteudo2.Strings[x] := Conteudo2.Strings[x] + Formata(Texto);
                    Texto:='';
                 end else
                     if Cont > Length(Conteudo.Strings[x]) then begin
                        Conteudo2.Strings[x] := Conteudo2.Strings[x] + Formata(Texto);
                        Texto := '';
                        x := x + 1;
                        Cont := 0
                     end else
                         Texto := Texto + a;

                 Cont := Cont + 1;
                 frmAguarde.Pos := frmAguarde.Pos + 1;
           end;

           Try
             QryTabela.ApplyUpdates;
             QryCampos.ApplyUpdates;
           Except
             Raise;
             { Libera Conexao com Excel }
             frmAguarde.Apaga;
             Excel.Exec('[CLOSE]');
             Excel.Exec('[QUIT]');
             Excel.Free;
             Exit;
           End;
           frmAguarde.Mostra('Gerando '+IntToStr(NumLinhas*QryCampos.RecordCount)+
                             ' linhas........');
           frmAguarde.Refresh;
           frmAguarde.Pos := 0;
           frmAguarde.Min := 0;
           frmAguarde.Max := NumLinhas;
           x := 0;
           Grava := 0;
           while x <= NumLinhas - 1 do begin
                 QryCampos.First;
                 ini := 1;
                 While not QryCampos.Eof do begin
                   Qryvalor.Insert;
                   Qryvalor.FieldByName('CODTABELA').AsString := QryTabela.Fieldbyname('CODTABELA').asstring;
                   Qryvalor.FieldByName('CODCAMPO').AsString  := QryCampos.Fieldbyname('CODCAMPO').asstring;
                   Qryvalor.FieldByName('NUMLINHA').asinteger := X + 1;
                   Qryvalor.FieldByName('VALOR').asstring     := Trim(copy(conteudo2.Strings[x],ini,60));
                   Qryvalor.Post;
                   QryCampos.Next;
                   ini := ini + 60;
                 end;
                 x := x + 1;
                 Grava := x;
                 if Grava = 1000 then begin
                    Grava := 0;
                    QryValor.ApplyUpdates;
                    QryValor.CommitUpdates;
                 end;
                 frmAguarde.Pos := frmAguarde.Pos + 1;
           end;
        except
          conteudo.free;
          MsgDlg('Falha na importação dos dados.','Atenção',mterror,[mbOk,mbHelp],0);
          Raise;
          Exit;
        end;
        conteudo.free;
     end;
     cont:=0;
     texto:='';
     QryCampos.EnableControls;
     
     { Grava Log da operação - 19/12/2002 }
     If Not Sistema.GravaLogOperacoes('Importação de Tabelas Longas') Then
        Raise Exception.Create('Não Consegui Gravar o Log');

     frmAguarde.Mostra('Finalizando Gravação ...');
     frmAguarde.Refresh;
     QryValor.ApplyUpdates;
     DtmBasedados.dbbasedados.Commit;

     Excel.Exec('[CLOSE]');
     Excel.Exec('[QUIT]');
     Excel.Free;
     frmAguarde.Apaga;

  end else if UpperCase(bbtnConfirmar.Caption) = '&NOVO' then begin
  {---------------------------------------}
  { Prepara Ambiente para Nova Importação }
      if not DtmBasedados.dbbasedados.InTransaction then
         DtmBasedados.dbbasedados.StartTransaction;

      QryTabela.Close;
      QryTabela.Open;
      QryTabela.Append;

      QryTipoDado.Close;
      QryTipoDado.Open;

      QryValor.Close;
      QryValor.Open;

      dedCodTabela.SetFocus;
      Edit1.Text := '';
      Edit2.Text := '';
      Edit3.Text := '';
      Edit4.Text := '';

      QryCampos.Close;
      QryCampos.Params[0].AsString := QryTabela.Fieldbyname('codtabela').AsString;
      QryCampos.Open;

      bbtnConfirmar.Caption := '&OK';
  end;
end;

procedure TfrmImportaTabGenerica.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if DtmBasedados.dbbasedados.InTransaction then begin
     DtmBasedados.dbbasedados.Rollback;
  end;
end;

function TfrmImportaTabGenerica.Formata(texto:string):string;
const
  br = ' ';
var
   i, letras : Integer;
begin
    letras := 60 - Length(Texto);
    result := Texto;
    for i := 1 to Letras do
       Result := Result + br;
end;


procedure TfrmImportaTabGenerica.BitBtn1Click(Sender: TObject);
Var
  Indic : TDataSetState;
  IdTipo : Integer;
begin
  inherited;
  Indic := QryCampos.State;
  QryCampos.FieldbyName('CODTABELA').AsString := QryTabela.Fieldbyname('CODTABELA').AsString;
  QryCampos.Post;
  IdTipo := QryCampos.FieldbyName('IDTIPODADO').AsInteger;
  If Indic = DsEdit Then
    HabGrid
  Else Begin
    sbtnInsDet.Click;
    QryCampos.FieldbyName('IDTIPODADO').AsInteger := IdTipo;
    dedCodCampoCampos.SetFocus;
  End;
end;

procedure TfrmImportaTabGenerica.sbtnExcluiDetClick(Sender: TObject);
begin
  inherited;
  QryCampos.Delete;
  sbtnExcluiDet.Down := False;
end;

procedure TfrmImportaTabGenerica.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  DesabGrid;
  QryCampos.Insert;
  QryCampos.FieldbyName('CODTABELA').AsString := QryTabela.Fieldbyname('CODTABELA').AsString;
  sbtnInsDet.Down := False;
end;

procedure TfrmImportaTabGenerica.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
  DesabGrid;
  QryCampos.Edit;
  sbtnAltDet.Down := False;
end;

Procedure TfrmImportaTabGenerica.HabGrid;
begin
     dbgrdDet.BringtoFront;
     Dock972.Visible := False;
end;

Procedure TfrmImportaTabGenerica.DesabGrid;
begin
     dbgrdDet.SendtoBack;
     Dock972.Visible := True;
end;

procedure TfrmImportaTabGenerica.FormShow(Sender: TObject);
begin
  inherited;
  dedCodTabela.SetFocus;
end;

procedure TfrmImportaTabGenerica.dedCodTabelaExit(Sender: TObject);
begin
  inherited;
  if (dedCodTabela.Text <> '') then begin
    QryCampos.Close;
    QryCampos.Params[0].AsString := QryTabela.Fieldbyname('CODTABELA').AsString;
    QryCampos.Open;

    { Caso tabela possua campos (existe) mostra botao de Importar Linhas }
    If Not QryCampos.IsEmpty Then Begin
      BtImportaLinhas.Enabled := True;
      QryTabela.Fieldbyname('DESCRICAO').AsString :=
        QryCampos.Fieldbyname('DESCRICAO').AsString;
      Edit4.Text := IntToStr(QryCampos.RecordCount);
      Edit2.SetFocus;
    End Else Begin
      BtImportaLinhas.Enabled := False;
    End;

  End Else Begin
     BtImportaLinhas.Enabled := False;
  End;

end;

{******************************************************************************}
{ Importa somente as linhas de uma tabela genérica                             }
procedure TfrmImportaTabGenerica.BtImportaLinhasClick(Sender: TObject);
Var
  A : String[1];
  X, ProxLinha,  NumLinhas, Ini, Grava : LongInt;
begin

  inherited;
  {------------------}
  { Testa Parametros }

  { Valores da Tela }
  If (QryTabela.FieldbyName('CODTABELA').AsString = '') Then Begin
    MsgDlg('Existem Campos em Branco.','Atenção',mterror,[mbOk,mbHelp],0);
    Exit;
  End;

  { Area da planilha a importar }
  If (Edit1.Text = '') or (Edit2.Text = '') or
     (Edit3.Text = '') or (Edit4.Text = '') Then Begin
    MsgDlg('Prencha a Area da planilha a importar.',
            'Atenção',mterror,[mbOk,mbHelp],0);
    Edit1.SetFocus;
    Exit;
  End;

  { Consistencia da area a importar }
  If (StrToInt(Edit4.Text) > QryCampos.RecordCount) Then Begin
    MsgDlg('Coluna Final superior a existente na Tabela',
            'Atenção',mterror,[mbOk,mbHelp],0);
    Edit3.SetFocus;
    Exit;
  End;

  {------------------}

  { Pesquisa o Arquivo a Importar }
  Dlg1.Execute;

  { Caso não tenha encontrado sai fora }
  If Dlg1.FileName = '' then begin
    Exit;
  End Else Begin
    { Caso tenha encontrado importa }

    { Desabilita Controles Visuais }
    QryCampos.DisableControls;

    { Mostra Tela de Progresso }
    Refresh;
    frmAguarde.Mostra('Abrindo Excel...');
    frmAguarde.Refresh;

    { Cria e Inicia Componete de Contato com o Excel }
    Excel := TExcel.Create(Self);
    Excel.Connect;

    { Tenta Abrir o Arquivo Encontrado e Pegar o espaco a ser importado }
    Try
      Area.Top    := StrtoInt(Edit1.Text);
      Area.Bottom := StrtoInt(Edit2.Text);
      Area.Left   := StrtoInt(Edit3.Text);
      Area.Right  := StrtoInt(Edit4.Text);
      Excel.Exec('[OPEN("'+Dlg1.FileName+'")]');
      Screen.Cursor := crHourGlass;
      Conteudo := TStringList.Create;
      Excel.GetRange(Area, Conteudo);

    Except
      MsgDlg('Problemas na abertura da Planilha '+Dlg1.FileName+', '+
             'verifique os dados informados.       '+#13+
             'Obs.: Planilha deve ter o nome simples sem espaços.',
             'Atenção',mterror,[mbOk,mbHelp],0);
      frmAguarde.Apaga;
      Screen.Cursor := crDefault;
      { Libera Conexao com Excel }
      Excel.Exec('[CLOSE]');
      Excel.Exec('[QUIT]');
      Excel.Free;
      Exit;
    End;

    { Atualiaza tela de Progresso }
    frmAguarde.Mostra('Importando Dados ...');
    frmAguarde.Refresh;

    { Tenta Importar Linhas }
    Try
      { Cria Componete de auxilio na importacao }
      Conteudo2 := TStringList.Create;

      NumLinhas := Conteudo.Count;

      { Atualiaza tela de Progresso }
      frmAguarde.Pos := 0;
      frmAguarde.Min := 0;
      frmAguarde.Max := NumLinhas * (QryCampos.RecordCount + 1);

      { Inicia Linhas Vazias }
      For X := 0 To  NumLinhas - 1 Do
        Conteudo2.Add('');

      { Inicia Variaveis }
      X    := 0;
      Cont := 1;
      Texto:= '';

      { Loop ate acabarem as linhas a importar }
      While X <= NumLinhas - 1 Do Begin

        { Pega Conteudo a Importar }
        A := Copy(Conteudo.Strings[x],Cont,1);

        { Testa conteudo de A}
        If a = #9 then begin
          Conteudo2.Strings[x] := Conteudo2.Strings[x] + Formata(Texto);
          Texto:='';
        End else

          {  }
          If Cont > Length(Conteudo.Strings[x]) Then Begin
            Conteudo2.Strings[x] := Conteudo2.Strings[x] + Formata(Texto);
            Texto := '';
            X := X + 1;
            Cont := 0
          End Else
            Texto := Texto + A;

          Cont := Cont + 1;

          frmAguarde.Pos := frmAguarde.Pos + 1;

      End; { While X <= NumLinhas - 1 }
      {Busca proxima linha  Incluir na Tabela }

      FazQuery(QryAux,
               'SELECT NVL( MAX(NUMLINHA), 0 ) AS ULTLINHA FROM VALTABGENER WHERE CODTABELA = '+
               QuotedStr(dedCodTabela.Text));

      X     := 0;
      Grava := 0;

      ProxLinha := QryAux.FieldByName('ULTLINHA').AsInteger;

      { Inicia Transacao }
      If Not DtmBasedados.dbbasedados.InTransaction Then
        DtmBasedados.dbbasedados.StartTransaction;

      //DAVID - 19/05/2003
      //Desabilita form principal e exibe janela de "Aguarde"
      frmPrincipal.Enabled := False;
      frmAguarde.Show;

      { Varre todas as linhas a importar }
      While X <= NumLinhas - 1 Do Begin
        QryCampos.First;
        Ini := 1;

        //DAVID - 19/05/2003
        //Solução do problema na importação de tabelas vazias
        ProxLinha := ProxLinha + 1;

        { Processa todos os campos da Tabela }
        While not QryCampos.Eof Do Begin

          { Insere Valor correspondente ao Campo }
          QryValor.Insert;
          QryValor.FieldByName('CODTABELA').AsString := QryTabela.Fieldbyname('CODTABELA').asstring;
          QryValor.FieldByName('CODCAMPO').AsString  := QryCampos.Fieldbyname('CODCAMPO').asstring;

          //DAVID - 19/05/2003
          //Solução do problema na importação de tabelas vazias
          //QryValor.FieldByName('NUMLINHA').asinteger := ProxLinha + 1;
          QryValor.FieldByName('NUMLINHA').asinteger := ProxLinha;

          QryValor.FieldByName('VALOR').asstring     := Trim(copy(conteudo2.Strings[x],ini,60));
          QryValor.Post;

          { Proximo campo a Inserir }
          QryCampos.Next;
          Ini := Ini + 60;

        End; { While QryCampos.Eof }

        X := X + 1;

        //DAVID - 19/05/2003
        //Solução do problema na importação de tabelas vazias
        //ProxLinha := ProxLinha + 1;

        Grava := X;
        if Grava = 1000 then begin
          Grava := 0;
          QryValor.ApplyUpdates;
        end;
          frmAguarde.Pos := frmAguarde.Pos + 1;

      End; { While x <= NumLinhas - 1 }

    Except
      { Libera componente de Auxilio }
      Conteudo.free;
      { Retira tela de progresso }
      frmAguarde.Apaga;
      { Reabilita Controles Visuais }
      QryCampos.EnableControls;

      QryValor.CancelUpdates;

      Excel.Exec('[CLOSE]');
      Excel.Free;
      MsgDlg('Falha na importação dos dados.','Atenção',mterror,[mbOk,mbHelp],0);

      //DAVID - 19/05/2003
      //Habilita form principal
      frmPrincipal.Enabled := True;

      Raise;
      Exit;
    End;

    { Libera componente de Auxilio }
    Conteudo.free;
  End;

  {}
  cont :=0;
  texto:='';

  { Reabilita Controles Visuais }
  QryCampos.EnableControls;

  { Atualiaza tela de Progresso }
  frmAguarde.Mostra('Finalizando Gravação...');
  frmAguarde.Refresh;

  { Confirma alteracoes no Banco de Dados }
  QryValor.ApplyUpdates;
  DtmBasedados.dbbasedados.Commit;

  //DAVID - 19/05/2003
  //Habilita form principal
  frmPrincipal.Enabled := True;

  { Libera Conexao com Excel }
  Excel.Exec('[CLOSE]');
  Excel.Exec('[QUIT]');
  Excel.Free;

  { Retira tela de progresso }
  frmAguarde.Apaga;

  { Fecha Tabelas }
  QryTabela.Close;
  QryCampos. Close;
  QryValor.Close;
  { Acerta Botoes }
  BtImportaLinhas.Enabled := False;
  { Monsagem }

  MsgDlg('Processo de importação terminado.','Mensagem',mtInformation,[mbOk],0);
end;

end.
