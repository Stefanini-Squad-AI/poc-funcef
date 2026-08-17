unit uConfigNFDevol;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, uGimp,
  wwQuery, uExtensoCM, uFuncaoGeral;
Const
   MaxCampos = 34;
Type
   TBeforePrintLinhas = procedure (var CodProduto, DescProduto, UnidMedida :String; var Quantidade, ValorUnit, ValorTotal, ICMS, IPI, ValorIPI : Double; var CanPrint: Boolean; iItemDet: Integer) of object;
Type
  TConfigNfDevol = class(TComponent)
  private
    FInscEstadual: String;
    FNaturezaOp: String;
    FBaseICMSSubst: String;
    FBairro: String;
    FDataEntSai: String;
    FCEP: String;
    FValorTotProduto: String;
    FCGC_Cpf: String;
    FValorTotNota: String;
    FDescProduto: String;
    FQuantidade: String;
    FIndEntSai: String;
    FValorUnit: String;
    FRazaoSocial: String;
    FCodProduto: String;
    FCFOP: String;
    FOutrasDesp: String;
    FValorSeguro: String;
    FUnidMedida: String;
    FFone_Fax: String;
    FValorICMS: String;
    FUF: String;
    FValorTotal: String;
    FICMS: String;
    FEndereco: String;
    FValorFrete: String;
    FBaseICMS: String;
    FValorTotIPI: String;
    FValorICMSSubst: String;
    FMunicipio: String;
    FNumNota: String;
    FIPI: String;
    FValorIPI: String;
    FDataEmissao: String;
    FDataBaseName: String;
    FBeforePrintLinhas: TBeforePrintLinhas;
    // Propriedades locais
    _ValorCampo    : Array[1..MaxCampos] of String;
    _Gimp          : TGimp;
    _qry           : TwwQuery;
    _qryDet        : TwwQuery;
    FModeloNota: Integer;

    procedure SetBairro(const Value: String);
    procedure SetBaseICMS(const Value: String);
    procedure SetBaseICMSSubst(const Value: String);
    procedure SetCEP(const Value: String);
    procedure SetCFOP(const Value: String);
    procedure SetCGC_Cpf(const Value: String);
    procedure SetCodProduto(const Value: String);
    procedure SetDataEntSai(const Value: String);
    procedure SetDescProduto(const Value: String);
    procedure SetEndereco(const Value: String);
    procedure SetFone_Fax(const Value: String);
    procedure SetICMS(const Value: String);
    procedure SetIndEntSai(const Value: String);
    procedure SetInscEstadual(const Value: String);
    procedure SetIPI(const Value: String);
    procedure SetMunicipio(const Value: String);
    procedure SetNaturezaOp(const Value: String);
    procedure SetNumNota(const Value: String);
    procedure SetOutrasDesp(const Value: String);
    procedure SetQuantidade(const Value: String);
    procedure SetRazaoSocial(const Value: String);
    procedure SetUF(const Value: String);
    procedure SetUnidMedida(const Value: String);
    procedure SetValorFrete(const Value: String);
    procedure SetValorICMS(const Value: String);
    procedure SetValorICMSSubst(const Value: String);
    procedure SetValorIPI(const Value: String);
    procedure SetValorSeguro(const Value: String);
    procedure SetValorTotal(const Value: String);
    procedure SetValorTotIPI(const Value: String);
    procedure SetValorTotNota(const Value: String);
    procedure SetValorTotProduto(const Value: String);
    procedure SetValorUnit(const Value: String);
    procedure SetDataEmissao(const Value: String);
    procedure SetBeforePrintLinhas(const Value: TBeforePrintLinhas);
    procedure SetDataBaseName(const Value: String);
    procedure SetModeloNota(const Value: Integer);
  Public
      property IndEntSai         : String read FIndEntSai write SetIndEntSai;
      property NumNota           : String read FNumNota write SetNumNota;
      property NaturezaOp        : String read FNaturezaOp write SetNaturezaOp;
      property CFOP              : String read FCFOP write SetCFOP;
      property RazaoSocial       : String read FRazaoSocial write SetRazaoSocial;
      property CGC_Cpf           : String read FCGC_Cpf write SetCGC_Cpf;
      property Endereco          : String read FEndereco write SetEndereco;
      property Bairro            : String read FBairro write SetBairro;
      property CEP               : String read FCEP write SetCEP;
      property Municipio         : String read FMunicipio write SetMunicipio;
      property Fone_Fax          : String read FFone_Fax write SetFone_Fax;
      property UF                : String read FUF write SetUF;
      property InscEstadual      : String read FInscEstadual write SetInscEstadual;
      property DataEmissao       : String read FDataEmissao write SetDataEmissao;
      property DataEntSai        : String read FDataEntSai write SetDataEntSai;
      property CodProduto        : String read FCodProduto write SetCodProduto;
      property DescProduto       : String read FDescProduto write SetDescProduto;
      property UnidMedida        : String read FUnidMedida write SetUnidMedida;
      property Quantidade        : String read FQuantidade write SetQuantidade;
      property ValorUnit         : String read FValorUnit write SetValorUnit;
      property ValorTotal        : String read FValorTotal write SetValorTotal;
      property ICMS              : String read FICMS write SetICMS;
      property IPI               : String read FIPI write SetIPI;
      property ValorIPI          : String read FValorIPI write SetValorIPI;
      property BaseICMS          : String read FBaseICMS write SetBaseICMS;
      property ValorICMS         : String read FValorICMS write SetValorICMS;
      property BaseICMSSubst     : String read FBaseICMSSubst write SetBaseICMSSubst;
      property ValorICMSSubst    : String read FValorICMSSubst write SetValorICMSSubst;
      property ValorTotProduto   : String read FValorTotProduto write SetValorTotProduto;
      property ValorFrete        : String read FValorFrete write SetValorFrete;
      property ValorSeguro       : String read FValorSeguro write SetValorSeguro;
      property OutrasDesp        : String read FOutrasDesp write SetOutrasDesp;
      property ValorTotIPI       : String read FValorTotIPI write SetValorTotIPI;
      property ValorTotNota      : String read FValorTotNota write SetValorTotNota;

      property DataBaseName      : String read FDataBaseName write SetDataBaseName;
      property ModeloNota        : Integer read FModeloNota write SetModeloNota;
      property BeforePrintLinhas : TBeforePrintLinhas read FBeforePrintLinhas write SetBeforePrintLinhas;

      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;

      function  Inicializar: Boolean;
      procedure Finalizar;
      procedure ImprimeNota;
      procedure ImprimeMapa;
      procedure DoBeforePrintLinhas(var CodProduto, DescProduto, UnidMedida :String; var Quantidade, ValorUnit, ValorTotal, ICMS, IPI, ValorIPI : Double; var CanPrint: Boolean; iItemDet: Integer);
  End;

