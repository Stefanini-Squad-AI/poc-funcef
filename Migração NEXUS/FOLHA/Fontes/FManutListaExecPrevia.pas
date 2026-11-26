unit FManutListaExecPrevia;

{*******************************************************************************
******************************** REGISTRO DE ALTERAÇÕES ************************
********************************************************************************
------------------------------------------------------------------------------
Alteração  : Criação da Funcionalidade
Nº WO......: WO
Data.......: 10/03/2025
Responsável: Edilaine
Descrição..: Manutenção das listas de execução da Previa
------------------------------------------------------------------------------}


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Buttons, ImgList, StdCtrls, Grids, Wwdbigrd, Wwdbgrid,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, TB97, ExtCtrls, Db,
  MskEdDlg, DBTables, Wwquery, DBCtrls, wwdblook, DBaseDados, UDataBase,
  uSistema, UMensErro, Menus;

type
  TfrmManutListaExecPrevia = class(TfrmOkCancelar)
    pnlGrid: TPanel;
    pnlFiltro: TPanel;
    dbgdSubListas: TwwDBGrid;
    gbFiltro: TGroupBox;
    gbSeqExec: TGroupBox;
    edSeqExec: TEdit;
    GroupBox2: TGroupBox;
    lblZero: TLabel;
    lblFalta: TLabel;
    lblFalha: TLabel;
    lblFinalizado: TLabel;
    dbZero: TDBText;
    dbFalta: TDBText;
    dbFalha: TDBText;
    dbFinal: TDBText;
    qryListaOri: TwwQuery;
    dsListaOri: TDataSource;
    dsListaFilha: TDataSource;
    qryListaFilha: TwwQuery;
    Label1: TLabel;
    Label2: TLabel;
    edListaIni: TEdit;
    edListaFim: TEdit;
    Label3: TLabel;
    qryAlt: TwwQuery;
    popSelLista: TPopupMenu;
    Inicial1: TMenuItem;
    Final1: TMenuItem;
    dbLista: TDBText;
    ckAuto: TCheckBox;
    edQtde: TEdit;
    qryAux: TwwQuery;
    btnCarrega: TBitBtn;
    procedure edSeqExecKeyPress(Sender: TObject; var Key: Char);
    procedure edListaIniKeyPress(Sender: TObject; var Key: Char);
    procedure edListaFimKeyPress(Sender: TObject; var Key: Char);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure Inicial1Click(Sender: TObject);
    procedure Final1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCarregaClick(Sender: TObject);
  private
    { Private declarations }
    procedure  CarregaListaFilha;

  public
    { Public declarations }
  end;

var
  frmManutListaExecPrevia: TfrmManutListaExecPrevia;

implementation

{$R *.DFM}

