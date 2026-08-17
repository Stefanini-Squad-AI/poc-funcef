// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 02.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
UNIT FAssocProvPatro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Wwdbigrd, Wwdbgrid,
  DBCtrls, Grids, DBGrids, Db, DBTables, Wwquery, Wwdatsrc, Menus, FTelaAut,
  TB97, TB97Tlbr, MontaSelect, IvDictio, IvMulti, IvEMulti;

type
  TfrmAssocProvPatro = class(TfrmSairAjuda)
    dsPatro: TwwDataSource;
    qryPatro: TwwQuery;
    Panel4: TPanel;
    lblNome: TLabel;
    dbgrdPatro: TDBGrid;
    Panel5: TPanel;
    Label10: TLabel;
    sbtnAssocia: TSpeedButton;
    sbtnAssociaTodos: TSpeedButton;
    sbtnDesassocia: TSpeedButton;
    sbtnDesassociaTodos: TSpeedButton;
    lblPlanPatro: TLabel;
    dbgrdPlanPatro: TwwDBGrid;
    dsProvPatro: TwwDataSource;
    pmenu: TPopupMenu;
    AlterarCodigo: TMenuItem;
    qryProvPatro: TwwQuery;
    qryAux: TwwQuery;
    dsProv: TwwDataSource;
    qryProv: TwwQuery;
    btnProcProv: TBitBtn;
    Label1: TLabel;
    rgTpRubrica: TRadioGroup;
    dbgProvDesc: TwwDBGrid;
    MontaSqlProv: TMontaSelect;
    MontaSqlRXP: TMontaSelect;
    btnProcRXP: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure sbtnAssociaClick(Sender: TObject);
    procedure dbgrdPlanPatroDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure dbgrdPlanPatroDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure dbgrdPlanPatroMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure sbtnAssociaTodosClick(Sender: TObject);
    procedure sbtnDesassociaClick(Sender: TObject);
    procedure sbtnDesassociaTodosClick(Sender: TObject);
    procedure AlterarCodigoClick(Sender: TObject);
    procedure qryPatroAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure rgTpRubricaClick(Sender: TObject);
    procedure btnProcProvClick(Sender: TObject);
    procedure dbgProvDescDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure dbgProvDescDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure dbgProvDescMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnProcRXPClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    IdProvento, sTpRubrica , sCodProvLido: string;
    AssociaTodos           : Boolean;

    procedure MontaTelaLerCodProvento;
    procedure AssociaProvento;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAssocProvPatro: TfrmAssocProvPatro;

implementation

uses FLerCodProvento, UMensErro, UAdmPrev, USistema;

{$R *.DFM}

procedure TfrmAssocProvPatro.AssociaProvento;
var

  sDescProvLido : string;