implementation

{ TConfigNfDevol }

constructor TConfigNfDevol.Create(AOwner: TComponent);
begin
  inherited;
  _Gimp   := TGimp.Create(AOwner);
  _Gimp.MostraPrinterSetup := True;
  _Qry    := TwwQuery.Create(AOwner);
  _QryDet := TwwQuery.Create(AOwner);

  FInscEstadual    := '';
  FNaturezaOp      := '';
  FBaseICMSSubst   := '';
  FBairro          := '';
  FDataEntSai      := '';
  FCEP             := '';
  FValorTotProduto := '';
  FCGC_Cpf         := '';
  FValorTotNota    := '';
  FDescProduto     := '';
  FQuantidade      := '';
  FIndEntSai       := '';
  FValorUnit       := '';
  FRazaoSocial     := '';
  FCodProduto      := '';
  FCFOP            := '';
  FOutrasDesp      := '';
  FValorSeguro     := '';
  FUnidMedida      := '';
  FFone_Fax        := '';
  FValorICMS       := '';
  FUF              := '';
  FValorTotal      := '';
  FICMS            := '';
  FEndereco        := '';
  FValorFrete      := '';
  FBaseICMS        := '';
  FValorTotIPI     := '';
  FValorICMSSubst  := '';
  FMunicipio       := '';
  FNumNota         := '';
  FIPI             := '';
  FValorIPI        := '';
  FDataEmissao     := '';
  FDataBaseName    := '';
