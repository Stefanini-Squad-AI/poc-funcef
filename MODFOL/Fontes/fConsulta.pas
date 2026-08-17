unit fConsulta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fOkCancelar, Db, DBTables, Wwquery, ComCtrls, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Wwdatsrc, DBCtrls,
  FileCtrl, ImgList;

type
  TfrmConsulta = class(TfrmOkCancelar)
    qryCampo: TwwQuery;
    qryVariavel: TwwQuery;
    tbctrlopcoes: TTabControl;
    Panel1: TPanel;
    ntb: TNotebook;
    qryFormula: TwwQuery;
    dsFormula: TwwDataSource;
    dsVariavel: TwwDataSource;
    dsCampo: TwwDataSource;
    trvCampos: TTreeView;
    dblkpVariaveis: TDBLookupListBox;
    trvFormula: TTreeView;
    qryAux: TwwQuery;
    ImgLstCampos: TImageList;
    qryRegraAux: TwwQuery;
    trvRegra: TTreeView;
    bbtnAtualizar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure trvFormulaExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure tbctrlopcoesChange(Sender: TObject);
    procedure trvCamposDblClick(Sender: TObject);
    procedure trvRegraDblClick(Sender: TObject);
    procedure trvFormulaDblClick(Sender: TObject);
    procedure dblkpVariaveisDblClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnAtualizarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure PreencherTree(var tTree:TTreeView; qry:TwwQuery;
      sChave,sDesc,sDescGrp:string; Aguarde:boolean);
    procedure PreencheUmNivel(var tTree:TTreeView; qry:TwwQuery;
      sChave,sDesc,sDescGrp:string; Aguarde:boolean);
    procedure PreencheNoRegra;
    procedure PreencheNoFormula;
    procedure PreencheNo;
  public
    FlgMostraCampo, // D - Descricao, C - Nome do Campo
    CampoMostra: string;
  end;

  tNo = ^string;

var
  frmConsulta: TfrmConsulta;
  xDescricao, xId, xTipo: string;
  xTipoTela: LongInt;

implementation

uses fAguarde, {fCadRegra,} fCadFormula, uBiblioteca, uDataBase;

{$R *.DFM}

procedure TfrmConsulta.FormCreate(Sender: TObject);
begin
  qryCampo.Open;
  qryFormula.Open;
  qryRegraAux.Open;

  PreencherTree(trvCampos,qryCampo,'CodGrupoArquivo','DescricaoDoCampo','DescGrupoArquivo',false);
  PreencherTree(trvFormula,qryFormula,'CodGrupoFormula','DescricaoFormula','DescGrupoFormula',false);
  PreencherTree(trvRegra,qryRegraAux,'IDTIPOREGRA','NOMEREGRA','DESCREGRA',false);
end;

procedure TfrmConsulta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // inherited; Só para inibir o Action := caFree;
  Action := caHide;
end;

procedure TfrmConsulta.FormShow(Sender: TObject);
begin
  if (xTipoTela > 0) and (xTipoTela < 6) then
    tbctrlopcoes.Tabs.Clear;

  case (xTipoTela) of
    1 :
    begin
      qryVariavel.Close;
      qryVariavel.Open;
      tbctrlopcoes.Tabs.Add('Variáveis');
      ntb.PageIndex := 2;
    end;
    2 :
    begin
      tbctrlopcoes.Tabs.Add('Formulas');
      ntb.PageIndex := 3;
    end;
    3 :
    begin
      tbctrlopcoes.Tabs.Add('Campos');
      ntb.PageIndex := 1;
    end;
    4 :
    begin
      //qryVariavel.Close;
      //qryVariavel.Open;
      tbctrlopcoes.Tabs.Add('Campos');
      tbctrlopcoes.Tabs.Add('Tabelas Genéricas e Longas');
      tbctrlopcoes.TabIndex := 0;
      ntb.PageIndex := 1;
    end;
    5 :
    begin
      tbctrlopcoes.Tabs.Add('Regras');
      ntb.PageIndex := 0;
    end;
    else
    begin
      qryVariavel.Close;
      qryVariavel.Open;
      ntb.PageIndex := tbctrlopcoes.TabIndex;
    end;
  end;

  // Busca Parametros Globais
  FlgMostraCampo := 'D'; // Descricao
  if (FazQuery(qryAux,'SELECT FLGCAMPO, FLGVARIAVEL FROM PARAMREGRA')) then
  begin
    // Mostra o Campo de Acordo com a opção especificada na tela de parametros
    if (qryAux.FieldByName('FLGCAMPO').asInteger = 1) then
      CampoMostra := 'NOMEDOCAMPO'
    else
      CampoMostra := 'DESCRICAODOCAMPO';

    // Variaveis
    if (qryAux.FieldByName('FLGVARIAVEL').asInteger = 1) then
      dblkpVariaveis.ListField := 'IDCAMPO'
    else
      dblkpVariaveis.ListField := 'DESCRICAODOCAMPO';
  end;
