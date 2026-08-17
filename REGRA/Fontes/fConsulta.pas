unit fConsulta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, DBTables, Wwquery, ComCtrls, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  Wwdatsrc, DBCtrls, FileCtrl, ImgList;

type
  TfrmConsulta = class(TfrmOkCancelar)
    QryCampo: TwwQuery;
    QryVariavel: TwwQuery;
    tbctrlopcoes: TTabControl;
    Panel1: TPanel;
    ntb: TNotebook;
    QryFormula: TwwQuery;
    dsFormula: TwwDataSource;
    dsVariavel: TwwDataSource;
    dsCampo: TwwDataSource;
    trvCampos: TTreeView;
    dblkpVariaveis: TDBLookupListBox;
    trvFormula: TTreeView;
    QryAux: TwwQuery;
    btnAtualizar: TButton;
    ImgLstCampos: TImageList;
    QryRegraAux: TwwQuery;
    trvRegra: TTreeView;
    procedure PreencherTree(var tTree : TTreeView;qry : TwwQuery;sChave,sDesc,sDescGrp : string; Aguarde : Boolean);
    procedure PreencheUmNivel(var tTree : TTreeView;qry : TwwQuery;sChave,sDesc,sDescGrp : string; Aguarde : Boolean);
    procedure tbctrlopcoesChange(Sender: TObject);
    procedure trvCamposDblClick(Sender: TObject);
    procedure trvFormulaDblClick(Sender: TObject);
    procedure PreencheNoRegra;
    procedure PreencheNoFormula;
    procedure PreencheNo;
    procedure trvFormulaExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure dblkpVariaveisDblClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure trvRegraDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FlgMostraCampo:String; // D - Descricao, C - Nome do Campo
    CampoMostra  :String;
  end;
  Tno=^string;

var
  frmConsulta: TfrmConsulta;
  xDescricao, xId, xTipo : String;
  xTipoTela : LongInt;

implementation

uses fAguarde, fCadRegra, uBiblioteca;

{$R *.DFM}

procedure TfrmConsulta.PreencherTree(var tTree : TTreeView;qry : TwwQuery;
                                     sChave,sDesc,sDescGrp : string; Aguarde : Boolean);
var
   sCodAnterior, sDescInsert : string;
   iUltIndNivel1, iUltInsert : integer;
   no:Tno;
begin
  tTree.Items.Clear;
  sCodAnterior  := '';
  iUltIndNivel1 := -1;
  iUltInsert    := -1;
  if not Qry.Active then
     Qry.Open;

  Qry.First;

  if Aguarde then begin
     frmAguarde.Pos := 0;
     frmAguarde.Max := Qry.RecordCount;
     frmAguarde.Min := 0;
  end;

  while not qry.Eof do begin
        if Aguarde then
           frmAguarde.Pos := frmAguarde.Pos + 1;

        new(no);
        no^:=qry.FieldByName(sChave).AsString;

        if sCodAnterior <> qry.FieldByName(sChave).AsString then begin
           sCodAnterior := qry.FieldByName(sChave).AsString;

           if Trim(qry.FieldByName(sDescGrp).AsString) = '' then
              sDescInsert := 'Grupo Indeterminado'
           else
              sDescInsert := qry.FieldByName(sDescGrp).AsString;

           if iUltIndNivel1 = -1 then begin
              tTree.Items.Addobject(nil,sDescInsert,no);
              inc(iUltIndNivel1);
              inc(iUltInsert);
              tTree.Items[iUltIndNivel1].ImageIndex := 0;
           end else begin
               tTree.Items.AddObject(ttree.items[0],sDescInsert,no);
               inc(iUltInsert);
               iUltIndNivel1 := iUltInsert;
               tTree.Items[iUltIndNivel1].ImageIndex := 0;
               tTree.Items[iUltInsert].selectedIndex := 3;
           end;
        end;
        qry.Next;
  end;

  if Aguarde then begin
     frmAguarde.Min := -1;
     frmAguarde.Apaga;
  end;

end;