end;

destructor TConfigNfDevol.Destroy;
begin
  _Gimp.Free;
  _Qry.Free;
  _QryDet.Free;
  inherited;
end;



procedure TConfigNfDevol.DoBeforePrintLinhas(var CodProduto, DescProduto,
  UnidMedida: String; var Quantidade, ValorUnit, ValorTotal, ICMS, IPI,
  ValorIPI: Double; var CanPrint: Boolean; iItemDet: Integer);
begin

if Assigned(BeforePrintLinhas) then
    BeforePrintLinhas(CodProduto, DescProduto, UnidMedida,Quantidade, ValorUnit, ValorTotal, ICMS, IPI, ValorIPI, CanPrint, iItemDet);

end;

procedure TConfigNfDevol.Finalizar;
begin
    _Gimp.Finalizar;
end;

procedure TConfigNfDevol.ImprimeMapa;
var
  X: Integer;
begin
  _Gimp.ImprimirCodigo(_Gimp.ComandosConfig.cRESETCONDENSADO);
  _Gimp.ImprimirCodigo(_Gimp.ComandosConfig.cDRAFT);
  for X := 1 to 64 do
    if (X mod 2) = 0 then
      _Gimp.ImprimirTexto('.........10........20........30........40........50........60........70........80')
    else
      if X < 10 then
        _Gimp.ImprimirTexto('L 0' + IntToStr(X) + '.....10........20........30........40........50........60........70........80')
      else
        _Gimp.ImprimirTexto('L ' + IntToStr(X) + '.....10........20........30........40........50........60........70........80');
  _Gimp.ImprimirTexto('_');
end;

procedure TConfigNfDevol.ImprimeNota;
Const
     INICIODET = 16;
     FINDET = 24;
Type
     TItemsNota = record
        FLGALINHAMENTO : string;
        IDCAMPONFDEVOL : Integer;
        COLUNA         : Integer;
        TAMANHO        : Integer;
     end;
Var
    iLinhaAnterior : Integer;
    iLinha         : Integer;
    x,i            : Integer;
    ItemsNota      : Array[1..9] Of TItemsNota;
    bComecaItems   : Boolean;
    sTexto         : String;
    sLinha         : String;

    CodProduto, DescProduto, UnidMedida :String;
    Quantidade, ValorUnit, ValorTotal, ICMS, IPI, ValorIPI : Double;
    CanPrint: Boolean;
    iItemDet: Integer;