end;

procedure TfrmConsulta.trvFormulaExpanding(Sender: TObject; Node: TTreeNode;
  var AllowExpansion: Boolean);
begin
  Node.Selected := true;
end;

procedure TfrmConsulta.tbctrlopcoesChange(Sender: TObject);
begin
  if (tbctrlopcoes.Tabs[tbctrlopcoes.TabIndex] = 'Regras') then
    ntb.PageIndex := 0
  else
  if (tbctrlopcoes.Tabs[tbctrlopcoes.TabIndex] = 'Campos') then
    ntb.PageIndex := 1
  else
  if (tbctrlopcoes.Tabs[tbctrlopcoes.TabIndex] = 'Variáveis') then
    ntb.PageIndex := 2
  else
  if (tbctrlopcoes.Tabs[tbctrlopcoes.TabIndex] = 'Tabelas Genéricas e Longas') then
    ntb.PageIndex := 3;
end;

procedure TfrmConsulta.trvCamposDblClick(Sender: TObject);
begin
  trvCampos.Selected.Selected := true;

  if (trvCampos.Items.Count <> 0) then
  begin
    if (trvCampos.Selected.Level = 0) then
    begin
      if not(trvCampos.Selected.haschildren) then
      begin
        frmAguarde.Mostra('Selecionando Dados ...');
        frmAguarde.Refresh;
        PreencheNo;
        frmAguarde.Apaga;
      end;

      if (trvCampos.Selected.Level = 1) then
      begin
        if not(qryCampo.Active) then
          qryCampo.Open;

        if (qryCampo.Locate(CampoMostra,trvCampos.Selected.Text,[loCaseInsensitive])) then
        begin
          xDescricao := qryCampo.FieldByName('DescricaoDoCampo').asString;
          xId := qryCampo.FieldByName('NomedoCampo').asString;
          xTipo := 'C';
          Close;
        end
        else
        begin
          xDescricao := '';
          xId := '';
          xTipo := '';
          Close;
        end;
      end;
    end
    else
    begin
      if not(qryCampo.Active) then
        qryCampo.Open;

      if (qryCampo.Locate(CampoMostra,trvCampos.Selected.Text,[loCaseInsensitive])) then
      begin
        xDescricao := qryCampo.FieldByName('DescricaoDoCampo').asString;
        xId := qryCampo.FieldByName('NomedoCampo').asString;
        xTipo := 'C';
        Close;
      end
      else
      begin
        xDescricao := '';
        xId := '';
        xTipo := '';
        Close;
      end;
    end;
  end;
end;

procedure TfrmConsulta.trvRegraDblClick(Sender: TObject);
begin
  if (trvRegra.Selected.Level = 1) then
  begin
    if not(qryRegraAux.Active) then
      qryRegraAux.Open;

    if (qryRegraAux.Locate('NOMEREGRA',trvRegra.Selected.Text,[loCaseInsensitive])) then
    begin
      xDescricao := qryRegraAux.FieldByName('NOMEREGRA').asString;
      xId := qryRegraAux.FieldByName('IDREGRA').asString;
      xTipo := 'R';
      Close;
    end
    else
    begin
      xDescricao := '';
      xId := '';
      xTipo := '';
      Close;
    end;
  end
  else
  begin
    if not(trvRegra.Selected.haschildren) then
    begin
      frmAguarde.Mostra('Selecionando Dados ...');
      frmAguarde.Refresh;
      PreencheNoRegra;
      frmAguarde.Apaga;
    end
    else
      trvRegra.Selected.DeleteChildren;
  end;
end;

