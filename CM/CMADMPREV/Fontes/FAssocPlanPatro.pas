// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 16/08/2007
// Rotina      : IncluiTabelas
// Pendencia   : 19962
// Alteração   : Troca do DateToStr para FormatDateTime.
//------------------------------------------------------------------------------
// Autor(a)    : André Pontes
// Data        : 20/10/2006
// Rotina      : GravaReservasPatro
// Pendencia   : 23563
// Alteração   : Gravação do campo IDPARTICIPANTE no insert na ReservaPart
//------------------------------------------------------------------------------
// Autor  : Leo
// Data   : 05/06/2002
// Motivo : acrescentei o tratmento para o campo flgtodasrubmanut
// -----------------------------------------------------------------------------
unit FAssocPlanPatro;

//Definição Propprodutor

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FTelaAut, StdCtrls, Buttons, MAHlpBtn, ExtCtrls, DBCtrls, Db, Wwdatsrc,
  DBTables, Wwquery, Grids, DBGrids, Wwdbigrd, Wwdbgrid, Menus, FSairAjuda,
  TB97, TB97Tlbr, IvDictio, IvMulti, IvEMulti;

type
  TfrmAssocPlanPatro = class(TfrmSairAjuda)
    Panel4: TPanel;
    lbPatro: TLabel;
    qryPatro: TwwQuery;
    dsPatro: TwwDataSource;
    dsPlanPatro: TwwDataSource;
    qryPlanPatro: TwwQuery;
    qryPlano: TwwQuery;
    dsPlano: TwwDataSource;
    qryAux: TwwQuery;
    dbgrdPatro: TDBGrid;
    pmenu: TPopupMenu;
    AtivarPlano1: TMenuItem;
    DesativarPlano1: TMenuItem;
    qryContPrev: TwwQuery;
    Panel5: TPanel;
    lbPlanoNao: TLabel;
    sbtnAssocia: TSpeedButton;
    sbtnAssociaTodos: TSpeedButton;
    sbtnDesassocia: TSpeedButton;
    sbtnDesassociaTodos: TSpeedButton;
    lblPlanPatro: TLabel;
    dblkplistPlano: TDBLookupListBox;
    dbgrdPlanPatro: TwwDBGrid;
    mnuAlterarRegras: TMenuItem;
    qryAux2: TwwQuery;
    procedure sbtnDesassociaClick(Sender: TObject);
    procedure sbtnAssociaClick(Sender: TObject);
    procedure sbtnDesassociaTodosClick(Sender: TObject);
    procedure dblkplistPlanoMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure dblkplistPlanoDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure dblkplistPlanoDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure sbtnAssociaTodosClick(Sender: TObject);
    procedure dbgrdPlanPatroCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure DesativarPlano1Click(Sender: TObject);
    procedure AtivarPlano1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgrdPlanPatroMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure dbgrdPlanPatroDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure dbgrdPlanPatroDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure qryPatroAfterScroll(DataSet: TDataSet);
    procedure mnuAlterarRegrasClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    sNomePatro : string;

    procedure IncluiTabelas;
    procedure DeletaTabelas(aPlano:String);
    procedure GravaReservasPatro;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAssocPlanPatro: TfrmAssocPlanPatro;

implementation

uses
    UMensErro, FLerRegrasPlano, UAdmPrev, UContribuicaoPrev, Usistema;

{$R *.DFM}

procedure TfrmAssocPlanPatro.sbtnDesassociaClick(Sender: TObject);
begin
  inherited;
  { Verificar se existe algum participante neste plano }
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT COUNT(IDPESSOA) as numParticip FROM PARTPREVPLAN '+
                 ' WHERE IDPLANOPREV = '+qryPlanPatro.FieldByName('IdPlanoPrev').AsString+' AND '+
                 '       IDPESSJUR = '+qryPatro.FieldByName('IdPESSOA').AsString);
  qryAux.Open;
  if (not qryAux.IsEmpty) and (qryAux.FieldByName('NumParticip').AsInteger > 0)
  then begin
     MsgDlg('Existe(m) '+qryAux.FieldByName('NumParticip').AsString+
            ' Participante(s) inscrito(s) neste Plano','Erro',mtError,[mbOk,mbHelp],0);
     qryAux.Close;
     Exit;
  end;

  DeletaTabelas(qryPlanPatro.FieldByName('IDPLANOPREV').AsString);

  qryPlano.Close;
  qryPlano.ParamByName('IdPessoa').AsInteger := qryPatro.FieldbyName('IdPessoa').AsInteger;
  qryPlano.Open;

  qryPlanPatro.Close;
  qryPlanPatro.ParamByName('IdPessoa').AsInteger := qryPatro.FieldbyName('IdPessoa').AsInteger;
  qryPlanPatro.Open;

    
    // Adicionando Log Padrao
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption+ ' - Desassociando Plano') Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