begin
 bComecaItems   := False;
 iLinhaAnterior := 0;
 iLinha         := 0;
 If (not _qry.IsEmpty) and (not _qryDet.IsEmpty) and (FModeloNota > 0) Then
     Begin
        _Gimp.Condensado := (_qry.FieldByName('FLGCONDENSADO').AsString = 'S');
        _Gimp.ImprimirCodigo(_Gimp.ComandosConfig.cRESETCONDENSADO);
        _Gimp.ImprimirCodigo(_Gimp.ComandosConfig.cDRAFT);
        //Verfica a posição dos campos do modelo selecionado.
        _QryDet.First;
        while not _QryDet.EOF Do
        Begin
           iLinha := _QryDet.FieldByName('LINHA').AsInteger;
           If (_QryDet.FieldByName('LINHA').AsInteger <> 0) And
              (_QryDet.FieldByName('COLUNA').AsInteger <> 0)
           Then
           Begin
              If iLinha <> iLinhaAnterior Then
              Begin
                 _Gimp.ImprimirTexto(sLInha);
                 sLInha := '';
                 // Imprime os Items da Nota
                 If bComecaItems Then
                 Begin
                    iItemDet := 0;
                    Repeat
                       CanPrint := False;
                       CodProduto := '';
                       DescProduto := '';
                       UnidMedida := '';
                       Quantidade := 0;
                       ValorUnit := 0;
                       ValorTotal := 0;
                       ICMS := 0;
                       IPI := 0;
                       ValorIPI := 0;

                       DoBeforePrintLinhas(CodProduto, DescProduto, UnidMedida,Quantidade, ValorUnit, ValorTotal, ICMS, IPI, ValorIPI, CanPrint, iItemDet);

                       sLInha := '';
                       If CanPrint Then
                       begin
                           If Trim(DescProduto) <> '' Then
                           Begin
                             _ValorCampo[INICIODET    ] := CodProduto;
                             _ValorCampo[INICIODET + 1] := DescProduto;
                             _ValorCampo[INICIODET + 2] := UnidMedida;
                             _ValorCampo[INICIODET + 3] := FormatFloat('#,##0.00',Quantidade);
                             _ValorCampo[INICIODET + 4] := FormatFloat('#,##0.00',ValorUnit);
                             _ValorCampo[INICIODET + 5] := FormatFloat('#,##0.00',ValorTotal);
                             _ValorCampo[INICIODET + 6] := FormatFloat('#,##0.00',ICMS);
                             _ValorCampo[INICIODET + 7] := FormatFloat('#,##0.00',IPI);
                             _ValorCampo[INICIODET + 8] := FormatFloat('#,##0.00',ValorIPI);
                             // Monta a Linha do detalhe
                             For x := 1 To 9 Do
                             Begin
                                //Alinhamento do Campo se Esquerda ou Direita
                                If ItemsNota[x].FLGALINHAMENTO = 'D' then
                                  sTexto := FuncaoGeral.AD(_ValorCampo[x + (INICIODET - 1)], ItemsNota[x].TAMANHO)
                                Else
                                  sTexto := FuncaoGeral.AE(_ValorCampo[x + (INICIODET - 1)], ItemsNota[x].TAMANHO);
                                //Verifica se é o primeiro campo.
                                If (ItemsNota[x].COLUNA - Length(sLInha)) >= 0 then
                                  sLInha := sLInha + FuncaoGeral.AE(' ', ItemsNota[x].COLUNA - Length(sLInha)) + sTexto
                                Else
                                  sLInha := sLInha + FuncaoGeral.AE(' ',Length(sLInha) -  ItemsNota[x].COLUNA) + sTexto;
                            End;

                            _Gimp.ImprimirTexto(sLinha);
                            sLInha := '';
                            Inc(iLinhaAnterior);
                            Inc(iItemDet);
                          End;
                       End;
                    Until Not CanPrint;
                 End;
                 //SAlta
                 for X := iLinhaAnterior to (iLinha - 2) do
                    _Gimp.ImprimirTexto('_');
              End;
              bComecaItems := (_qryDet.FieldByName('IDCAMPONFDEVOL').AsInteger in [INICIODET..FINDET]);
              i            := _qryDet.FieldByName('IDCAMPONFDEVOL').AsInteger;
              If i in [INICIODET..FINDET] Then
              Begin
                 ItemsNota[i - (INICIODET-1)].IDCAMPONFDEVOL  := _qryDet.FieldByName('IDCAMPONFDEVOL').AsInteger;
                 ItemsNota[i - (INICIODET-1)].TAMANHO         := _qryDet.FieldByName('TAMANHO').AsInteger;
                 ItemsNota[i - (INICIODET-1)].COLUNA          := _qryDet.FieldByName('COLUNA').AsInteger;
                 ItemsNota[i - (INICIODET-1)].FLGALINHAMENTO  := _qryDet.FieldByName('FLGALINHAMENTO').AsString;
              End
              Else
              Begin
                //Alinhamento do Campo se Esquerda ou Direita
                If _qryDet.FieldByName('FLGALINHAMENTO').AsString = 'D' then
                  sTexto := FuncaoGeral.ad(_ValorCampo[i], _qryDet.FieldByName('TAMANHO').AsInteger)
                Else
                  sTexto := FuncaoGeral.AE(_ValorCampo[i], _qryDet.FieldByName('TAMANHO').AsInteger);
                //Verifica se é o primeiro campo.
                If (_qryDet.FieldByName('COLUNA').AsInteger - Length(sLInha)) > 0 then
                  sLInha := sLInha + FuncaoGeral.AE(' ', _qryDet.FieldByName('COLUNA').AsInteger - Length(sLInha)) + sTexto
                Else
                  sLInha := sLInha + FuncaoGeral.AE(' ', _qryDet.FieldByName('COLUNA').AsInteger) + sTexto;
              End;
           End;
           iLinhaAnterior := _QryDet.FieldByName('LINHA').AsInteger;
           _qryDet.Next;
        End;
     End;

     if sLInha <> '' then
       _Gimp.ImprimirTexto(sLInha);

     for X := iLinha to (64) do
       _Gimp.ImprimirTexto('_');