procedure TfrmConsulta.trvFormulaDblClick(Sender: TObject);
begin
  if (trvFormula.Selected.Level = 1) then
  begin
    if not(qryFormula.Active) then
      qryFormula.Open;

    if (qryFormula.Locate('DescricaoFormula',trvFormula.Selected.Text,[loCaseInsensitive])) then
    begin
      xDescricao := qryFormula.FieldByName('DescricaoFormula').asString;
      xId := qryFormula.FieldByName('IdFormula').asString;
      xTipo := 'F';
      Close;
    end
    else
    begin
      xDescricao := '';
      xId := '';
      xTipo := '';
      Close;
    end;
  end
  else
  begin
    if not(trvFormula.Selected.haschildren) then
    begin
      frmAguarde.Mostra('Selecionando Dados ...');
      frmAguarde.Refresh;
      PreencheNoFormula;
      frmAguarde.Apaga;
    end
    else
      trvFormula.Selected.DeleteChildren;
  end;
end;

procedure TfrmConsulta.dblkpVariaveisDblClick(Sender: TObject);
begin
  xDescricao := qryVariavel.FieldByName('DESCRICAODOCAMPO').asString;
  xId   := qryVariavel.FieldByName('IDCAMPO').asString;
  xTipo := 'V';
  Close;
end;

procedure TfrmConsulta.bbtnConfirmarClick(Sender: TObject);
begin
  case (ntb.PageIndex) of
    0 : PreencheNoRegra;
    1 : PreencheNo;
    2 : dblkpVariaveisDblClick(Sender);
    3 : PreencheNoFormula;
  end;
  Close;
end;

procedure TfrmConsulta.bbtnCancelarClick(Sender: TObject);
begin
  xDescricao := '';
  xId := '';
  xTipo := '';
  Close;
end;

procedure TfrmConsulta.bbtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConsulta.bbtnAtualizarClick(Sender: TObject);
begin
  frmAguarde.Mostra('Atualizando Dados ...');
  frmAguarde.Refresh;
  case (ntb.PageIndex) of
    0 :
    begin
      qryRegraAux.Close;
      qryRegraAux.Open;
      PreencherTree(trvRegra,qryRegraAux,'IDTIPOREGRA','NOMEREGRA','DESCREGRA', false);
    end;
    1 :
    begin
      qryCampo.Close;
      qryCampo.Open;
      frmAguarde.Mostra('Preenchendo Componentes ...');
      frmAguarde.Refresh;
      PreencherTree(trvCampos,qryCampo,'CODGRUPOARQUIVO','DESCRICAODOCAMPO','DESCGRUPOARQUIVO', true);
    end;
    2 :
    begin
      qryVariavel.Close;
      qryVariavel.Open;
    end;
    3 :
    begin
      qryFormula.Close;
      qryFormula.Open;
      frmAguarde.Mostra('Preenchendo Componentes ...');
      frmAguarde.Refresh;
      PreencherTree(trvFormula,qryFormula,'CodGrupoFormula','DescricaoFormula','DescGrupoFormula', true);
    end;
  end;
  frmAguarde.Apaga;
end;

procedure TfrmConsulta.PreencherTree(var tTree:TTreeView; qry:TwwQuery;
  sChave,sDesc,sDescGrp:string; Aguarde:boolean);
var
  sCodAnterior, sDescInsert: string;
  iUltIndNivel1, iUltInsert: integer;
  no: tNo;
begin
  tTree.Items.Clear;
  sCodAnterior  := '';
  iUltIndNivel1 := -1;
  iUltInsert    := -1;
  if not(qry.Active) then
    qry.Open;

  qry.First;

  if (Aguarde) then
  begin
    frmAguarde.Pos := 0;
    frmAguarde.Max := qry.RecordCount;
    frmAguarde.Min := 0;
  end;

  while not(qry.EOF) do
  begin
    if (Aguarde) then
      frmAguarde.Pos := frmAguarde.Pos + 1;

    new(no);
    no^ := qry.FieldByName(sChave).asString;

    if (sCodAnterior <> qry.FieldByName(sChave).asString) then
    begin
      sCodAnterior := qry.FieldByName(sChave).asString;

      if (Trim(qry.FieldByName(sDescGrp).asString) = '') then
        sDescInsert := 'Grupo Indeterminado'
      else
        sDescInsert := qry.FieldByName(sDescGrp).asString;

      if (iUltIndNivel1 = -1) then
      begin
        tTree.Items.Addobject(nil,sDescInsert,no);
        Inc(iUltIndNivel1);
        Inc(iUltInsert);
        tTree.Items[iUltIndNivel1].ImageIndex := 0;
      end
      else
      begin
        tTree.Items.AddObject(ttree.items[0],sDescInsert,no);
        Inc(iUltInsert);
        iUltIndNivel1 := iUltInsert;
        tTree.Items[iUltIndNivel1].ImageIndex := 0;
        tTree.Items[iUltInsert].selectedIndex := 3;
      end;
    end;
    qry.Next;
  end;

  if (Aguarde) then
  begin
    frmAguarde.Min := -1;
    frmAguarde.Apaga;
  end;