procedure TfrmManutListaExecPrevia.edSeqExecKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (key in ['0'..'9', #8]) then
     key := #0;
end;

procedure TfrmManutListaExecPrevia.btnCarregaClick(Sender: TObject);
begin
  inherited;
  if (edSeqExec.text = '') then
  begin
    MsgDlg('Informe um sequencial.','Informação',mtInformation,[mbOk],0);
    edSeqExec.SetFocus;
    exit;
  end;

  qryListaOri.close;
  qryListaOri.ParamByName('IDSEQEXEC').AsString := edSeqExec.text;
  qryListaOri.Open;

  if qryListaOri.IsEmpty then
  begin
    MsgDlg('Não há listas para o sequencial informado.','Informação',mtInformation,[mbOk],0);
    edSeqExec.SetFocus;
  end
  else
    CarregaListaFilha();
end;

procedure TfrmManutListaExecPrevia.CarregaListaFilha;
begin
  qryListaFilha.Close;
  qryListaFilha.SQL.Clear;
  qryListaFilha.SQL.Add('SELECT PC.IDSEQEXECPREVIA, PC.IDLISTAORIGEM, LF.NOME,       ');
  qryListaFilha.SQL.Add('       PC.IDLISTACLONE, PC.IDPREVIABENEF, PC.FLGPROCESSADO, ');
  qryListaFilha.SQL.Add('       PC.FLGPROCESSADO || '' - ''||                        ');
  qryListaFilha.SQL.Add('       DECODE(PC.FLGPROCESSADO, 0, ''Para processamento'',  ');
  qryListaFilha.SQL.Add('                                1, ''Parcial/Falha'',       ');
  qryListaFilha.SQL.Add('                                2, ''Finalizada'',          ');
  qryListaFilha.SQL.Add('                                3, ''A processar ou Reprocessar'') AS STATUS ');
  qryListaFilha.SQL.Add('  FROM PREVIA_CONTROLE PC                              ');
  qryListaFilha.SQL.Add('  JOIN LISTAFOLHABENEF LF                              ');
  qryListaFilha.SQL.Add('    ON LF.IDLISTA = PC.IDLISTAORIGEM                   ');
  qryListaFilha.SQL.Add(' WHERE PC.IDSEQEXECPREVIA = '+edSeqExec.text            );
  qryListaFilha.SQL.Add('   AND PC.IDLISTAORIGEM = '+qryListaOri.FieldByName('IDLISTA').AsString );
  qryListaFilha.SQL.Add(' ORDER BY PC.IDSEQEXECPREVIA DESC, PC.IDLISTACLONE ASC ');
  qryListaFilha.Open;

  if ckAuto.checked then
  begin
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('SELECT MIN(PC.IDLISTACLONE) AS INICIO, MAX(PC.IDLISTACLONE) AS FINAL');
    qryAux.SQL.Add('  FROM PREVIA_CONTROLE PC                         ');
    qryAux.SQL.Add(' WHERE PC.IDSEQEXECPREVIA = '+edSeqExec.text       );
    qryAux.SQL.Add('   AND PC.FLGPROCESSADO = 3'   );
    qryAux.SQL.Add('   AND ROWNUM <= '+edQtde.text  );
    qryAux.SQL.Add(' ORDER BY PC.IDLISTACLONE ASC ');
    qryAux.Open;

    if not qryAux.isEmpty then
    begin
      edListaIni.text := qryAux.FieldByName('INICIO').AsString;
      edListaFim.text := qryAux.FieldByName('FINAL').AsString;
    end;
  end
  else
  begin
    edListaIni.text := '';
    edListaFim.text := '';
  end;

  if not qryListaFilha.Locate('FLGPROCESSADO', '1', []) then
     qryListaFilha.Locate('FLGPROCESSADO', '3', []);

end;

procedure TfrmManutListaExecPrevia.edListaIniKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (key in ['0'..'9', #8]) then
     key := #0;
end;

procedure TfrmManutListaExecPrevia.edListaFimKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (key in ['0'..'9', #8]) then
     key := #0;
end;

procedure TfrmManutListaExecPrevia.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

  if (edSeqExec.text = '') then
  begin
    MsgDlg('Informe um sequencial.','Informação',mtInformation,[mbOk],0);
    edSeqExec.SetFocus;
    exit;
  end;

  if (edListaIni.text = '') then
  begin
    MsgDlg('Informe a lista clone inicial.','Informação',mtInformation,[mbOk],0);
    edListaIni.SetFocus;
    exit;
  end;

  //valida lista informadas
  try
    qryListaFilha.DisableControls;
    if not qryListaFilha.Locate('IDLISTACLONE', edListaIni.text, []) then
    begin
      MsgDlg('Lista clone inicial não existe.','Informação',mtInformation,[mbOk],0);
      edListaIni.SetFocus;
      exit;
    end;

    if (edListaFim.text <> '') then
    begin
      if not qryListaFilha.Locate('IDLISTACLONE', edListaFim.text, []) then
      begin
        MsgDlg('Lista clone final não existe.','Informação',mtInformation,[mbOk],0);
        edListaFim.SetFocus;
        exit;
      end;
    end;
  finally
    qryListaFilha.first;
    qryListaFilha.EnableControls;
  end;

  try
    if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

    if (edListaFim.text = '') then
    begin
      qryAlt.close;
      qryAlt.SQL.Clear;
      qryAlt.SQL.Add('UPDATE PREVIA_CONTROLE SET FLGPROCESSADO = 0, IDPREVIABENEF = null');
      qryAlt.SQL.Add(' WHERE IDSEQEXECPREVIA = '+edSeqExec.text );
      qryAlt.SQL.Add('   AND IDLISTACLONE >= '+edListaIni.Text  );
      qryAlt.ExecSQL;
    end
    else
    begin
      // marca o intervalo das listas para PROCESSAMENTO (0)
      qryAlt.close;
      qryAlt.SQL.Clear;
      qryAlt.SQL.Add('UPDATE PREVIA_CONTROLE SET FLGPROCESSADO = 0, IDPREVIABENEF = null');
      qryAlt.SQL.Add(' WHERE IDSEQEXECPREVIA = '+edSeqExec.text );
      qryAlt.SQL.Add('   AND IDLISTACLONE >= '+edListaIni.Text     );
      qryAlt.SQL.Add('   AND IDLISTACLONE <= '+edListaFim.Text     );
      qryAlt.ExecSQL;

      // marca todas as lista > listFim como REPROCESSAR (3)
      qryAlt.close;
      qryAlt.SQL.Clear;
      qryAlt.SQL.Add('UPDATE PREVIA_CONTROLE SET FLGPROCESSADO = 3, IDPREVIABENEF = null');
      qryAlt.SQL.Add(' WHERE IDSEQEXECPREVIA = '+edSeqExec.text );
      qryAlt.SQL.Add('   AND IDLISTACLONE > '+edListaFim.Text      );
      qryAlt.ExecSQL;

    end;

    if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Commit;

    btnCarregaClick(btnCarrega);

  except
    if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Rollback;
  end;

end;

procedure TfrmManutListaExecPrevia.Inicial1Click(Sender: TObject);
begin
  inherited;
  if (qryListaFilha.active) and (not qryListaFilha.isEmpty) then
     edListaIni.text := qryListaFilha.FieldByName('IDLISTACLONE').AsString;
end;

procedure TfrmManutListaExecPrevia.Final1Click(Sender: TObject);
begin
  inherited;
  if (qryListaFilha.active) and (not qryListaFilha.isEmpty) then
     edListaFim.text := qryListaFilha.FieldByName('IDLISTACLONE').AsString;
end;

procedure TfrmManutListaExecPrevia.FormShow(Sender: TObject);
begin
  inherited;
  edSeqExec.Focused;
end;



end.