end;

function TConfigNfDevol.Inicializar: Boolean;
begin
  Result := _Gimp.Inicializar;
end;

procedure TConfigNfDevol.SetBairro(const Value: String);
begin
  FBairro := Value;
  _ValorCampo[08]:= Value;
end;

procedure TConfigNfDevol.SetBaseICMS(const Value: String);
begin
  FBaseICMS := Value;
  _ValorCampo[25]:= Value;
end;

procedure TConfigNfDevol.SetBaseICMSSubst(const Value: String);
begin
  FBaseICMSSubst := Value;
  _ValorCampo[27]:= Value;
end;

procedure TConfigNfDevol.SetBeforePrintLinhas(
  const Value: TBeforePrintLinhas);
begin
  FBeforePrintLinhas := Value;
end;

procedure TConfigNfDevol.SetCEP(const Value: String);
begin
  FCEP := Value;
  _ValorCampo[09]:= Value;
end;

procedure TConfigNfDevol.SetCFOP(const Value: String);
begin
  FCFOP := Value;
  _ValorCampo[04]:= Value;
end;

procedure TConfigNfDevol.SetCGC_Cpf(const Value: String);
begin
  FCGC_Cpf := Value;
  _ValorCampo[06]:= Value;
end;

procedure TConfigNfDevol.SetCodProduto(const Value: String);
begin
  FCodProduto := Value;
  _ValorCampo[16]:= Value;
end;

procedure TConfigNfDevol.SetDataBaseName(const Value: String);
begin
  FDataBaseName := Value;
  if _Qry.Active then
     _Qry.CLOSE;
  if _QryDet.Active then
     _QryDet.CLOSE;

  _Qry.DataBaseName := Value;
  _QryDet.DataBaseName := Value;
  _Gimp.DataBaseName := Value;
end;

procedure TConfigNfDevol.SetDataEmissao(const Value: String);
begin
  FDataEmissao := Value;
  _ValorCampo[14]:= Value;
end;

procedure TConfigNfDevol.SetDataEntSai(const Value: String);
begin
  FDataEntSai := Value;
  _ValorCampo[15]:= Value;
end;

procedure TConfigNfDevol.SetDescProduto(const Value: String);
begin
  FDescProduto := Value;
  _ValorCampo[17]:= Value;
end;

procedure TConfigNfDevol.SetEndereco(const Value: String);
begin
  FEndereco := Value;
  _ValorCampo[07]:= Value;
end;

procedure TConfigNfDevol.SetFone_Fax(const Value: String);
begin
  FFone_Fax := Value;
  _ValorCampo[11]:= Value;
end;

procedure TConfigNfDevol.SetICMS(const Value: String);
begin
  FICMS := Value;
  _ValorCampo[16]:= Value;
end;

procedure TConfigNfDevol.SetIndEntSai(const Value: String);
begin
  FIndEntSai := Value;
  _ValorCampo[01]:= Value;
end;

procedure TConfigNfDevol.SetInscEstadual(const Value: String);
begin
  FInscEstadual := Value;
  _ValorCampo[13]:= Value;
end;

procedure TConfigNfDevol.SetIPI(const Value: String);
begin
  FIPI := Value;
  _ValorCampo[23]:= Value;
end;