end;

procedure TfrmConsulta.PreencheUmNivel(var tTree:TTreeView; qry:TwwQuery;
  sChave,sDesc,sDescGrp:string; Aguarde:boolean);
var
  no: tNo;
  i: integer;
begin
  if not(qry.Active) then
    qry.Open;

  if (Aguarde) then
  begin
    frmAguarde.Pos := 0;
    frmAguarde.Max := qry.RecordCount;
    frmAguarde.Min := 0;
  end;

  tTree.Selected.DeleteChildren;
  qry.First;
  i := tTree.Selected.AbsoluteIndex;
  while not(qry.EOF) do
  begin
    if (Aguarde) then
      frmAguarde.Pos := frmAguarde.Pos + 1;

    new(no);
    no^:=qry.FieldByName(sChave).asString;
    tTree.Items.AddChildobject(tTree.selected,qry.FieldByName(sDesc).asString,no);
    Inc(i);
    tTree.Items[i].ImageIndex := 1;
    tTree.Items[i].selectedIndex := 2;
    qry.Next;
  end;
  tTree.Selected.Expand(true);

  if (Aguarde) then
  begin
    frmAguarde.Min := -1;
    frmAguarde.Apaga;
  end;
end;

procedure TfrmConsulta.PreencheNoRegra;
begin
  if (trvRegra.Selected.Level = 0) then
  begin
    if not(trvRegra.selected.HasChildren) then
    begin
      qryAux.Close;
      qryAux.Sql.Clear;
      qryAux.Sql.Add('SELECT R.IDREGRA, R.IDTIPOREGRA, R.NOMEREGRA, T.DESCREGRA ');
      qryAux.Sql.Add('FROM REGRA R, TIPOREGRA T');
      qryAux.Sql.Add('WHERE R.IDTIPOREGRA = T.IDTIPOREGRA AND');
      qryAux.Sql.Add('T.IDTIPOREGRA = '+tNo(trvRegra.Selected.data)^);
      qryAux.Sql.Add('ORDER BY T.DESCREGRA, R.NOMEREGRA');
      qryAux.Open;
      PreencheUmNivel(trvRegra,qryAux,'IDTIPOREGRA','NOMEREGRA','DESCREGRA', true);
    end;
  end
  else
  begin
    if not(qryRegraAux.Active) then
      qryRegraAux.Open;

    if (qryRegraAux.Locate('NOMEREGRA',trvRegra.Selected.Text,[loCaseInsensitive])) then
    begin
      xDescricao := qryRegraAux.FieldByName('NOMEREGRA').asString;
      xId := qryRegraAux.FieldByName('IDREGRA').asString;
      xTipo := 'R';
    end
    else
    begin
      xDescricao := '';
      xId := '';
      xTipo := '';
    end;
    Close;
  end;
end;
  