procedure TfrmConsulta.tbctrlopcoesChange(Sender: TObject);
begin
  inherited;
  if tbctrlopcoes.Tabs[tbctrlopcoes.tabindex]='Regras' then
     ntb.pageindex:=0;
  if tbctrlopcoes.Tabs[tbctrlopcoes.tabindex]='Campos' then
     ntb.pageindex:=1;
  if tbctrlopcoes.Tabs[tbctrlopcoes.tabindex]='Variáveis' then
     ntb.pageindex:=2;
  if tbctrlopcoes.Tabs[tbctrlopcoes.tabindex]='Formulas' then
     ntb.pageindex:=3;
end;

procedure TfrmConsulta.trvCamposDblClick(Sender: TObject);
begin
  inherited;
  trvCampos.Selected.Selected:=true;

  if trvCampos.Items.Count <> 0 then begin

     if trvCampos.Selected.Level = 0 Then begin

        if not(trvCampos.Selected.haschildren) then begin
           frmAguarde.Mostra('Selecionando Dados ...');
           frmAguarde.Refresh;
           PreencheNo;
           frmAguarde.Apaga;
        end;

        if trvCampos.Selected.Level = 1 then begin
           if not QryCampo.Active then
              QryCampo.Open;
           if QryCampo.Locate(CampoMostra,trvCampos.Selected.Text,[loCaseInsensitive])then begin
              xDescricao := QryCampo.FieldByName('DescricaoDoCampo').AsString;
              xId := QryCampo.FieldByName('IdCampo').AsString;
              xTipo := 'C';
              Close;
           end else begin
              xDescricao := '';
              xId := '';
              xTipo := '';
              Close;
           end;

        end;
     end else begin

         if not QryCampo.Active then
            QryCampo.Open;

         if QryCampo.Locate('DESCGRUPOARQUIVO;'+CampoMostra,
                            VarArrayOf([trvCampos.Selected.Parent.Text,trvCampos.Selected.Text]),
                            [loCaseInsensitive])then begin
            xDescricao := QryCampo.FieldByName('DescricaoDoCampo').AsString;
            xId := QryCampo.FieldByName('IdCampo').AsString;
            xTipo := 'C';
            Close;

         end else begin
            xDescricao := '';
            xId := '';
            xTipo := '';
            Close;
         end;

     end;

  end;

end;


