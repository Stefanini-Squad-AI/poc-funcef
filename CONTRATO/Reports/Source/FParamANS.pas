{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
N. Sol..........: 253082/17369
N. PPM..........: 844934
Data............: 29/06/2015
Responsável.....: Felipe A. Santos
Descrição.......: Criação do relatório ANS.
--------------------------------------------------------------------------------}

unit FParamANS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, CheckLst, ComCtrls,
  Db, DBClient, uCMClientDataSet, DBTables, Wwquery, Mask;

type
  TfrmParamANS = class(TfrmParamReports_Padrao)
    lblRef: TLabel;
    lblDtInicio: TLabel;
    lblDtFim: TLabel;
    lblNumCI: TLabel;
    pgcDetalhe: TPageControl;
    tbsContratos: TTabSheet;
    chklstContratos: TCheckListBox;
    btnSelTodos: TBitBtn;
    btnInverteSel: TBitBtn;
    cbbFiltroNumCI: TComboBox;
    edtFiltroNumCI: TEdit;
    pnlBarra: TPanel;
    qryAux: TwwQuery;
    medtDtInicial: TMaskEdit;
    medtDtFinal: TMaskEdit;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSelTodosClick(Sender: TObject);
    procedure btnInverteSelClick(Sender: TObject);
  private

    lstContratos : TStringList;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamANS: TfrmParamANS;

implementation

uses DRelatoriosContrato, USistema;

{$R *.DFM}

procedure TfrmParamANS.bbtnConfirmarClick(Sender: TObject);
var
   sSQL, sSQLTot, sIdContratos, sDtIni, sDtFim : string;
   i, iCount : integer;
   bPrimeiro : boolean;
   lstContratoGroup, lstQtdContratos : TStringList;
begin
  inherited;

  sSQL := 'SELECT C.NOMECONTRATO, ' +
          '       CONTRANS.VLRMENSAL, ' +
          '       CONTRANS.VLRANS, ' +
          '       CONTRANS.NUMCI, ' +
          '       CONTRANS.REFERENCIA, ' +
          '       CONTRANS.OBS, ' +
          '       CONTRANS.IDCONTRATO, ' +
          '       (CONTRANS.VLRMENSAL - CONTRANS.VLRANS) AS TOTPAGO ' +
          '  FROM CONTRATOANS CONTRANS, CONTRATOCONTR C ' +
          ' WHERE(CONTRANS.IDCONTRATO = C.IDCONTRATO) ';

 //  filtro de data inicial e final da referência
 sDtIni := Trim(StringReplace(medtDtInicial.Text, '/', '', [rfReplaceAll]));
 sDtFim := Trim(StringReplace(medtDtFinal.Text, '/', '', [rfReplaceAll]));

  if (sDtIni <> '') and (sDtFim = '') then
  begin
     sSQL := sSQL + ' AND (TO_DATE(CONTRANS.REFERENCIA, ''MM/YYYY'') >= TO_DATE(' + QuotedStr(medtDtInicial.Text)+ ', ''MM/YYYY''))';
     dtmRelatoriosContrato.pplblVlrPeriodo.Caption := 'Após ' + Trim(medtDtInicial.Text);
  end
  else if (sDtIni = '') and (sDtFim <> '') then
  begin
     sSQL := sSQL + ' AND (TO_DATE(CONTRANS.REFERENCIA, ''MM/YYYY'') <= TO_DATE(' + QuotedStr(medtDtFinal.Text)+ ', ''MM/YYYY''))';
     dtmRelatoriosContrato.pplblVlrPeriodo.Caption := 'Até ' + Trim(medtDtFinal.Text);
  end
  else if (sDtIni <> '') and (sDtFim <> '') then
  begin
     sSQL := sSQL + ' AND (TO_DATE(CONTRANS.REFERENCIA, ''MM/YYYY'') BETWEEN TO_DATE(' + QuotedStr(medtDtInicial.Text)+ ', ''MM/YYYY'') ' +
                    '                                                AND     TO_DATE(' + QuotedStr(medtDtFinal.Text) + ', ''MM/YYYY''))';
     dtmRelatoriosContrato.pplblVlrPeriodo.Caption := Trim(medtDtInicial.Text) + ' à ' + Trim(medtDtFinal.Text);
  end
  else
     dtmRelatoriosContrato.pplblVlrPeriodo.Caption := 'TODOS';

  // CONTROLA O FILTRO DOS CONTRATOS SELECIONADOS
  try

    bPrimeiro := True;

    lstContratoGroup := TStringList.Create;

    for i := 0 to chklstContratos.Items.Count -1 do
    begin
       if chklstContratos.Checked[i] then
       begin
            iCount := iCount + 1;
            if trim(sIdContratos) = '' then
               sIdContratos := lstContratos.Strings[i]
            else
               sIdContratos := sIdContratos + ', ' + lstContratos.Strings[i];

            if iCount = 999 then
            begin
               lstContratoGroup.Add(sIdContratos);
               sIdContratos := '';
               iCount := 0;
            end;
       end;

    end;

    if iCount <> 0 then
    begin
      lstContratoGroup.Add(sIdContratos);
      sIdContratos := '';
      iCount := 0;
    end;

    for i := 0 to lstContratoGroup.Count -1 do
    begin
       if bPrimeiro then
       begin
          sSQL := sSQL + ' AND ((CONTRANS.IDCONTRATO IN(' + lstContratoGroup.Strings[i] + '))';
          bPrimeiro := False;
       end
       else
       begin
         sSQL := sSQL + ' OR (CONTRANS.IDCONTRATO IN(' + lstContratoGroup.Strings[i] + '))';
       end;

       if (i = (lstContratoGroup.Count -1)) then
          sSQL := sSQL + ')';
    end;

    if lstContratoGroup.Count = 0 then
    begin
      sSQL := sSQL + ' AND CONTRANS.IDCONTRATO IN (SELECT IDCONTRATO ' +
                     '                               FROM CONTRATOUSUARIO '+
                     '                              WHERE (IDUSUARIO = '+FloatToStr(Sistema.IdUsuario)+')) ';
    end;

  finally
    FreeAndNil(lstContratoGroup);
  end;

  // Filtro de NUMCI da estrutura CONTRATOANS
  if (Trim(edtFiltroNumCI.Text) <> '') or (cbbFiltroNumCI.ItemIndex in [4,5]) then
  begin
     //começa com
     if cbbFiltroNumCI.ItemIndex = 0 then
        sSQL := sSQL + ' AND (CONTRANS.NUMCI LIKE ' + QuotedStr(edtFiltroNumCI.Text + '%') + ')'
     //é igual a
     else if cbbFiltroNumCI.ItemIndex = 1 then
        sSQL := sSQL + ' AND (CONTRANS.NUMCI = ' + QuotedStr(edtFiltroNumCI.Text) + ')'
     //possui o texto
     else if cbbFiltroNumCI.ItemIndex = 2 then
        sSQL := sSQL + ' AND (CONTRANS.NUMCI LIKE ' + QuotedStr('%' + edtFiltroNumCI.Text + '%') + ')'
     //é diferente de
     else if cbbFiltroNumCI.ItemIndex = 3 then
        sSQL := sSQL + ' AND (CONTRANS.NUMCI <> ' + QuotedStr(edtFiltroNumCI.Text) + ')'
     //é nulo
     else if cbbFiltroNumCI.ItemIndex = 4 then
        sSQL := sSQL + ' AND (CONTRANS.NUMCI IS NULL)'
     //não é nulo
     else if cbbFiltroNumCI.ItemIndex = 5 then
        sSQL := sSQL + ' AND (CONTRANS.NUMCI IS NOT NULL)';
  end;

  sSQL := sSQL + ' ORDER BY C.NOMECONTRATO';

  dtmRelatoriosContrato.qryANS.Close;
  dtmRelatoriosContrato.qryANS.SQL.Clear;
  dtmRelatoriosContrato.qryANS.SQL.Add(sSQL);
  dtmRelatoriosContrato.qryANS.Open;

  try
    lstQtdContratos := TStringList.Create;

    dtmRelatoriosContrato.qryANS.First;
    while  not(dtmRelatoriosContrato.qryANS.Eof) do
    begin

      if (lstQtdContratos.IndexOf(dtmRelatoriosContrato.qryANS.FieldByName('IDCONTRATO').AsString) = -1) then
      begin
         lstQtdContratos.Add(dtmRelatoriosContrato.qryANS.FieldByName('IDCONTRATO').AsString);
      end;

      dtmRelatoriosContrato.qryANS.Next;
    end;

    dtmRelatoriosContrato.pplblQtdContratos.Caption := IntToStr(lstQtdContratos.Count);
  finally
    FreeAndNil(lstQtdContratos);
  end;