end;

procedure TfrmAssocPlanPatro.sbtnAssociaClick(Sender: TObject);
var
  sSql : String;
begin
  inherited;
  with frmLerRegrasPlano do
  begin
    lblPlano.Caption :=  'Plano '+  qryPlanPatro.FieldByName('NOME').AsString;
    lblPatrocinadora.caption  := 'Patrocinadora  ' + qryPatro.FieldByName('NOME').AsString;

    ShowModal;
    if bBotaoOk = False then exit;
  end;

  sSql := qryPlano.FieldByName('IDPLANOPREV').AsString;
  sSql := sSql + ','+qryPatro.FieldByName('IDPESSOA').AsString;
  sSql := sSql + ', 1';
  sSql := sSql + ','+frmLerRegrasPlano.sRegraManutencao;
  sSql := sSql + ','+frmLerRegrasPlano.sRegraManutencaoParcial;
  sSql := sSql + ','+frmLerRegrasPlano.sRegraValidaAfast;
  sSql := sSql + ','+frmLerRegrasPlano.sRegraTempoContrib;
  sSql := sSql + ','+frmLerRegrasPlano.sRegraElegAfast;
  sSql := sSql + ','+frmLerRegrasPlano.sNumContrato;
  sSql := sSql + ','+frmLerRegrasPlano.sRegraCalcSalManut;
  sSql := sSql + ','+frmLerRegrasPlano.sRegraCalcSalManutParc;

  


  if Trim(frmLerRegrasPlano.sDataInsc) <> ''
  then sSQL := sSQL +', To_Date('''+frmLerRegrasPlano.sDataInsc+''',''dd/mm/yyyy'')'
  else sSQL := sSQL +', NULL';



  if frmLerRegrasPlano.rgrpReceContrib.ItemIndex = 0 // 0 - SIM 1 - NAO
  then sSql := sSql + ', 1'
  else sSql := sSql + ', 0';


  If not frmLerRegrasPlano.ckRecalcMP.Checked
  then sSql := sSql + ', 0'
  else  sSql := sSql + ', 1';

  sSql := sSql + ','+frmLerRegrasPlano.sCalendario;

  sSql := sSql + ','+frmLerRegrasPlano.sRegraAuxDoenca;
  sSql := sSql + ','+frmLerRegrasPlano.sRegraEnquadramento;

  
  If not frmLerRegrasPlano.chkGravaTodasRubManut.Checked
  then sSql := sSql + ', 0'
  else  sSql := sSql + ', 1';


  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.SQL.Add(' INSERT INTO PLANPREVPATRO(IDPLANOPREV, IDPESSJUR, FLGATIVO, IDREGRAMANUTENCAO, ' +
                 '             IDREGRAMANUTPARC, IDREGRAVALIDAAFA, IDREGRATEMPOCONT, IDRGELEGAFAST, '+
                 '             NUMCONTRATO, '+
                 '             IDRGSALMANUT,IDRGSALMANUTPART, DATAINSC,FLGRECECONTPATRO , FLGRECALCMP, ' +
                 '             IDCALENDARIO, IDREGRASALAUXDOE, IDRGENQUADRAMENTO, FLGTODASRUBMANUT)'+
                 ' VALUES(' + sSql+')');
  try
     qryAux.ExecSQL;
  except
     on E: EDBEngineError do begin
        MostrarErro(E);
        Exit;
     end;
  end;

  // Gravar reservas coletivas do plano para esta patrocinadora
  GravaReservasPatro;

  //Inclui ContribPrevPatro, ContPlanPatro e BenefPlanPatro
  IncluiTabelas;

  qryPlano.Close;
  qryPlano.ParamByName('IdPessoa').AsInteger := qryPatro.FieldbyName('IdPessoa').AsInteger;
  qryPlano.Open;

  qryPlanPatro.Close;
  qryPlanPatro.ParamByName('IdPessoa').AsInteger := qryPatro.FieldbyName('IdPessoa').AsInteger;
  qryPlanPatro.Open;

    
    // Adicionando Log Padrao
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption+ ' - Associando Plano') Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

end;

procedure TfrmAssocPlanPatro.sbtnDesassociaTodosClick(Sender: TObject);
begin
  inherited;
  { Verificar se existe algum participante neste plano }
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT COUNT(IDPESSOA) as numParticip FROM PARTPREVPLAN '+
                 ' WHERE IDPESSJUR = '+qryPatro.FieldByName('IdPESSOA').AsString);
  qryAux.Open;
  if (not qryAux.IsEmpty) and (qryAux.FieldByName('NumParticip').AsInteger > 0)
  then begin
     MsgDlg('Existe(m) '+qryAux.FieldByName('NumParticip').AsString+
            ' Participante(s) inscrito(s) em um destes Planos','Erro',mtError,[mbOk,mbHelp],0);
     qryAux.Close;
     Exit;
  end;

  DeletaTabelas('');

  qryPlano.Close;
  qryPlano.ParamByName('IdPessoa').AsInteger := qryPatro.FieldbyName('IdPessoa').AsInteger;
  qryPlano.Open;

  qryPlanPatro.Close;
  qryPlanPatro.ParamByName('IdPessoa').AsInteger := qryPatro.FieldbyName('IdPessoa').AsInteger;
  qryPlanPatro.Open;

    
    // Adicionando Log Padrao
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption+ ' - Desassociando Planos') Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

end;

procedure TfrmAssocPlanPatro.sbtnAssociaTodosClick(Sender: TObject);
var
  sSql : String;
begin
  inherited;
  qryPlano.First;
  while not qryPlano.Eof do
  begin
     with frmLerRegrasPlano do
     begin

      lblPlano.Caption :=  'Plano '+  qryPlanPatro.FieldByName('NOME').AsString;
      lblPatrocinadora.caption  := 'Patrocinadora  ' + qryPatro.FieldByName('NOME').AsString;

         ShowModal;
         if bBotaoOk = False then
            begin
                 qryPlano.Close;
                 qryPlano.ParamByName('IdPessoa').AsInteger := qryPatro.FieldbyName('IdPessoa').AsInteger;
                 qryPlano.Open;

                 qryPlanPatro.Close;
                 qryPlanPatro.ParamByName('IdPessoa').AsInteger := qryPatro.FieldbyName('IdPessoa').AsInteger;
                 qryPlanPatro.Open;

                 exit;
            end;
     end;

     sSql := qryPlano.FieldByName('IDPLANOPREV').AsString;
     sSql := sSql + ','+qryPatro.FieldByName('IDPESSOA').AsString;
     sSql := sSql + ', 1';
     sSql := sSql + ','+frmLerRegrasPlano.sRegraManutencao;
     sSql := sSql + ','+frmLerRegrasPlano.sRegraManutencaoParcial;
     sSql := sSql + ','+frmLerRegrasPlano.sRegraValidaAfast;
     sSql := sSql + ','+frmLerRegrasPlano.sRegraTempoContrib;
     sSql := sSql + ','+frmLerRegrasPlano.sRegraElegAfast;
     sSql := sSql + ','+frmLerRegrasPlano.sNumContrato;
     sSql := sSql + ','+frmLerRegrasPlano.sRegraCalcSalManut;
     sSql := sSql + ','+frmLerRegrasPlano.sRegraCalcSalManutParc;
     sSql := sSql + ','+frmLerRegrasPlano.sRegraManutSaldo;

  if Trim(frmLerRegrasPlano.sDataInsc) <> ''
  then sSQL := sSQL +', To_Date('''+frmLerRegrasPlano.sDataInsc+''',''dd/mm/yyyy'')'
  else sSQL := sSQL +', NULL';


  if frmLerRegrasPlano.rgrpReceContrib.ItemIndex = 0 // 0 - SIM 1 - NAO
  then sSql := sSql + ', 1'
  else sSql := sSql + ', 0';

  sSql := sSql + ','+frmLerRegrasPlano.sCalendario;
  sSql := sSql + ','+frmLerRegrasPlano.sRegraAuxDoenca;
  sSql := sSql + ','+frmLerRegrasPlano.sRegraEnquadramento;

     qryAux.Close;
     qryAux.Sql.Clear;
     qryAux.SQL.Add(' INSERT INTO PLANPREVPATRO(IDPLANOPREV,IDPESSJUR,FLGATIVO,IDREGRAMANUTENCAO, ' +
                    '             IDREGRAMANUTPARC, IDREGRAVALIDAAFA, IDREGRATEMPOCONT, IDRGELEGAFAST , '+
                    '             NUMCONTRATO, '+
                    '             IDRGSALMANUT,     IDRGSALMANUTPART, IDREGRAMANUTSALD, DATAINSC,  '+
                    '             FLGRECECONTPATRO , IDCALENDARIO, IDREGRASALAUXDOE, IDRGENQUADRAMENTO)'+
                    ' VALUES(' + sSql+')');
     try
        qryAux.ExecSQL;
     except
        on E: EDBEngineError do begin
           MostrarErro(E);
           Exit;
        end;
     end;

     GravaReservasPatro;

     
     IncluiTabelas;

     qryPlano.Next;
  end; { while }

  qryPlano.Close;
  qryPlano.ParamByName('IdPessoa').AsInteger := qryPatro.FieldbyName('IdPessoa').AsInteger;
  qryPlano.Open;

  qryPlanPatro.Close;
  qryPlanPatro.ParamByName('IdPessoa').AsInteger := qryPatro.FieldbyName('IdPessoa').AsInteger;
  qryPlanPatro.Open;

    
    // Adicionando Log Padrao
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption+ ' - Associando Planos') Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

end;

procedure TfrmAssocPlanPatro.dbgrdPlanPatroCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  { se o plano for inativo, exibir seu nome em vermelho }
  if qryPlanPatro.FieldByName('flgAtivo').AsString = '0'
  then AFont.Color := clRed
  else AFont.Color := clWindowText;
  ABrush.Color := clWindow;
end;

procedure TfrmAssocPlanPatro.DesativarPlano1Click(Sender: TObject);
begin
  inherited;
  { Se plano já estiver desativado, sair }
  if qryPlanPatro.fieldByName('flgAtivo').AsString = '0'
  then exit;

  { senao, desativar plano, ou seja, colocar flgativo = 0 }
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' UPDATE PLANPREVPATRO SET FLGATIVO = 0 '+
                 ' WHERE IDPLANOPREV = '+qryPlanPatro.FieldByName('IdPlanoPrev').AsString+' AND '+
                 '       IDPESSJUR = '+qryPatro.FieldByName('IDPESSOA').AsString);
  try
     qryAux.ExecSQL;
  except
     on E: EDBEngineError do begin
        MostrarErro(E);
        Exit;
     end;
  end;

  qryPlano.Close;
  qryPlano.ParamByName('IdPessoa').AsInteger := qryPatro.FieldbyName('IdPessoa').AsInteger;
  qryPlano.Open;

  qryPlanPatro.Close;
  qryPlanPatro.ParamByName('IdPessoa').AsInteger := qryPatro.FieldbyName('IdPessoa').AsInteger;
  qryPlanPatro.Open;
end;

procedure TfrmAssocPlanPatro.AtivarPlano1Click(Sender: TObject);
begin
  inherited;
  { Se plano já estiver ativado, sair }
  if qryPlanPatro.fieldByName('flgAtivo').AsString = '1'
  then exit;

  { senao, ativar plano, ou seja, colocar flgativo = 1 }
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' UPDATE PLANPREVPATRO SET FLGATIVO = 1 '+
                 ' WHERE IDPLANOPREV = '+qryPlanPatro.FieldByName('IdPlanoPrev').AsString+' AND '+
                 '       IDPESSJUR = '+qryPatro.FieldByName('IDPESSOA').AsString);
  try
     qryAux.ExecSQL;
  except
     on E: EDBEngineError do begin
        MostrarErro(E);
        Exit;
     end;
  end;

  qryPlano.Close;
  qryPlano.ParamByName('IdPessoa').AsInteger := qryPatro.FieldbyName('IdPessoa').AsInteger;
  qryPlano.Open;

  qryPlanPatro.Close;
  qryPlanPatro.ParamByName('IdPessoa').AsInteger := qryPatro.FieldbyName('IdPessoa').AsInteger;
  qryPlanPatro.Open;
end;

procedure TfrmAssocPlanPatro.FormActivate(Sender: TObject);
begin
  inherited;
  qryPatro.Close;
  qryPatro.SQL.Clear;

  qryPatro.SQL.Add(' SELECT P.IDPESSOA, P.NOME AS NOME ,P.RAZAOSOCIAL '+
                   ' FROM   PESSOA P, PATRO PP                        '+
                   ' WHERE  PP.IDPESSOA = P.IDPESSOA                  '+
                   ' AND    PP.IDFUNDACAO = '+IntToStr(iIdFundacao)  );

  qryPatro.Open;
  sNomePatro := qryPatro.fieldByName('NOME').AsString;
  qryPatro.First;

  qryPlano.Close;
  qryPlano.ParamByName('IdPessoa').AsInteger := qryPatro.FieldbyName('IdPessoa').AsInteger;
  qryPlano.Open;

  qryPlanPatro.Close;
  qryPlanPatro.ParamByName('IdPessoa').AsInteger := qryPatro.FieldbyName('IdPessoa').AsInteger;
  qryPlanPatro.Open;

  frmLerRegrasPlano.bAlteraRegras := False;
end;

{ ***************************************************************** }
{ Métodos para implementar o Drag da Lista de Planos nao associados }
{ ***************************************************************** }
procedure TfrmAssocPlanPatro.dblkplistPlanoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Sender is TDBLookUpListBox
  then TDBLookUplistBox(Sender).BeginDrag(True);
end;

procedure TfrmAssocPlanPatro.dblkplistPlanoDragDrop(Sender,
  Source: TObject; X, Y: Integer);
begin
  inherited;
  { Este método é executado quando o usuario clica na lista de
    Planos JA associados (dblkplistPlano), arrasta um plano e
    solta o mouse. Ao soltar o mouse, se o método DragOver deste
    objeto retornar o Accept = True, este método é executado. }

  TwwDbGrid(Sender).EndDrag(True);
  sbtnDesassociaClick(Sender);
end;

procedure TfrmAssocPlanPatro.dblkplistPlanoDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  { Sender = list
    Source = gridou de onde veio o drag }
  Accept := False;

  if (not qryPlano.Active) or (not qryPlanPatro.Active) then Exit;

  if (Source is TwwDBGrid)
  then
     { Se o drag não vier do grid, cancelar }
     Accept := True;
end;
{ ***************************************************************** }
{ Métodos para implementar o Drag da Lista de Planos JA associados }
{ ***************************************************************** }

procedure TfrmAssocPlanPatro.dbgrdPlanPatroMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Button = mbLeft
  then if Sender is TwwDBGrid
       then TwwDBGrid(Sender).BeginDrag(True);
end;

procedure TfrmAssocPlanPatro.dbgrdPlanPatroDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  { Sender = grid
    Source = list ou de onde veio o drag }
  Accept := False;

  if (not qryPlano.Active) or (not qryPlanPatro.Active) then Exit;

  if (Source is TDBLookUpListBox)
  then
     { Se o drag não vier da lista de plano, cancelar }
     Accept := True;
end;

procedure TfrmAssocPlanPatro.dbgrdPlanPatroDragDrop(Sender,
  Source: TObject; X, Y: Integer);
begin
  inherited;
  { = Associa Click }
  { Este método é executado quando o usuario clica na lista de
    Planos nao associados (dblkplistPlano), arrasta um plano e
    solta o mouse. Ao soltar o mouse, se o método DragOver deste
    objeto(dblkplistPlanPatro) retornar o Accept = True, este método
    é executado.}
  TdbLookUpListBox(Sender).EndDrag(True);
  sbtnAssociaClick(Sender);
end;

procedure TfrmAssocPlanPatro.qryPatroAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if dbgrdPatro.SelectedRows = nil
  then qryPatro.First;

  qryPlano.Close;
  qryPlano.ParamByName('IdPessoa').AsInteger := qryPatro.FieldbyName('IdPessoa').AsInteger;
  qryPlano.Open;

  qryPlanPatro.Close;
  qryPlanPatro.ParamByName('IdPessoa').AsInteger := qryPatro.FieldbyName('IdPessoa').AsInteger;
  qryPlanPatro.Open;

  lblPlanPatro.Caption := 'Planos Previdenciários da Patrocinadora '+Trim(qryPatro.FieldByName('Nome').AsString);
end;

procedure TfrmAssocPlanPatro.mnuAlterarRegrasClick(Sender: TObject);
var
  sSql : String;
begin
  inherited;
  with frmLerRegrasPlano do
  begin
      bAlteraRegras := True;

      lblPlano.Caption :=  'Plano '+  qryPlanPatro.FieldByName('NOME').AsString;
      lblPatrocinadora.caption  := 'Patrocinadora  ' + qryPatro.FieldByName('NOME').AsString;
      
      ShowModal;
      if bBotaoOk = False then
         begin
              bAlteraRegras := False;
              exit;
         end;
  end;

  sSql :=          'IDREGRAMANUTENCAO    = ' + frmLerRegrasPlano.sRegraManutencao;
  sSql := sSql + ', IDREGRAMANUTPARC     = ' + frmLerRegrasPlano.sRegraManutencaoParcial;
  sSql := sSql + ', IDREGRASALAUXDOE     = ' + frmLerRegrasPlano.sRegraAuxDoenca;
  sSql := sSql + ', IDRGENQUADRAMENTO    = ' + frmLerRegrasPlano.sRegraEnquadramento;
  sSql := sSql + ', NUMCONTRATO          = ' + frmLerRegrasPlano.sNumContrato;
  sSql := sSql + ', IDREGRAVALIDAAFA     = ' + frmLerRegrasPlano.sRegraValidaAfast;
  sSql := sSql + ', IDREGRATEMPOCONT     = ' + frmLerRegrasPlano.sRegraTempoContrib;
  sSql := sSql + ', IDRGELEGAFAST        = ' + frmLerRegrasPlano.sRegraElegAfast;

  if Trim(frmLerRegrasPlano.sDataInsc) <> ''
  then sSQL := sSQL +', DATAINSC = To_Date('''+frmLerRegrasPlano.sDataInsc+''',''dd/mm/yyyy'')'
  else sSQL := sSQL +', DATAINSC = NULL';

  sSql := sSql + ', IDRGSALMANUT        = '+frmLerRegrasPlano.sRegraCalcSalManut;
  sSql := sSql + ', IDRGSALMANUTPART    = '+frmLerRegrasPlano.sRegraCalcSalManutParc;
  sSql := sSql + ', IDREGRAMANUTSALD    = '+frmLerRegrasPlano.sRegraManutSaldo;


  if frmLerRegrasPlano.rgrpReceContrib.ItemIndex = 0 // 0 - SIM 1 - NAO
  then sSql := sSql + ', FLGRECECONTPATRO = 1'
  else sSql := sSql + ', FLGRECECONTPATRO = 0';


  if frmLerRegrasPlano.ckUsarRubricas.Checked
  then sSql := sSql + ', FLGUSARUBRICA = 1'
  else sSql := sSql + ', FLGUSARUBRICA = 0';

  if frmLerRegrasPlano.ckRecalcMP.Checked
  then sSql := sSql + ', FLGRECALCMP = 1'
  else sSql := sSql + ', FLGRECALCMP = 0';
  sSql := sSql + ', IDCALENDARIO    = '+frmLerRegrasPlano.sCalendario;

  if frmLerRegrasPlano.chkGravaTodasRubManut.Checked
  then sSql := sSql + ', FLGTODASRUBMANUT = 1'
  else sSql := sSql + ', FLGTODASRUBMANUT = 0';

  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.SQL.Add(' UPDATE PLANPREVPATRO ');
  qryAux.Sql.Add(' SET '+sSql);
  qryAux.Sql.Add(' WHERE  IDPESSJUR   = :IDPESSJUR   ');
  qryAux.Sql.Add(' AND    IDPLANOPREV = :IDPLANOPREV ');
  qryAux.ParamByName('IDPESSJUR').AsString   := qryPatro.FieldByName('IDPESSOA').AsString;
  qryAux.ParamByName('IDPLANOPREV').AsString := qryPlanPatro.FieldByName('IDPLANOPREV').AsString;
  try
     qryAux.ExecSQL;
  except
     on E: EDBEngineError do begin
        MostrarErro(E);
        Exit;
     end;
  end;

  qryPlano.Close;
  qryPlano.ParamByName('IdPessoa').AsInteger := qryPatro.FieldbyName('IdPessoa').AsInteger;
  qryPlano.Open;

  qryPlanPatro.Close;
  qryPlanPatro.ParamByName('IdPessoa').AsInteger := qryPatro.FieldbyName('IdPessoa').AsInteger;
  qryPlanPatro.Open;

  frmLerRegrasPlano.bAlteraRegras := False;
end;

procedure TfrmAssocPlanPatro.FormCreate(Sender: TObject);
begin
  inherited;
  Caption            := 'Associação de Plano Previdenciário por Patrocinadora';
  lbPatro.Caption    := 'Patrocinadoras';
  lbPlanoNao.Caption := 'Planos Previdenciários não Associados';

  qryPlanPatro.Sql.Clear;
  qryPlanPatro.Sql.Add(' SELECT PP.*, PL.NOME                 '+
                       ' FROM   PLANPREVPATRO PP, PLANPREV PL '+
                       ' WHERE  PP.IDPESSJUR = :IDPESSOA      '+
                       ' AND    PP.IDPLANOPREV  = PL.IDPLANOPREV '+
                       ' ORDER BY PL.NOME ');

  qryPlano.Sql.Clear;
  qryPlano.Sql.Add(' SELECT  PL.*     '+
                   ' FROM PLANPREV PL '+
                   ' WHERE NOT EXISTS( SELECT PP.IDPLANOPREV                   '+
                   '                   FROM   PLANPREVPATRO PP                 '+
                   '                   WHERE  PP.IDPESSJUR   = :IDPESSOA       '+
        	          '                   AND    PP.IDPLANOPREV = PL.IDPLANOPREV) '+
                   ' ORDER BY PL.NOME ');
end;


procedure TfrmAssocPlanPatro.IncluiTabelas;
var sDataInicio,
    sDataFinal,
    sQtdeParcelas,
    sPeriodicidade : string;
begin

  qryContPrev.Close;
  qryContPrev.ParamByName('iIdPlanoPrev').AsInteger := qryPlano.FieldByName('IDPLANOPREV').AsInteger;
  qryContPrev.Open;
  qryContPrev.First;
  while not qryContPrev.EOF do
  begin
     if qryContPrev.FieldbyName('flgpagador').AsString = 'E'
     then begin
        // Calcular data de inicio e data final da contribuicao
        sDataInicio := frmLerRegrasPlano.sDataInsc;

        
        
        if sDataInicio = '' then sDataInicio := FormatDateTime('dd/mm/yyyy', Date);
        

        sDataFinal := CalcDataFinal(StrToDate(sDataInicio),
                                    qryContPrev.FieldByName('QtdeParcelas').AsString,
                                    qryContPrev.FieldByName('QtdeMeses').AsString);

        if sDataFinal = ''
        then begin
           sDataFinal := ' NULL ';
           sQtdeParcelas := ' NULL ';
        end
        else begin
           // Verificar se data final foi calculada sem erro
           try
              StrToDate(sDataFinal);
              sDataFinal := ' TO_DATE('''+sDataFinal+''', ''dd/mm/yyyy'') ';
              sQtdeParcelas := qryContPrev.FieldByName('QtdeParcelas').AsString;
           except
              sDataFinal := ' NULL ';
              sQtdeParcelas := ' NULL ';
           end;
        end;

        try
           StrToDate(sDataInicio);
           sDataInicio := ' TO_DATE('''+sDataInicio+''', ''dd/mm/yyyy'') ';
        except
           sDataInicio := ' NULL ';
        end;

        if qryContPrev.FieldByName('IDTPPERIODICIDADE').AsString = ''
        then sPeriodicidade := ' NULL '
        else sPeriodicidade := qryContPrev.FieldByName('IDTPPERIODICIDADE').AsString;
        
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(' INSERT INTO CONTRIBPREVPATRO(IDPESSOA,IDPLANOPREV,IDCONTRIBUICAO,FLGCOBRA,DATAINICIO,DATAFINAL,QTDEPARCELAS,IDTPPERIODICIDADE) ' +
                       ' VALUES(' + qryPatro.FieldByName('IDPESSOA').AsString + ',' +
                                    qryContPrev.FieldByName('IDPLANOPREV').AsString + ',' +
                                    qryContPrev.FieldByName('IDCONTRIBUICAO').AsString +', '+
                                    '1,'+
                                    sDataInicio+', '+
                                    sDataFinal+',  '+
                                    sQtdeParcelas+', '+
                                    sPeriodicidade+')');
        try
           qryAux.ExecSQL;
        except
           on E: EDBEngineError do
           begin
                MostrarErro(E);
                Exit;
           end;
        end;
     end;

     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' INSERT INTO CONTPLANPATRO(IDPESSJUR,IDPLANOPREV,IDCONTRIBUICAO) ' +
                    ' VALUES(' + qryPatro.FieldByName('IDPESSOA').AsString + ',' +
                                 qryContPrev.FieldByName('IDPLANOPREV').AsString + ',' +
                                 qryContPrev.FieldByName('IDCONTRIBUICAO').AsString + ')');
     try
        qryAux.ExecSQL;
     except
        on E: EDBEngineError do
        begin
             MostrarErro(E);
             Exit;
        end;
     end;
     qryContPrev.Next;
  end; // WHILE
/// {Fim - Inclui todas as contribuicoes do plano selecionado em CONTRIBPREVPATRO}
//Inclui Benefícios
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' INSERT INTO BENEFPLANPATRO(IDPESSJUR,IDPLANOPREV,IDBENEFICIO) ' +
                 ' SELECT '+qryPatro.FieldByName('IDPESSOA').AsString + ',' +
                            qryPlano.FieldByName('IDPLANOPREV').AsString + ',' +
                 '        IDBENEFICIO '+
                 ' FROM BENEFPLANPREV '+
                 ' WHERE IDPLANOPREV =  '+qryPlano.FieldByName('IDPLANOPREV').AsString);

  try
    qryAux.ExecSQL;
  except
    on E: EDBEngineError do
       begin
          MostrarErro(E);
          Exit;
       end;
    end;

  qryAux.Close;
end;

procedure TfrmAssocPlanPatro.DeletaTabelas(aPlano:String);
var
  sSql : String;
begin
/// {Apaga todas as contribuiçoes de todos os planos em CONTRIBPREVPATRO}
  sSql := 'DELETE FROM CONTRIBPREVPATRO WHERE IDPESSOA = '+ qryPatro.FieldByName('IDPESSOA').AsString;
  if aPlano <> '' then
     sSql := sSql + ' AND IDPLANOPREV = '+ aPlano;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(sSql);

  try
     qryAux.ExecSQL;
  except
     on E: EDBEngineError do begin
        MostrarErro(E);
        Exit;
     end;
  end;

/// {Apaga todas as contribuiçoes de todos os planos em CONTPLANPATRO}
  sSql := 'DELETE FROM CONTPLANPATRO WHERE IDPESSJUR = '+ qryPatro.FieldByName('IDPESSOA').AsString;
  if aPlano <> '' then
     sSql := sSql + ' AND IDPLANOPREV = '+ aPlano;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(sSql);

  try
     qryAux.ExecSQL;
  except
     on E: EDBEngineError do begin
        MostrarErro(E);
        Exit;
     end;
  end;

// Apagar PropProdutor ????

  sSql := 'DELETE FROM BENEFPLANPATRO WHERE IDPESSJUR = '+ qryPatro.FieldByName('IDPESSOA').AsString;
  if aPlano <> '' then
     sSql := sSql + ' AND IDPLANOPREV = '+ aPlano;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(sSql);

  try
     qryAux.ExecSQL;
  except
     on E: EDBEngineError do begin
        MostrarErro(E);
        Exit;
     end;
  end;


//DELETA RESERVAPART
  sSql := 'DELETE FROM RESERVAPART WHERE IDPESSOA = ' + qryPatro.FieldByName('IDPESSOA').AsString;
  if aPlano <> '' then
     sSql := sSql + ' AND IDPLANOPREV = '+ aPlano;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(sSql);

  try
     qryAux.ExecSQL;
  except
     on E:EDBEngineError do
        begin
             MostrarErro(E);
             Exit;
        end;
  end;


//DELETA PLANPREVPATRO
  sSql := 'DELETE FROM PLANPREVPATRO WHERE IDPESSJUR = '+ qryPatro.FieldByName('IDPESSOA').AsString;
  if aPlano <> '' then
     sSql := sSql + ' AND IDPLANOPREV = '+ aPlano;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(sSql);

  try
     qryAux.ExecSQL;
  except
     on E: EDBEngineError do begin
        MostrarErro(E);
        Exit;
     end;
  end;

  qryAux.Close;
end;

procedure TfrmAssocPlanPatro.GravaReservasPatro;
begin
 {Filtra todas as Reservas do Plano da Patrocinadora}
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT IDTIPORESERVA FROM RESERVAXPLANO ' +
                 ' WHERE IDPLANOPREV = ' + qryPlano.FieldByName('IDPLANOPREV').AsString + ' AND ' +
                 '       ANALITICOSINTETI = ' + '''A''' + ' AND ' +
                 '       FLGCOLETIVA = 1 ');
  qryAux.Open;
  qryAux.First;
  while not qryAux.EOF do
     begin
         {Verifica se as Reservas da Patrocinadora ainda não foram gravadas}
          qryAux2.Close;
          qryAux2.Sql.Clear;
          qryAux2.Sql.Add(' SELECT IDTIPORESERVA FROM RESERVAPART ' +
                          ' WHERE IDTIPORESERVA = ' + qryAux.FieldbyName('IDTIPORESERVA').AsString + ' AND ' +
                          '       IDPESSOA      = ' + qryPatro.FieldByName('IDPESSOA').AsString    + ' AND ' +
                          '       IDPLANOPREV   = ' + qryPlano.FieldByName('IDPLANOPREV').AsString + ' AND ' +
                          '       IDPESSJUR     = ' + qryPatro.FieldByName('IDPESSOA').AsString);
          qryAux2.Open;
          if qryAux2.IsEmpty then
             begin
                 {Grava as Reservas da Patrocinadora}
                  qryAux2.Close;
                  qryAux2.Sql.Clear;
                  qryAux2.Sql.Add(' INSERT INTO RESERVAPART (IDTIPORESERVA, IDPLANOPREV, IDPESSJUR, IDPESSOA, SEQPROPOSTA, ' +
                                                            'IDPARTICIPANTE) '+  
                                  ' VALUES( ' + qryAux.FieldbyName('IDTIPORESERVA').AsString  + ',' +
                                                qryPlano.FieldbyName('IDPLANOPREV').AsString  + ',' +
                                                qryPatro.FieldByName('IDPESSOA').AsString     + ',' +
                                                qryPatro.FieldByName('IDPESSOA').AsString     + ',' +
                                                '1' +
                                                qryPatro.FieldByName('IDPESSOA').AsString     + ')'); 
                  try
                     qryAux2.ExecSQL;
                  except
                     on E:EDBEngineError do
                        begin
                             MostrarErro(E);
                             Exit;
                        end;
                  end;
             end;

          qryAux.Next;
     end;
end;

end.