procedure TConfigNfDevol.SetModeloNota(const Value: Integer);
begin
  FModeloNota := Value;
  If Value > 0 then
     Begin
        If _qry.Active then _qry.Close;
           _qry.Sql.Text :=' SELECT '+
                           '      IDTEMPLNFDEVOL,    '+
                           '      DESCTEMPLNFDEVOL,  '+
                           '      ICMSNOTA,          '+
                           '      ICMSITEM,          '+
                           '      ICMSSUBSTITUICAO,  '+
                           '      IPIITEM,           '+
                           '      FRETE,             '+
                           '      SEGURO,            '+
                           '      OUTRASDESP,        '+
                           '      FLGCONDENSADO,     '+
                           '      IDDOCUMENTO        '+   
                           ' FROM                    '+
                           '      TEMPLNFDEVOL       '+
                           ' WHERE                   '+
                           '      (IDTEMPLNFDEVOL = '+IntToStr(Value)+')';
          _qry.Open;

        If _qryDet.Active then _qryDet.Close;
           _qryDet.Sql.Text :=' SELECT '+
                              '      IDCONFIGNFDEVOL, '+
                              '      IDTEMPLNFDEVOL,  '+
                              '      IDCAMPONFDEVOL,  '+
                              '      LINHA,           '+
                              '      COLUNA,          '+
                              '      TAMANHO,         '+
                              '      FLGALINHAMENTO   '+
                              ' FROM'+
                              '      CONFIGNFDEVOL'+
                              ' WHERE '+
                              '      (IDTEMPLNFDEVOL = '+IntToStr(Value)+')'+
                              ' ORDER BY LINHA, COLUNA ';
           _qryDet.Open;
     End;
end;

procedure TConfigNfDevol.SetMunicipio(const Value: String);
begin
  FMunicipio := Value;
  _ValorCampo[10]:= Value;
end;

procedure TConfigNfDevol.SetNaturezaOp(const Value: String);
begin
  FNaturezaOp := Value;
  _ValorCampo[03]:= Value;
end;

procedure TConfigNfDevol.SetNumNota(const Value: String);
begin
  FNumNota := Value;
  _ValorCampo[02]:= Value;
end;

procedure TConfigNfDevol.SetOutrasDesp(const Value: String);
begin
  FOutrasDesp := Value;
  _ValorCampo[32]:= Value;
end;

procedure TConfigNfDevol.SetQuantidade(const Value: String);
begin
  FQuantidade := Value;
  _ValorCampo[19]:= Value;
end;

procedure TConfigNfDevol.SetRazaoSocial(const Value: String);
begin
  FRazaoSocial := Value;
  _ValorCampo[05]:= Value;
end;

procedure TConfigNfDevol.SetUF(const Value: String);
begin
  FUF := Value;
  _ValorCampo[12]:= Value;
end;

procedure TConfigNfDevol.SetUnidMedida(const Value: String);
begin
  FUnidMedida := Value;
  _ValorCampo[16]:= Value;
end;

procedure TConfigNfDevol.SetValorFrete(const Value: String);
begin
  FValorFrete := Value;
  _ValorCampo[30]:= Value;
end;

procedure TConfigNfDevol.SetValorICMS(const Value: String);
begin
  FValorICMS := Value;
  _ValorCampo[26]:= Value;
end;

procedure TConfigNfDevol.SetValorICMSSubst(const Value: String);
begin
  FValorICMSSubst := Value;
  _ValorCampo[28]:= Value;
end;

procedure TConfigNfDevol.SetValorIPI(const Value: String);
begin
  FValorIPI := Value;
  _ValorCampo[24]:= Value;
end;

procedure TConfigNfDevol.SetValorSeguro(const Value: String);
begin
  FValorSeguro := Value;
  _ValorCampo[31]:= Value;
end;

procedure TConfigNfDevol.SetValorTotal(const Value: String);
begin
  FValorTotal := Value;
  _ValorCampo[21]:= Value;
end;

procedure TConfigNfDevol.SetValorTotIPI(const Value: String);
begin
  FValorTotIPI := Value;
  _ValorCampo[33]:= Value;
end;

procedure TConfigNfDevol.SetValorTotNota(const Value: String);
begin
  FValorTotNota := Value;
  _ValorCampo[34]:= Value;
end;

procedure TConfigNfDevol.SetValorTotProduto(const Value: String);
begin
  FValorTotProduto := Value;
  _ValorCampo[29]:= Value;
end;

procedure TConfigNfDevol.SetValorUnit(const Value: String);
begin
  FValorUnit := Value;
  _ValorCampo[20]:= Value;
end;

end.