end;

procedure TfrmParamANS.FormCreate(Sender: TObject);
begin
  inherited;
  lstContratos := TStringList.Create;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT C.IDCONTRATO, C.NOMECONTRATO ' +
                 '  FROM CONTRATOANS CONTRANS, CONTRATOCONTR C ' +
                 ' WHERE CONTRANS.IDCONTRATO IN (SELECT IDCONTRATO ' +
                 '                                 FROM CONTRATOUSUARIO '+
                 '                                WHERE (IDUSUARIO = '+FloatToStr(Sistema.IdUsuario)+'))' +
                 '   AND CONTRANS.IDCONTRATO = C.IDCONTRATO ' +
                 ' ORDER BY C.NOMECONTRATO');
  qryAux.Open;

  qryAux.First;
  while not(qryAux.Eof) do
  begin
  
    if (lstContratos.IndexOf(qryAux.FieldByName('IDCONTRATO').AsString) = -1) then
    begin
      chklstContratos.Items.Add(qryAux.FieldByName('NOMECONTRATO').AsString);
      lstContratos.Add(qryAux.FieldByName('IDCONTRATO').AsString);
    end;

    qryAux.Next;
  end;

end;

procedure TfrmParamANS.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(lstContratos);
  inherited;

end;

procedure TfrmParamANS.btnSelTodosClick(Sender: TObject);
var
 i : integer;
begin
  inherited;
  for i := 0 to chklstContratos.Items.Count -1 do
  begin
     chklstContratos.Checked[i] := True;
  end;
end;

procedure TfrmParamANS.btnInverteSelClick(Sender: TObject);
var
 i : integer;
begin
  inherited;
  for i := 0 to chklstContratos.Items.Count -1 do
  begin
     chklstContratos.Checked[i] := not(chklstContratos.Checked[i]);
  end;
end;

end.