procedure TfrmConsulta.PreencheNo;
begin
  if trvCampos.Items.Count <> 0 then begin

    if trvcampos.selected.level = 0 then begin

      if not(trvcampos.selected.HasChildren) then begin

        QryAux.close;
        QryAux.sql.clear;
        QryAux.sql.add( 'SELECT G.CODGRUPOARQUIVO,C.IDCAMPO,C.NOMEDOCAMPO,C.APELIDO,C.DESCRICAODOCAMPO, G.DESCGRUPOARQUIVO '+
                        ' FROM CMPBD C, GRPARQUIVO G, CMPBDGRP CG WHERE C.CAMPODOBANCO >= 1 AND G.CODGRUPOARQUIVO='''+
                        tno(trvcampos.Selected.data)^+''' AND '+
                        ' C.IDCAMPO = CG.IDCAMPO(+) AND CG.CODGRUPOARQUIVO = G.CODGRUPOARQUIVO '+
                        ' ORDER BY CG.CODGRUPOARQUIVO,C.DESCRICAODOCAMPO');

        QryAux.open;

        Preencheumnivel(trvCampos,QryAux,
                        'CODGRUPOARQUIVO',CampoMostra,'DESCGRUPOARQUIVO', True);
      end;
    end else begin
      if not QryCampo.Active then
        QryCampo.Open;
      if QryCampo.Locate('DESCRICAODOCAMPO',trvCampos.Selected.Text,[loCaseInsensitive])then begin
        xDescricao := QryCampo.FieldByName('DescricaoDoCampo').AsString;
        xId := QryCampo.FieldByName('IdCampo').AsString;
        xTipo := 'C';
      end else begin
        xDescricao := '';
        xId := '';
        xTipo := '';
      end;
      Close;
    end;

  end;

end;

procedure TfrmConsulta.PreencheUmNivel(var tTree : TTreeView;
                                       qry : TwwQuery;sChave,sDesc,sDescGrp : string;
                                        Aguarde : Boolean);
var
    no:Tno;
    i:integer;
begin
  if not Qry.Active then
     Qry.Open;
  if Aguarde then begin
     frmAguarde.Pos := 0;
     frmAguarde.Max := Qry.RecordCount;
     frmAguarde.Min := 0;
  end;

  tTree.Selected.DeleteChildren;
  qry.First;
  i:=ttree.selected.AbsoluteIndex;
  while not qry.Eof do begin
        if Aguarde then
           frmAguarde.Pos := frmAguarde.Pos + 1;
        new(no);
        no^:=qry.FieldByName(sChave).AsString;
        tTree.Items.AddChildobject(tTree.selected,qry.FieldByName(sDesc).AsString,no);
        inc(i);
        tTree.Items[i].ImageIndex := 1;
        tTree.Items[i].selectedIndex := 2;
        qry.Next;
  end;
  ttree.selected.Expand(true);
  if Aguarde then begin
     frmAguarde.Min := -1;
     frmAguarde.Apaga;
  end;
end;



procedure TfrmConsulta.trvFormulaDblClick(Sender: TObject);
begin
  if trvFormula.Selected.Level = 1 then begin
     if not QryFormula.Active then
        QryFormula.Open;
     if qryFormula.Locate('DescricaoFormula',trvFormula.Selected.Text,[loCaseInsensitive]) then begin
        xDescricao := qryFormula.FieldByName('DescricaoFormula').AsString;
        xId := qryFormula.FieldByName('IdFormula').AsString;
        xTipo := 'F';
        Close;
     end else begin
        xDescricao := '';
        xId := '';
        xTipo := '';
        Close;
     end;
  end else begin
      if not(trvFormula.Selected.haschildren) then begin
         frmAguarde.Mostra('Selecionando Dados ...');
         frmAguarde.Refresh;
         PreencheNoFormula;
         frmAguarde.Apaga;
      end else
          trvFormula.Selected.DeleteChildren;
  end;

end;

procedure TfrmConsulta.trvFormulaExpanding(Sender: TObject;
  Node: TTreeNode; var AllowExpansion: Boolean);
begin
  inherited;
  Node.Selected := True;
end;

procedure TfrmConsulta.PreencheNoFormula;
var
  Sql : String;
begin
     if trvFormula.selected.level = 0 then begin
        if not(trvFormula.selected.HasChildren) then begin
           QryAux.Close;
           QryAux.Sql.Clear;
           Sql:='SELECT F.CODGRUPOFORMULA,F.IDFORMULA,F.DESCRICAOFORMULA,'+
                            ' F.EXPRESSAOFORMULA,G.DESCGRUPOFORMULA FROM FORMULA F, GRPFORMULA G '+
                            ' WHERE F.CODGRUPOFORMULA = '''+ tno(trvFormula.Selected.data)^ +''' and F.CODGRUPOFORMULA = G.CODGRUPOFORMULA(+) '+
                            ' ORDER BY G.CODGRUPOFORMULA,F.DESCRICAOFORMULA ';

           QryAux.Sql.Add(Sql);
           QryAux.Open;
           PreencheUmNivel(trvFormula,QryAux,'CodGrupoFormula','DescricaoFormula','DescGrupoFormula', True);
        end;
     end else begin
         if not QryFormula.Active then
            QryFormula.Open;
         if qryFormula.Locate('DescricaoFormula',trvFormula.Selected.Text,[loCaseInsensitive]) then begin
            xDescricao := qryFormula.FieldByName('DescricaoFormula').AsString;
            xId := qryFormula.FieldByName('IdFormula').AsString;
            xTipo := 'F';
         end else begin
             xDescricao := '';
             xId   := '';
             xTipo := '';
         end;
         Close;
     end;
end;


procedure TfrmConsulta.dblkpVariaveisDblClick(Sender: TObject);
begin
  inherited;
  xDescricao := QryVariavel.FieldByName('DESCRICAODOCAMPO').AsString;
  xId   := QryVariavel.FieldByName('IDCAMPO').AsString;
  xTipo := 'V';
  Close;
end;

procedure TfrmConsulta.bbtnConfirmarClick(Sender: TObject);
begin
  Case ntb.PageIndex of
       0 : PreencheNoRegra;
       1 : trvCamposDblClick(Sender);
       2 : dblkpVariaveisDblClick(Sender);
       3 : PreencheNoFormula;
  End;
  Close;
end;

procedure TfrmConsulta.bbtnCancelarClick(Sender: TObject);
begin
  xDescricao := '';
  xId := '';
  xTipo := '';
  Close;
end;

procedure TfrmConsulta.btnAtualizarClick(Sender: TObject);
Var
  SQLAux:String;
begin
  inherited;
  frmAguarde.Mostra('Atualizando Dados ...');
  frmAguarde.Refresh;
  Case ntb.PageIndex of
       0 : begin
                QryRegraAux.Close;
                QryRegraAux.Open;
                PreencherTree(trvRegra,QryRegraAux,'IDTIPOREGRA','NOMEREGRA','DESCREGRA', False);
           end;
       1 : begin
                QryCampo.Close;
                QryCampo.Open;
                frmAguarde.Mostra('Preenchendo Componentes ...');
                frmAguarde.Refresh;
                PreencherTree(trvCampos,QryCampo,'CODGRUPOARQUIVO','DESCRICAODOCAMPO','DESCGRUPOARQUIVO', True);
           end;
       2 : begin
                QryVariavel.Close;
                QryVariavel.Open;
           end;
       3 : begin
                QryFormula.Close;
                QryFormula.Open;
                frmAguarde.Mostra('Preenchendo Componentes ...');
                frmAguarde.Refresh;
                PreencherTree(trvFormula,QryFormula,'CodGrupoFormula','DescricaoFormula','DescGrupoFormula', True);
           end;
  End;
  frmAguarde.Apaga;
end;

procedure TfrmConsulta.FormCreate(Sender: TObject);
Var
  SQLAux:String;
begin
  QryCampo.Close;
  QryCampo.Open;
  PreencherTree(trvCampos,QryCampo,'CodGrupoArquivo','DescricaoDoCampo','DescGrupoArquivo', False);
  QryFormula.Close;
  QryFormula.Open;
  PreencherTree(trvFormula,QryFormula,'CodGrupoFormula','DescricaoFormula','DescGrupoFormula', False);
  QryRegraAux.Close;
  QryRegraAux.Open;
  PreencherTree(trvRegra,QryRegraAux,'IDTIPOREGRA','NOMEREGRA','DESCREGRA', False);

  { Troca Ordenacao da consulta as variaveis }
  
  { Busca os campos que serão listados }
  FazQuery(QryAux,'SELECT FLGCAMPO, FLGVARIAVEL FROM PARAMREGRA');
  QryVariavel.Close;
   SQLAux := QryVariavel.SQL.GetText;
   If QryAux.fieldByName('FLGVARIAVEL').AsInteger = 1 Then
     SQLAux := SQLAux +' ORDER BY IDCAMPO '
   Else
     SQLAux := SQLAux +' ORDER BY DESCRICAODOCAMPO ';
   QryVariavel.SQL.Clear;
   QryVariavel.SQL.Add(SQLAux);
  QryVariavel.Open;


end;

procedure TfrmConsulta.FormShow(Sender: TObject);
begin
  if (xTipoTela > 0) and (xTipoTela < 6) Then
     tbctrlopcoes.Tabs.clear;
  Case xTipoTela of
       1 : begin
                QryVariavel.Close;
                QryVariavel.Open;

                tbctrlopcoes.Tabs.Add('Variáveis');
                ntb.PageIndex := 2;
           end;
       2 : begin
                tbctrlopcoes.Tabs.Add('Formulas');
                ntb.PageIndex := 3;
           end;
       3 : begin
                tbctrlopcoes.Tabs.Add('Campos');
                ntb.PageIndex := 1;
           end;
       4 : begin
                QryVariavel.Close;
                QryVariavel.Open;
                tbctrlopcoes.Tabs.Add('Campos');
                tbctrlopcoes.Tabs.Add('Variáveis');
                tbctrlopcoes.TabIndex := 0;
                ntb.PageIndex := 1;
           end;
       5 : begin
                tbctrlopcoes.Tabs.Add('Regras');
                ntb.PageIndex := 0;
           end;
       else begin
                QryVariavel.Close;
                QryVariavel.Open;
                ntb.PageIndex := tbctrlopcoes.TabIndex;
            end;
  end;

//------------------------------------------------------------------------------
// Busca Parametros Globais
  FlgMostraCampo := 'D'; // Descricao
  If FazQuery(QryAux,'SELECT FLGCAMPO, FLGVARIAVEL FROM PARAMREGRA') Then Begin
//------------------------------------------------------------------------------
// Mostra o Campo de Acordo com a opção especificada na tela de parametros 
    If QryAux.fieldByName('FLGCAMPO').AsInteger = 1 Then
      CampoMostra := 'NOMEDOCAMPO'
    Else
      CampoMostra := 'DESCRICAODOCAMPO';

// Variaveis
    If QryAux.fieldByName('FLGVARIAVEL').AsInteger = 1 Then
      dblkpVariaveis.ListField := 'IDCAMPO'
    Else
      dblkpVariaveis.ListField := 'DESCRICAODOCAMPO';
  End;

end;

procedure TfrmConsulta.bbtnSairClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmConsulta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //inherited;
end;

procedure TfrmConsulta.trvRegraDblClick(Sender: TObject);
begin
  inherited;
  if trvRegra.Selected.Level = 1 then begin
     if not QryRegraAux.Active then
        QryRegraAux.Open;
     if QryRegraAux.Locate('NOMEREGRA',trvRegra.Selected.Text,[loCaseInsensitive]) then begin
        xDescricao := QryRegraAux.FieldByName('NOMEREGRA').AsString;
        xId := QryRegraAux.FieldByName('IDREGRA').AsString;
        xTipo := 'R';
        Close;
     end else begin
        xDescricao := '';
        xId := '';
        xTipo := '';
        Close;
     end;
  end else begin
      if not(trvRegra.Selected.haschildren) then begin
         frmAguarde.Mostra('Selecionando Dados ...');
         frmAguarde.Refresh;
         PreencheNoRegra;
         frmAguarde.Apaga;
      end else
          trvRegra.Selected.DeleteChildren;
  end;
end;

procedure TfrmConsulta.PreencheNoRegra;
var
  Sql : String;
begin
     if trvRegra.selected.level = 0 then begin
        if not(trvRegra.selected.HasChildren) then begin
           QryAux.Close;
           QryAux.Sql.Clear;
           Sql := 'SELECT R.IDREGRA, R.IDTIPOREGRA, R.NOMEREGRA, T.DESCREGRA '+
                  'FROM REGRA R, TIPOREGRA T WHERE  R.IDTIPOREGRA = T.IDTIPOREGRA AND T.IDTIPOREGRA = '+
                  tno(trvRegra.Selected.data)^ +' ORDER BY T.DESCREGRA, R.NOMEREGRA';
           QryAux.Sql.Add(Sql);
           QryAux.Open;
           PreencheUmNivel(trvRegra,QryAux,'IDTIPOREGRA','NOMEREGRA','DESCREGRA', True);
        end;
     end else begin
         if not QryRegraAux.Active then
            QryRegraAux.Open;
         if QryRegraAux.Locate('NOMEREGRA',trvRegra.Selected.Text,[loCaseInsensitive]) then begin
            xDescricao := QryRegraAux.FieldByName('NOMEREGRA').AsString;
            xId := QryRegraAux.FieldByName('IDREGRA').AsString;
            xTipo := 'R';
         end else begin
             xDescricao := '';
             xId := '';
             xTipo := '';
         end;
         Close;
     end;
end;


end.