procedure TfrmConsulta.PreencheNoFormula;
begin
  if (trvFormula.selected.level = 0) then
  begin
    if not(trvFormula.selected.HasChildren) then
    begin
      qryAux.Close;
      qryAux.Sql.Clear;
      qryAux.Sql.Add('SELECT');
      qryAux.Sql.Add('  C.CODTABELA AS CODGRUPOFORMULA, C.CODCAMPO AS IDFORMULA,');
      qryAux.Sql.Add('  C.DESCRICAO AS DESCRICAOFORMULA,');
      qryAux.Sql.Add('  ''(Genérica) '' || RTRIM(T.DESCRICAO) AS DESCGRUPOFORMULA');
      qryAux.Sql.Add('FROM');
      qryAux.Sql.Add('  CAMPOTABGENER C, TABGENER T');
      qryAux.Sql.Add('WHERE');
      qryAux.Sql.Add('  (C.CODTABELA = '''+ tNo(trvFormula.Selected.data)^ +''') AND');
      qryAux.Sql.Add('  (C.CODTABELA = T.CODTABELA)');
      qryAux.Sql.Add('UNION');
      qryAux.Sql.Add('SELECT');
      qryAux.Sql.Add('  T.DESCRICAO AS CODGRUPOFORMULA, C.DESCRICAO AS IDFORMULA,');
      qryAux.Sql.Add('  C.DESCRICAO AS DESCRICAOFORMULA,');
      qryAux.Sql.Add('  ''(Longa)    '' || RTRIM(T.DESCRICAO) AS DESCGRUPOFORMULA');
      qryAux.Sql.Add('FROM');
      qryAux.Sql.Add('  LONGCMPTABGENER C, LONGTABGENER T');
      qryAux.Sql.Add('WHERE');
      qryAux.Sql.Add('  (T.DESCRICAO = '''+ tNo(trvFormula.Selected.data)^ +''') AND');
      qryAux.Sql.Add('  (C.IDTABELA = T.IDTABELA)');
      qryAux.Sql.Add('ORDER BY DESCGRUPOFORMULA,DESCRICAOFORMULA');
      qryAux.Open;
      PreencheUmNivel(trvFormula,qryAux,'CodGrupoFormula','DescricaoFormula','DescGrupoFormula', true);
    end;
    xId := tno(trvFormula.Selected.data)^;
    xTipo := 'F';
  end
  else
  begin
    if not(qryFormula.Active) then
      qryFormula.Open;

    if (qryFormula.Locate('CodGrupoFormula;DescricaoFormula',
        VarArrayOf([tno(trvFormula.Selected.data)^,trvFormula.Selected.Text]),
        [loCaseInsensitive])) then
    begin
      xDescricao := qryFormula.FieldByName('DescricaoFormula').asString;
      xId := qryFormula.FieldByName('IdFormula').asString;
      xTipo := 'F';
    end
    else
    begin
      xDescricao := '';
      xId   := '';
      xTipo := '';
    end;
    Close;
  end;
end;

procedure TfrmConsulta.PreencheNo;
begin
  if (trvCampos.Items.Count <> 0) then
  begin
    if (trvcampos.Selected.Level = 0) then
    begin
      if not(trvcampos.Selected.HasChildren) then
      begin
        qryAux.close;
        qryAux.sql.clear;
        qryAux.sql.Add('SELECT');
        qryAux.sql.Add('  G.CODGRUPOARQUIVO,C.IDCAMPO,C.NOMEDOCAMPO,C.APELIDO,');
        qryAux.sql.Add('  C.DESCRICAODOCAMPO, G.DESCGRUPOARQUIVO');
        qryAux.sql.Add('FROM');
        qryAux.sql.Add('  CMPBD C, GRPARQUIVO G, CMPBDGRP CG');
        qryAux.sql.Add('WHERE');
        qryAux.sql.Add('  (C.CAMPODOBANCO   >= 1) AND');
        qryAux.sql.Add('  (G.CODGRUPOARQUIVO = '''+tNo(trvCampos.Selected.Data)^+''') AND');
        qryAux.sql.Add('  (G.CODGRUPOARQUIVO = CG.CODGRUPOARQUIVO) AND');
        qryAux.sql.Add('  (C.IDCAMPO         = CG.IDCAMPO(+))');
        qryAux.sql.Add('ORDER BY CG.CODGRUPOARQUIVO,C.DESCRICAODOCAMPO');
        qryAux.open;

        PreencheUmNivel(trvCampos,qryAux,'CODGRUPOARQUIVO',CampoMostra,
          'DESCGRUPOARQUIVO', true);
      end;
    end
    else
    begin
      if not(qryCampo.Active) then
        qryCampo.Open;

      if (qryCampo.Locate('DescricaoDoCampo',trvCampos.Selected.Text,[loCaseInsensitive])) then
      begin
        xDescricao := qryCampo.FieldByName('DescricaoDoCampo').asString;
        xId := qryCampo.FieldByName('NomedoCampo').asString;
        xTipo := 'C';
      end
      else
      begin
        xDescricao := '';
        xId := '';
        xTipo := '';
      end;
      Close;
    end;
  end;  
end;

end.