begin
  inherited;
  frmLerCodProvento := TfrmLerCodProvento.Create(Application);

  with frmLerCodProvento do
  begin
     frmAssocProvPatro.Update;
     MontaTelaLerCodProvento;
     lblProvento.Caption := 'Rubrica '+qryProv.FieldByName('Descricao').AsString;
     edDescProvento.Text := qryProv.FieldByName('Descricao').AsString;
     edCodProvento.Text := '';
     ShowModal;
  end;
  if (Trim(frmLerCodProvento.sCodProvento) = '') or
     (Trim(frmLerCodProvento.sDescProvento) = '')
  then begin
     frmLerCodProvento.Free;
     MsgDlg('Código da Rubrica não pode ser nulo. Rubrica não associada.','Informação',mtInformation,[mbOk,mbHelp],0);
     Exit;
  end;

  sCodProvLido := frmLerCodProvento.sCodProvento;
  sDescProvLido := frmLerCodProvento.sDescProvento;
  frmLerCodProvento.Free;

  // Verificar restrições de agrupamento de codprovdesc
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT RP.DESCRPROVDESC, P.FLGTPRUBRICA '+
                 ' FROM   RUBRICAXPESS RP, PROVDESC P'+
                 ' WHERE  RP.IDPESSOA = '+qryPatro.FieldByName('IdPESSOA').AsString+
                 ' AND    RP.CODPROVDESC = '''+sCodProvLido+''''+
                 ' AND  P.IDPROVENTO = RP.IDRUBRICA ');
  qryAux.Open;

  if not qryAux.IsEmpty
  then if MsgDlg('Existe outra rubrica com este mesmo código. Deseja agrupá-las ? ','Confirmação', mtConfirmation, [mbYes, mbNo],0) = mrNo
       then Exit; 

  // Gravar provento
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' INSERT INTO RUBRICAXPESS(IDRUBRICA,IDPESSOA,CODPROVDESC,DESCRPROVDESC) '+
                 ' VALUES('+qryProv.FieldByName('IdProvento').AsString+', '+
                            qryPatro.FieldByName('IdPESSOA').AsString+
                            ', '''+sCodProvLido+''', '''+sDescProvLido+''')');
  try
     qryAux.ExecSQL;
  except
     on E: EDBEngineError do begin
        MostrarErro(E);
        Exit;
     end;
  end;

  // Adicionando Log Padrão
  Try
    If not Sistema.GravaLogOperacoes('Associando Rubrica à Patrociandora') Then
      Raise Exception.Create('Erro ao gravar Log.');
  Except
  End;


  If Not AssociaTodos Then
    if not qryProv.Eof then
       qryProv.Next;

  IdProvento := qryProv.FieldByName('IDPROVENTO').AsString;
end; //AssociaProvento

procedure TfrmAssocProvPatro.FormActivate(Sender: TObject);
var sFiltro : string;
begin
  inherited;
  qryPatro.Close;
  qryPatro.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao;
  qryPatro.Open;
  qryPatro.First;

  case Sistema.IdModulo of
       15 : sTpRubrica := 'E';
       17 : sTpRubrica := 'A';
       18 : sTpRubrica := 'B';
       21 : sTpRubrica := 'F';
       else sTpRubrica := 'P';
  end;//case

  qryProv.Close;
  qryProv.SQL.Clear;
  qryProv.SQL.Add(' SELECT  P.IDPROVENTO, P.FLGDESCONTO, P.DESCRICAO, P.FLGTPRUBRICA, P.FLGINTERNO '+
                  ' FROM PROVDESC P                          '+
                  ' WHERE  (P.FLGTPRUBRICA  LIKE ''%'+sTpRubrica+'%'') '+
                  ' AND NOT EXISTS(SELECT PP.IDRUBRICA,PP.IDPESSOA    '+
                  '                FROM   RUBRICAXPESS PP             '+
                  '                WHERE  PP.IDPESSOA  = '+qryPatro.FieldbyName('IdPessoa').AsString+
                  '                AND    PP.IDRUBRICA = P.IDPROVENTO) '+
                  ' ORDER BY P.DESCRICAO ');
  qryProv.Open;

  qryProvPatro.Close;
  qryProvPatro.SQL.Clear;
  qryProvPatro.SQL.Add( ' SELECT PP.DESCRPROVDESC,  PP.CODPROVDESC, PP.IDRUBRICA,  '+
                        '       PP.IDPESSOA,  P.DESCRICAO,  P.FLGTPRUBRICA        '+
                        ' FROM   RUBRICAXPESS   PP, PROVDESC P                    '+
                        ' WHERE  PP.IDPESSOA  = '+qryPatro.FieldbyName('IdPessoa').AsString+
                        ' AND    (P.FLGTPRUBRICA  LIKE ''%'+sTpRubrica+'%'') '+
                        ' AND    (PP.IDRUBRICA = P.IDPROVENTO)   '+
                        ' ORDER BY PP.DESCRPROVDESC   ');
  qryProvPatro.Open;
end;

procedure TfrmAssocProvPatro.sbtnAssociaClick(Sender: TObject);
begin
  inherited;
  AssociaTodos := False;
  AssociaProvento;
  qryProv.Close;
  qryProv.Open;

  qryProvPatro.Close;
  qryProvPatro.Open;

  If sCodProvLido <> ''  then
     qryProv.Locate('IDPROVENTO',IdProvento,[loPartialKey]);
end;

procedure TfrmAssocProvPatro.sbtnAssociaTodosClick(Sender: TObject);
begin
  inherited;
  AssociaTodos := True;
  qryProv.First;
  while not qryProv.Eof do
  begin
     AssociaProvento;
     qryProv.Next;
  end; { while }
  qryProv.Close;
  qryProv.Open;

  qryProvPatro.Close;
  qryProvPatro.Open;
end;

procedure TfrmAssocProvPatro.sbtnDesassociaClick(Sender: TObject);
begin
  inherited;
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' DELETE RUBRICAXPESS '+
                 ' WHERE IDRUBRICA = '+qryProvPatro.FieldByName('IdRubrica').AsString+' AND '+
                 '       IDPESSOA  = '+qryPatro.FieldByName('IdPESSOA').AsString);
  try
     qryAux.ExecSQL;
  except
     on E: EDBEngineError do begin
        MostrarErro(E);
        Exit;
     end;
  end;

  // Adicionando Log Padrão
  Try
    If not Sistema.GravaLogOperacoes('Desassociando Rubrica à Patrociandora') Then
      Raise Exception.Create('Erro ao gravar Log.');
  Except
  End;

  qryProv.Close;
  qryProv.Open;

  qryProvPatro.Close;
  qryProvPatro.Open;
end;

procedure TfrmAssocProvPatro.sbtnDesassociaTodosClick(Sender: TObject);
begin
  inherited;
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' DELETE RUBRICAXPESS   ' +
                 ' WHERE IDPESSOA  = ' + qryProvPatro.FieldByName('IdPessoa').AsString);
  try
     qryAux.ExecSQL;
  except
     on E: EDBEngineError do begin
        MostrarErro(E);
        Exit;
     end;
  end;

  // Adicionando Log Padrão
  Try
    If not Sistema.GravaLogOperacoes('Desassociando Todas Rubricas à Patrociandora') Then
      Raise Exception.Create('Erro ao gravar Log.');
  Except
  End;

  qryProv.Close;
  qryProv.Open;

  qryProvPatro.Close;
  qryProvPatro.Open;
end;

procedure TfrmAssocProvPatro.dbgrdPlanPatroDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  inherited;
  { = Associa Click }
  { Este método é executado quando o usuario clica na lista de
    rubricas nao associados arrasta um plano e
    solta o mouse. Ao soltar o mouse, se o método DragOver deste
    objeto(dblkplistPlanPatro) retornar o Accept = True, este método
    é executado.}
  TdbLookUpListBox(Sender).EndDrag(True);
  sbtnAssociaClick(Sender);
end;

procedure TfrmAssocProvPatro.dbgrdPlanPatroDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  { Sender = grid
    Source = list ou de onde veio o drag }
  Accept := False;

  if (not qryProv.Active) or (not qryProvPatro.Active) then Exit;

  if (Source is TDBLookUpListBox)
  then
     { Se o drag não vier da lista de plano, cancelar }
     Accept := True;
end;

procedure TfrmAssocProvPatro.dbgrdPlanPatroMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Button = mbLeft
  then if Sender is TwwDBGrid
       then TwwDBGrid(Sender).BeginDrag(True);
end;

procedure TfrmAssocProvPatro.AlterarCodigoClick(Sender: TObject);
var  sDescProvLido,
     sCodProvLido : string;
     sSQL : string;
begin
  inherited;

  if ( (Sistema.IdModulo = 15) and (Pos('E',qryProvPatro.FieldByName('FLGTPRUBRICA').AsString) <= 0) ) or
     ( (Sistema.IdModulo = 17) and (Pos('A',qryProvPatro.FieldByName('FLGTPRUBRICA').AsString) <= 0) ) or
     ( (Sistema.IdModulo = 18) and (Pos('B',qryProvPatro.FieldByName('FLGTPRUBRICA').AsString) <= 0) ) or
     ( (Sistema.IdModulo = 21) and (Pos('F',qryProvPatro.FieldByName('FLGTPRUBRICA').AsString) <= 0) ) or
     ( (Sistema.IdModulo = 16) and (Pos('P',qryProvPatro.FieldByName('FLGTPRUBRICA').AsString) <= 0) )
  then begin
     MsgDlg('Esta rúbrica não pode ser alterada porque não foi cadastrada nesse módulo. ','Informação',mtInformation,[mbOk,mbHelp],0);
     Exit;
  end;

  frmLerCodProvento := TfrmLerCodProvento.Create(Application);

  with frmLerCodProvento do
  begin
     edCodProvento.Enabled := True; // Pode alterar o CODPROVDESC

     frmAssocProvPatro.Update;
     MontaTelaLerCodProvento;
     lblProvento.Caption := 'Rubrica '+qryProvPatro.FieldByName('Descricao').AsString;
     edDescProvento.Text := qryProvPatro.FieldByName('DescrProvDesc').AsString;
     edCodProvento.Text  := qryProvPatro.FieldByName('CODPROVDESC').AsString;
     ShowModal;
  end;
  if frmLerCodProvento.sCodProvento = '' then Exit;
  sCodProvLido := frmLerCodProvento.sCodProvento;
  sDescProvLido := frmLerCodProvento.sDescProvento;

  frmLerCodProvento.Free;

  sSQL := '';
  if Trim(sCodProvLido) <> ''
  then begin
     sSQL := ' CODPROVDESC = '''+sCodProvLido+'''';
     if Trim(sDescProvLido) <> ''
     then sSQL := sSQL + ', DESCRPROVDESC = '''+sDescProvLido+'''';
  end
  else begin
     if Trim(sDescProvLido) <> ''
     then sSQL := ' DESCRPROVDESC = '''+sDescProvLido+'''';
  end;

  if Trim(sSQL) = '' then Exit;

  // Gravar provento
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' UPDATE RUBRICAXPESS  SET '+sSQL+
                 ' WHERE IDPESSOA  = '+qryPatro.FieldByName('IdPESSOA').AsString+' AND '+
                 '       IDRUBRICA  = '+qryProvPatro.FieldByName('IdRubrica').AsString);

  try
     qryAux.ExecSQL;
  except
     on E: EDBEngineError do begin
        MostrarErro(E);
        Exit;
     end;
  end;

  // Adicionando Log Padrão
  Try
    If not Sistema.GravaLogOperacoes('Alterando Associação de Rubricas à Patrociandora') Then
      Raise Exception.Create('Erro ao gravar Log.');
  Except
  End;


  qryProv.Close;
  qryProv.Open;
  qryProvPatro.Close;
  qryProvPatro.Open;
end;

procedure TfrmAssocProvPatro.qryPatroAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if dbgrdPatro.SelectedRows = nil
  then qryPatro.First;

  qryProv.Close;
  qryProv.SQL.Clear;
  qryProv.SQL.Add(' SELECT  P.IDPROVENTO, P.FLGDESCONTO, P.DESCRICAO, P.FLGTPRUBRICA, P.FLGINTERNO '+
                  ' FROM PROVDESC P          '+
                  ' WHERE  (P.FLGTPRUBRICA  LIKE ''%'+sTpRubrica+'%'') '+
                  ' AND NOT EXISTS(SELECT PP.IDRUBRICA,PP.IDPESSOA    '+
                  '                FROM   RUBRICAXPESS PP             '+
                  '                WHERE  PP.IDPESSOA  = '+qryPatro.FieldbyName('IdPessoa').AsString+
                  '                AND    PP.IDRUBRICA = P.IDPROVENTO) '+
                  ' ORDER BY P.DESCRICAO ');
  qryProv.Open;

  qryProvPatro.Close;
  qryProvPatro.SQL.Clear;
  qryProvPatro.SQL.Add( ' SELECT PP.DESCRPROVDESC,  PP.CODPROVDESC, PP.IDRUBRICA,  '+
                        '       PP.IDPESSOA,  P.DESCRICAO,  P.FLGTPRUBRICA        '+
                        ' FROM   RUBRICAXPESS   PP, PROVDESC P                    '+
                        ' WHERE  PP.IDPESSOA = '+qryPatro.FieldbyName('IdPessoa').AsString+
                        ' AND    (P.FLGTPRUBRICA  LIKE ''%'+sTpRubrica+'%'') '+
                        ' AND    (PP.IDRUBRICA = P.IDPROVENTO)   '+
                        ' ORDER BY PP.DESCRPROVDESC   ');
  qryProvPatro.Open;
  sbtnAssocia.Enabled := True;
  sbtnAssociaTodos.Enabled :=  True;
  sbtnDesassocia.Enabled := True;
  sbtnDesassociaTodos.Enabled := True;

  lblPlanPatro.Caption := 'Rubricas de '+Trim(qryPatro.FieldByName('Nome').AsString);
end;

procedure TfrmAssocProvPatro.FormCreate(Sender: TObject);
begin
  inherited;
  qryProv.Prepare;
  qryProvPatro.Prepare;

  WindowState := wsMaximized;

  Caption := 'Associação de Rubricas por Patrocinadora/Fundação';
  lblNome.Caption := 'Patrocinadoras/Fundações';
end;

procedure TfrmAssocProvPatro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryProv.Close;
  qryProvPatro.Close;

  qryProv.UnPrepare;
  qryProvPatro.UnPrepare;
end;

procedure TfrmAssocProvPatro.MontaTelaLerCodProvento;
begin
  with frmLerCodProvento do begin
     case sTipoPrevidencia[1] of
     	'F' : begin
              	Caption := 'Associar Rubrica à Patrocinadora/Fundação';
              	lblPatrocinadora.Caption := 'Patrocinadora '+qryPatro.FieldByName('Nome').AsString;
              end;
	'A' : begin
        	Caption := 'Associar Rubrica à Instituidora/Averbadora';
              	lblPatrocinadora.Caption := 'Inst/Averb '+qryPatro.FieldByName('Nome').AsString;
              end;
     	'V' : begin
              	Caption := 'Associar Rubrica à Estipulante/Averbadora';
              	lblPatrocinadora.Caption := 'Estip/Averb '+qryPatro.FieldByName('Nome').AsString;
              end;
     end;
  end;
end;

procedure TfrmAssocProvPatro.rgTpRubricaClick(Sender: TObject);
begin
  inherited;
// 0-Geral                          [G]
// 1-Assistencial                   [A]
// 2-Empréstimo                     [E]
// 3-Patrocinadora                  [P]
// 4-Folha de Benefício             [B]
// 5-Folha de Pagamento Fundação    [F]

  case rgTpRubrica.ItemIndex of
       0 : sTpRubrica := 'G';
       1 : sTpRubrica := 'A';
       2 : sTpRubrica := 'E';
       3 : sTpRubrica := 'P';
       4 : sTpRubrica := 'B';
       5 : sTpRubrica := 'F';
  end;

 qryProv.Close;
  qryProv.SQL.Clear;
  qryProv.SQL.Add(' SELECT  P.IDPROVENTO, P.FLGDESCONTO, P.DESCRICAO, P.FLGTPRUBRICA, P.FLGINTERNO '+
                  ' FROM PROVDESC P           '+
                  ' WHERE  (P.FLGTPRUBRICA  LIKE ''%'+sTpRubrica+'%'') '+
                  ' AND NOT EXISTS(SELECT PP.IDRUBRICA,PP.IDPESSOA    '+
                  '                FROM   RUBRICAXPESS PP             '+
                  '                WHERE  PP.IDPESSOA  = '+qryPatro.FieldbyName('IdPessoa').AsString+
                  '                AND    PP.IDRUBRICA = P.IDPROVENTO) '+
                  ' ORDER BY P.DESCRICAO ');
  qryProv.Open;

  qryProvPatro.Close;
  qryProvPatro.SQL.Clear;
  qryProvPatro.SQL.Add( ' SELECT PP.DESCRPROVDESC,  PP.CODPROVDESC, PP.IDRUBRICA,  '+
                        '       PP.IDPESSOA,  P.DESCRICAO,  P.FLGTPRUBRICA        '+
                        ' FROM   RUBRICAXPESS   PP, PROVDESC P                    '+
                        ' WHERE  PP.IDPESSOA = '+qryPatro.FieldbyName('IdPessoa').AsString+
                        ' AND    (P.FLGTPRUBRICA  LIKE ''%'+sTpRubrica+'%'') '+
                        ' AND    (PP.IDRUBRICA = P.IDPROVENTO)   '+
                        ' ORDER BY PP.DESCRPROVDESC   ');
  qryProvPatro.Open;
end;

procedure TfrmAssocProvPatro.dbgProvDescDragDrop(Sender, Source: TObject;
  X, Y: Integer);
begin
  inherited;
  TwwDbGrid(Sender).EndDrag(True);
  sbtnDesassociaClick(Sender);
end;

procedure TfrmAssocProvPatro.dbgProvDescDragOver(Sender, Source: TObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  { Sender = list
    Source = grid ou de onde veio o drag }
  Accept := False;

  if (not qryProv.Active) or (not qryProvPatro.Active) then Exit;

  if (Source is TwwDBGrid)
  then
     { Se o drag não vier do grid, cancelar }
     Accept := True;
end;

procedure TfrmAssocProvPatro.dbgProvDescMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Sender is TDBLookUpListBox
  then TDBLookUplistBox(Sender).BeginDrag(True);
end;

procedure TfrmAssocProvPatro.btnProcProvClick(Sender: TObject);
begin
  MontaSqlProv.Filtro.Clear;
  MontaSqlProv.Filtro.Add  ('FLGTPRUBRICA LIKE ''%'+ sTpRubrica+'%''');
  MontaSqlProv.Filtro.Add  ('NOT EXISTS(SELECT PP.IDRUBRICA,PP.IDPESSOA '+
                            ' FROM RUBRICAXPESS PP '+
                            ' WHERE PP.IDPESSOA  = '+qryPatro.FieldbyName('IdPessoa').AsString+
                            ' AND PP.IDRUBRICA = IDPROVENTO)');


  MontaSqlProv.Executar;

  if (MontaSqlProv.ValoresChave.Count > 0) and (MontaSqlProv.ValoresChave[0] <> '') then
      begin
         qryProv.Close;
         qryProv.Open;
         if not qryProv.Locate('DESCRICAO',MontaSqlProv.ValoresChave[0],[loCaseInsensitive, loPartialKey])
         then ShowMessage('Não Encontrou.');
      end;
end;

procedure TfrmAssocProvPatro.btnProcRXPClick(Sender: TObject);
begin
  MontaSqlRXP.Filtro[0] := 'PP.IDPESSOA    = '+qryPatro.FieldbyName('IdPessoa').AsString;
  MontaSqlRXP.Filtro[1] := 'P.FLGTPRUBRICA LIKE ''%'+sTpRubrica+'%''';
  MontaSqlRXP.Executar;

  if (MontaSqlRXP.ValoresChave.Count > 0) and (MontaSqlRXP.ValoresChave[0] <> '') then
      begin
         qryProvPatro.Close;
         qryProvPatro.Open;
         if not qryProvPatro.Locate('DESCRPROVDESC',MontaSqlRXP.ValoresChave[0],[loCaseInsensitive, loPartialKey])
         then ShowMessage('Não Encontrou.');
      end;
end;

end.
